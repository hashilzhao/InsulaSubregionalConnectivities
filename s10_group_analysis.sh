## pwd = /expdata2/insula.validation
logdate=`date +%Y%m%d_%T`
basedir=/expdata2/insula.validation
datadir=/expdata2/insula.validation/data
designdir=/expdata2/insula.validation/design

mkdir -p ${basedir}/logs

feat ${designdir}/glDAI.fsf &
feat ${designdir}/glVAI.fsf &
feat ${designdir}/glPI.fsf &
feat ${designdir}/grDAI.fsf &
feat ${designdir}/grVAI.fsf &
feat ${designdir}/grPI.fsf &
feat ${designdir}/glDAI_lPI.fsf &
feat ${designdir}/glDAI_lVAI.fsf &
feat ${designdir}/glVAI_lPI.fsf &
feat ${designdir}/grDAI_rPI.fsf &
feat ${designdir}/grDAI_rVAI.fsf &
feat ${designdir}/grVAI_rPI.fsf 

echo feat ${designdir}/glDAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/glVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/glPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/grDAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/grVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/grPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/glDAI_lPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/glDAI_lVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/glVAI_lPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/grDAI_rPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/grDAI_rVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${designdir}/grVAI_rPI.fsf >> ${basedir}/logs/s10.txt

echo -e "time-consuming: $SECONDS seconds" 
