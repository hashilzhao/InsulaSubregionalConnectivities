## pwd is /expdata2/insula.validation
basedir=/expdata2/insula.validation
datadir=/expdata2/insula.validation/data
dir_roi=/expdata2/insula.validation/b_roi

b1s=$(ls ${datadir})
pipe (){
local sta=$1
local num=$2
echo "process $sta : $((sta + num))"

for sub in  $(echo $b1s | cut -f$sta-$((sta+num)) -d " ")
do
	echo ${sub}  
	mkdir -p ${datadir}/${sub}/analysis/roi_analysis/extracted_roi
	cp ${datadir}/${sub}/analysis/prepro.feat/reg/example_func2standard.mat ${datadir}/${sub}/analysis/roi_analysis/
	cp ${datadir}/${sub}/analysis/prepro.feat/reg/standard.nii.gz ${datadir}/${sub}/analysis/roi_analysis/
	cp ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_scaled.nii.gz ${datadir}/${sub}/analysis/roi_analysis/
	flirt -in ${datadir}/${sub}/analysis/roi_analysis/res4d_scaled.nii.gz -ref ${datadir}/${sub}/analysis/roi_analysis/standard.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/roi_analysis/example_func2standard.mat -out ${datadir}/${sub}/analysis/roi_analysis/res4d_scaled2standard.nii.gz

	echo mkdir -p ${datadir}/${sub}/analysis/roi_analysis/extracted_roi >> ${basedir}/logs/${sub}_s11.txt
	echo cp ${datadir}/${sub}/analysis/prepro.feat/reg/example_func2standard.mat ${datadir}/${sub}/analysis/roi_analysis/ >> ${basedir}/logs/${sub}_s11.txt
	echo cp ${datadir}/${sub}/analysis/prepro.feat/reg/standard.nii.gz ${datadir}/${sub}/analysis/roi_analysis/ >> ${basedir}/logs/${sub}_s11.txt
	echo cp ${datadir}/${sub}/analysis/regressor.feat/stats/res4d_scaled.nii.gz ${datadir}/${sub}/analysis/roi_analysis/ >> ${basedir}/logs/${sub}_s11.txt
	echo flirt -in ${datadir}/${sub}/analysis/roi_analysis/res4d_scaled.nii.gz -ref ${datadir}/${sub}/analysis/roi_analysis/standard.nii.gz -applyxfm -init ${datadir}/${sub}/analysis/roi_analysis/example_func2standard.mat -out ${datadir}/${sub}/analysis/roi_analysis/res4d_scaled2standard.nii.gz >> ${basedir}/logs/${sub}_s11.txt
	
	for roi in lDAI lVAI lPI rDAI rVAI rPI lDACC lSecSSCortex rAMG rSMA lAMG lSMA rDLPFC rOFC rTHAM lDLPFC lOFC lTHAM rPriSSCortex Stm lPriSSCortex rDACC rSecSSCortex lSGACC rSGACC lVLPFC rVLPFC lRACC rRACC
	do
		fslmeants -i ${datadir}/${sub}/analysis/roi_analysis/res4d_scaled2standard.nii.gz -m ${dir_roi}/${roi}.nii.gz -o ${datadir}/${sub}/analysis/roi_analysis/extracted_roi/${roi}.txt 
		echo fslmeants -i ${datadir}/${sub}/analysis/roi_analysis/res4d_scaled2standard.nii.gz -m ${dir_roi}/${roi}.nii.gz -o ${datadir}/${sub}/analysis/roi_analysis/extracted_roi/${roi}.txt >> ${basedir}/logs/${sub}_s11.txt
	done

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
