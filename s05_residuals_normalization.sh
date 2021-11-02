# this script is for InsulaSubregionalConnectivities study, writen by Haichao Zhao in 2021-06-01
# pwd = /expdata2/insula.validation

logdate=`date +%Y%m%d_%T`
basedir=/expdata2/insula.validation
datadir=/expdata2/insula.validation/data

mkdir -p ${basedir}/logs

b1s=$(ls ${datadir})
pipe (){
local sta=$1
local num=$2
echo "process $sta : $((sta + num))"

for sub in  $(echo $b1s | cut -f$sta-$((sta+num)) -d " ")
do

  echo ${sub}

  for roi in lDAI lPI lVAI rDAI rPI rVAI
  do
    fslmeants -i ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -m ${datadir}/${sub}/roi/standard2func_${roi} -o ${datadir}/${sub}/roi/roi_${roi}.txt
     echo fslmeants -i ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -m ${datadir}/${sub}/roi/standard2func_${roi} -o ${datadir}/${sub}/roi/roi_${roi}.txt >> ${basedir}/logs/pro_log_${sub}_s5.txt
  done

  fslmaths ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -Tmean ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_mean
  fslmaths ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -Tstd ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_std
  fslmaths ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -sub ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_mean -div ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_std -add 100 ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_scaled

  echo fslmaths ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -Tmean ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_mean >> ${basedir}/logs/pro_log_${sub}_s5.txt
  echo fslmaths ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -Tstd ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_std >> ${basedir}/logs/pro_log_${sub}_s5.txt
  echo fslmaths ${datadir}/${sub}/analysis/regressor.feat/stats/res4d -sub ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_mean -div ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_std -add 100 ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_scaled  >> ${basedir}/logs/pro_log_${sub}_s5.txt

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
