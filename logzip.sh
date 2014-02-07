#! /usr/bin/env sh
# compess log files created 1 week ago
# delete them after more 1 week
# file format -> yyyymmdd-hh:mm:log(refer to screenrc)

# set data
if [ $1 ]; then
  if [[ ! $1 =~ "2[0-9]{3}[01][0-9][0123][0-9]$" ]]; then
    echo "invalid argument. please write as YYYYMMDD"
    exit 0
  else
    DATE_C=$1
  fi
else
  DATE_C=`date -d '1 day ago' '+%Y%m%d'`
fi

DATE_D=`date -d '2 week ago' '+%Y%m%d'`

# change file path for each env
cd ~/log/local/

if ls $DATE_C* > /dev/null 2>&1
then
  tar cvf $DATE_C $DATE_C*
  gzip $DATE_C
  rm $DATE_C-*
  echo 'deleted '$DATE_C' log files'
fi

if ls $DATE_D > /dev/null 2>&1
then
  rm $DATE_D
  echo 'deleted '$DATE_D' compressed file'
fi
