# this script is for InsulaSubregionalConnectivities study, writen by Haichao Zhao in 2021-06-01
# pwd = /expdata2/insula.validation

logdate=`date +%Y%m%d_%T`
basedir=/expdata2/insula.validation
datadir=/expdata2/insula.validation/data
designdir=/expdata2/insula.validation/design

mkdir -p ${basedir}/logs
mkdir -p ${designdir}

tar -xzvf Designs.tar.gz -C ${designdir}/

b1s=$(ls ${datadir})
pipe (){
local sta=$1
local num=$2
echo "process $sta : $((sta + num))"

for sub in  $(echo $b1s | cut -f$sta-$((sta+num)) -d " ")
do
  echo $sub
  sed -e "s/sub25632/${sub}/g" ${designdir}/preprocessing.fsf > ${datadir}/${sub}/analysis/preprocessing.fsf
  feat ${datadir}/${sub}/analysis/preprocessing.fsf
  fast -t 1 -n 3 -H 0.1 -I 4 -l 20.0 -o ${datadir}/${sub}/data/mprage_brain ${datadir}/${sub}/data/mprage_brain

  echo 'sed' -e "s/sub25632/${sub}/g" ${designdir}/preprocessing.fsf > ${datadir}/${sub}/analysis/preprocessing.fsf >> ${basedir}/logs/${sub}_s01.txt
  echo feat ${datadir}/${sub}/analysis/preprocessing.fsf >> $basedir/logs/${sub}_s01.txt
  echo fast -t 1 -n 3 -H 0.1 -I 4 -l 20.0 -o ${datadir}/${sub}/data/mprage_brain ${datadir}/${sub}/data/mprage_brain >> ${basedir}/logs/${sub}_s01.txt
done
}
pipe 1 9 &
pipe 11 9 &
pipe 21 9 &
pipe 31 9 &
pipe 41 9 &
pipe 51 9 &
pipe 61 9 &
pipe 71 9 &
pipe 81 9 &
pipe 91 9 &
pipe 101 9 &
pipe 111 9 &
pipe 121 9 &
pipe 131 9 &
pipe 141 9 &
pipe 151 9 &
pipe 161 9 &
pipe 171 9 &
pipe 181 9 &
pipe 191 9 &
pipe 201 9 &
pipe 211 9 &
pipe 221 6 &
wait
echo -e "time-consuming: $SECONDS seconds"
