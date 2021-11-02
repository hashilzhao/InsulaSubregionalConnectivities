# this script is for InsulaSubregionalConnectivities study, writen by Haichao Zhao in 2021-06-01
# pwd = /expdata2/insula.validation

basedir=/expdata2/insula.validation;
logdate=`date +%Y%m%d_%T`;
historylog=`date`;

matlab -nosplash -nodesktop -r "s06_seeds_normalization;exit"

echo matlab -nosplash -nodesktop -r "s06_seeds_normalization;exit" >> ${basedir}/logs/s6.txt
