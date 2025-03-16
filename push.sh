#!/bin/bash
SECONDS=0
# ---------------------------------------------------
YEAR=`date '+%Y'`
MONTH=`date '+%m'`
DAY=`date '+%d'`
# ---------------------------------------------------
{
echo "==== add all ===="
git add --verbose -A
echo "==== commit ===="
git commit --verbose -a -m "daily backup"
echo "==== push ===="
git push --verbose
echo "==== done ===="
# how long did it take
DURATION=$SECONDS
echo "$(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds elapsed."
}  >> ${HOME}/birding-data/logs/${YEAR}-${MONTH}-${DAY}-push.out 2>> ${HOME}/birding-data/logs/${YEAR}-${MONTH}-${DAY}-push.err
