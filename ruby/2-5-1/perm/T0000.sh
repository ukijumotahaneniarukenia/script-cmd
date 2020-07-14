#!/usr/bin/env bash

TEST_START_TIME=$(date '+%s') #開始時刻控える

echo '/log/*'>>.gitignore

mkdir -p log

LOG_DIR=log

CMD=$(pwd|ruby -F'/' -anle 'puts "./"+$F[$F.size-1]+"-"+$F[$F.size-3]')
CMD_WITH_VERSION=$(pwd|ruby -F'/' -anle 'puts $F[$F.size-1]+"-"+$F[$F.size-3]+"-"+$F[$F.size-2]')
DTM=$(date "+%Y-%m-%dT%H-%M-%S")

RT=0
DONE_CNT=0
ERROR_CNT=0
SUCCESS_CNT=0

TOTAL_CNT=$(echo "$(ls T[0-9]*-*|grep -v log|xargs -n1|wc -l)/2"|bc)

while read IN OUT;do
  SUCCESS_LOG_FILE_NAME=$LOG_DIR/$(grep -Po 'T\d+'<<<$IN)-$DTM-success.log
  ERROR_LOG_FILE_NAME=$LOG_DIR/$(grep -Po 'T\d+'<<<$IN)-$DTM-error.log

  diff <($CMD $(cat $IN)) $OUT 1>/dev/null 2>&1;

  if [[ $? -eq 1 ]];then
    echo $IN $OUT >>$ERROR_LOG_FILE_NAME
    ERROR_CNT=$((ERROR_CNT+1))
    RT=$((RT+1))
  else
    echo $IN $OUT >>$SUCCESS_LOG_FILE_NAME
    SUCCESS_CNT=$((SUCCESS_CNT+1))
  fi

  DONE_CNT=$((DONE_CNT+1))

done < <(ls T[0-9]*-*|grep -v log|xargs -n1|xargs -n2)

TEST_END_TIME=$(date '+%s') #終了時刻控える

TEST_ELAPSED_TIME=$(expr $TEST_END_TIME - $TEST_START_TIME)

printf "TEST_CMD:%s\n" $CMD_WITH_VERSION
printf "TEST_ELAPSED_TIME[s]:%s\n" $TEST_ELAPSED_TIME
printf "TOTAL_CNT:%s\n" $TOTAL_CNT
printf "DONE_CNT:%s\n" $DONE_CNT
printf "SUCCESS_CNT:%s\n" $SUCCESS_CNT
printf "ERROR_CNT:%s\n" $ERROR_CNT

if [[ $RT -ne 0 ]];then
  RT=1
fi

exit $RT
