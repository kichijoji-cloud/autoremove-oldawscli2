#!/bin/bash

STARTDIR=`pwd`
SCRIPTDIR=$(cd $(dirname $0); pwd)
function autoremove_oldAWSCLIv2 () {
numsaved=1

#echo "$#"
if [[ "$#" < 1 ]]; then
 echo "you need argument for target directory."
 exit 1
fi

#v2dir=/usr/local/aws-cli/v2/
v2dir=$1

#echo "$v2dir"
retest='^[0-9\.]+$'

if [[ -d "$v2dir" ]]; then
 :
else
 echo $v2dir
 echo "illegal target directory."
 exit 1
fi

#cntv2=`ls $v2dir |wc -l`
cntcur=`ls $v2dir |grep -E '^[0-9\.]+$' -c`

## easy test for directory. (must not use "/" directory.)
if [ `echo "$v2dir" |grep -o '/'|wc -l` -lt 2 ]; then
 echo "illegal awscli2 directory. "
 exit 1
fi

cd "$v2dir"
#maxcnt=$(($cntcur-1))
#echo $maxcnt

icnt=0
for v2ver in `ls $v2dir|grep -E '^[0-9\.]+$'|sort -V`
do
 if [[ "$v2ver" =~ $retest ]] ; then
  ((icnt=icnt+1))
  if [ $icnt -ge $cntcur ] ; then
   echo "save $v2dir/$v2ver"
   :
  else
   if [ -d "$v2ver" ]; then
    rm -rf "$v2ver"
   fi
  fi
 fi
done

}


autoremove_oldAWSCLIv2  /usr/local/aws-cli/v2/
cd "$STARTDIR"
