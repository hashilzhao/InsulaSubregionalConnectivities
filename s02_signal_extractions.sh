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
  mkdir -p  ${datadir}/${sub}/roi
  flirt -in ${datadir}/${sub}/data/mprage_brain_pve_0.nii.gz -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/analysis/prepro.feat/high2func_csf.nii.gz
  flirt -in ${datadir}/${sub}/data/mprage_brain_pve_2.nii.gz -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/analysis/prepro.feat/high2func_wm.nii.gz
  fslmeants -i ${datadir}/${sub}/analysis/prepro.feat/filtered_func_data -m ${datadir}/${sub}/analysis/prepro.feat/high2func_csf.nii.gz > ${datadir}/${sub}/analysis/prepro.feat/csf.txt
  fslmeants -i ${datadir}/${sub}/analysis/prepro.feat/filtered_func_data -m ${datadir}/${sub}/analysis/prepro.feat/high2func_wm.nii.gz > ${datadir}/${sub}/analysis/prepro.feat/wm.txt
  paste -d '' ${datadir}/${sub}/analysis/prepro.feat/mc/prefiltered_func_data_mcf.par > ${datadir}/${sub}/analysis/prepro.feat/confoundevs.txt

  flirt -in ${basedir}/b_roi/lDAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_lDAI
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_lDAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_lDAI
  fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_lDAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_lDAI
  flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_lDAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_lDAI
  fslmaths ${datadir}/${sub}/roi/standard2func_lDAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_lDAI
  flirt -in ${basedir}/b_roi/rDAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_rDAI
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_rDAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_rDAI
  fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_rDAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_rDAI
  flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_rDAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_rDAI
  fslmaths ${datadir}/${sub}/roi/standard2func_rDAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_rDAI

  flirt -in ${basedir}/b_roi/lVAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_lVAI
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_lVAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_lVAI
  fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_lVAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_lVAI
  flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_lVAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_lVAI
  fslmaths ${datadir}/${sub}/roi/standard2func_lVAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_lVAI
  flirt -in ${basedir}/b_roi/rVAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_rVAI
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_rVAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_rVAI
  fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_rVAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_rVAI
  flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_rVAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_rVAI
  fslmaths ${datadir}/${sub}/roi/standard2func_rVAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_rVAI

  flirt -in ${basedir}/b_roi/lPI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_lPI
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_lPI --out=${datadir}/${sub}/roi/fnirted_standard2highres_lPI
  fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_lPI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_lPI
  flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_lPI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_lPI
  fslmaths ${datadir}/${sub}/roi/standard2func_lPI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_lPI
  flirt -in ${basedir}/b_roi/rPI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_rPI
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_rPI --out=${datadir}/${sub}/roi/fnirted_standard2highres_rPI
  fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_rPI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_rPI
  flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_rPI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_rPI
  fslmaths ${datadir}/${sub}/roi/standard2func_rPI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_rPI

  echo flirt -in ${datadir}/${sub}/data/mprage_brain_pve_0.nii.gz -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/analysis/prepro.feat/high2func_csf.nii.gz >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/data/mprage_brain_pve_2.nii.gz -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/analysis/prepro.feat/high2func_wm.nii.gz >> ${basedir}/logs/${sub}_s2.txt
  echo fslmeants -i ${datadir}/${sub}/analysis/prepro.feat/filtered_func_data -m ${datadir}/${sub}/analysis/prepro.feat/high2func_csf.nii.gz '>' ${datadir}/${sub}/analysis/prepro.feat/csf.txt >> ${basedir}/logs/${sub}_s2.txt
  echo fslmeants -i ${datadir}/${sub}/analysis/prepro.feat/filtered_func_data -m ${datadir}/${sub}/analysis/prepro.feat/high2func_wm.nii.gz '>' ${datadir}/${sub}/analysis/prepro.feat/wm.txt >> ${basedir}/logs/${sub}_s2.txt
  echo paste -d '' ${datadir}/${sub}/analysis/prepro.feat/mc/prefiltered_func_data_mcf.par '>' ${datadir}/${sub}/analysis/prepro.feat/confoundevs.txt >> ${basedir}/logs/${sub}_s2.txt

  echo flirt -in ${basedir}/b_roi/lDAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_lDAI >> ${basedir}/logs/${sub}_s2.txt
  echo applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_lDAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_lDAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_lDAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_lDAI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_lDAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_lDAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/standard2func_lDAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_lDAI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${basedir}/b_roi/rDAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_rDAI >> ${basedir}/logs/${sub}_s2.txt
  echo applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_rDAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_rDAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_rDAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_rDAI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_rDAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_rDAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/standard2func_rDAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_rDAI >> ${basedir}/logs/${sub}_s2.txt

  echo flirt -in ${basedir}/b_roi/lVAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_lVAI >> ${basedir}/logs/${sub}_s2.txt
  echo applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_lVAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_lVAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_lVAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_lVAI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_lVAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_lVAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/standard2func_lVAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_lVAI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${basedir}/b_roi/rVAI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_rVAI >> ${basedir}/logs/${sub}_s2.txt
  echo applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_rVAI --out=${datadir}/${sub}/roi/fnirted_standard2highres_rVAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_rVAI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_rVAI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_rVAI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_rVAI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/standard2func_rVAI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_rVAI >> ${basedir}/logs/${sub}_s2.txt

  echo flirt -in ${basedir}/b_roi/lPI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_lPI >> ${basedir}/logs/${sub}_s2.txt
  echo applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_lPI --out=${datadir}/${sub}/roi/fnirted_standard2highres_lPI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_lPI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_lPI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_lPI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_lPI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/standard2func_lPI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_lPI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${basedir}/b_roi/rPI -ref ${datadir}/${sub}/data/mprage_brain -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/standard2highres.mat -out ${datadir}/${sub}/roi/standard2highres_rPI >> ${basedir}/logs/${sub}_s2.txt
  applywarp --ref=${datadir}/${sub}/data/mprage_brain --in=${datadir}/${sub}/roi/standard2highres_rPI --out=${datadir}/${sub}/roi/fnirted_standard2highres_rPI >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/fnirted_standard2highres_rPI -thr 0.5 -bin ${datadir}/${sub}/roi/fnirted_standard2highres_rPI >> ${basedir}/logs/${sub}_s2.txt
  echo flirt -in ${datadir}/${sub}/roi/fnirted_standard2highres_rPI -ref ${datadir}/${sub}/analysis/prepro.feat/reg/example_func.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/prepro.feat/reg/highres2example_func.mat -out ${datadir}/${sub}/roi/standard2func_rPI  >> ${basedir}/logs/${sub}_s2.txt
  echo fslmaths ${datadir}/${sub}/roi/standard2func_rPI -thr 0.5 -bin ${datadir}/${sub}/roi/standard2func_rPI >> ${basedir}/logs/${sub}_s2.txt

done
}
pipe 1 19 &
pipe 21 19 &
pipe 41 19 &
pipe 61 19 &
pipe 81 19 &
pipe 101 19 &
pipe 121 19 &
pipe 141 19 &
pipe 161 19 &
pipe 181 19 &
pipe 201 19 &
pipe 221 19 &
pipe 241 19 &
pipe 261 19 &
pipe 281 19 &
pipe 301 19 &
pipe 321 19 &
pipe 341 19 &
pipe 361 19 &
pipe 381 19 &
pipe 401 19 &
pipe 421 19 &
pipe 441 19 &
pipe 461 19 &
pipe 481 19 &
pipe 501 19 &
pipe 521 19 &
pipe 541 10 &
wait
echo -e "time-consuming: $SECONDS seconds"
