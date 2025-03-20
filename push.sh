#!/bin/bash
SECONDS=0
# ---------------------------------------------------
YEAR=`date '+%Y'`
MONTH=`date '+%m'`
DAY=`date '+%d'`
# ---------------------------------------------------
{
pushd ${HOME}/birding-data
echo "==== remove old ===="
find ${HOME}/birding-data/ -type f -mtime +2 -name "*-birds.db.gz" -exec git rm {} \;
echo "==== add all ===="
git add --verbose -A
echo "==== commit ===="
git commit --verbose -a -m "daily backup"
echo "==== push ===="
# avoid user/pass prompt by using ssh and shared rsa key
git push --verbose
echo "==== done ===="
popd
# how long did it take
DURATION=$SECONDS
echo "$(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds elapsed."
}  >> ${HOME}/birding-data/logs/${YEAR}-${MONTH}-${DAY}-push.out 2>> ${HOME}/birding-data/logs/${YEAR}-${MONTH}-${DAY}-push.err