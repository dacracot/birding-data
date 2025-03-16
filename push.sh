#!/bin/bash
SECONDS=0
# ---------------------------------------------------
YEAR=`date '+%Y'`
MONTH=`date '+%m'`
DAY=`date '+%d'`
# ---------------------------------------------------
{
git add -A
git commit -m "daily backup"
git push
# how long did it take
DURATION=$SECONDS
echo "$(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds elapsed."
}  >> ${HOME}/birding-data/logs/${YEAR}-${MONTH}-${DAY}-push.out 2>> ${HOME}/birding-data/logs/${YEAR}-${MONTH}-${DAY}-push.err
