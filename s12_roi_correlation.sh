# this script is for InsulaSubregionalConnectivities study, writen by Haichao Zhao in 2021-06-01
# pwd = /expdata2/insula.validation

basedir=/expdata2/insula.validation;
logdate=`date +%Y%m%d_%T`;
historylog=`date`;

matlab -nosplash -nodesktop -r "s12_roi_correlation;exit"

echo matlab -nosplash -nodesktop -r "s12_roi_correlation;exit" >> ${basedir}/logs/s12.txt

echo it is done !!
