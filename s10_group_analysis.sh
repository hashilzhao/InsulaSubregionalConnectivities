## pwd = /expdata2/insula.validation
logdate=`date +%Y%m%d_%T`
basedir=/expdata2/insula.validation
datadir=/expdata2/insula.validation/data

mkdir -p ${basedir}/logs

feat ${basedir}/design/glDAI.fsf &
feat ${basedir}/design/glVAI.fsf &
feat ${basedir}/design/glPI.fsf &
feat ${basedir}/design/grDAI.fsf &
feat ${basedir}/design/grVAI.fsf &
feat ${basedir}/design/grPI.fsf &
feat ${basedir}/design/glDAI_lPI.fsf &
feat ${basedir}/design/glDAI_lVAI.fsf &
feat ${basedir}/design/glVAI_lPI.fsf &
feat ${basedir}/design/grDAI_rPI.fsf &
feat ${basedir}/design/grDAI_rVAI.fsf &
feat ${basedir}/design/grVAI_rPI.fsf 

echo feat ${basedir}/design/glDAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/glVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/glPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/grDAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/grVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/grPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/glDAI_lPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/glDAI_lVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/glVAI_lPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/grDAI_rPI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/grDAI_rVAI.fsf '&' >> ${basedir}/logs/s10.txt
echo feat ${basedir}/design/grVAI_rPI.fsf >> ${basedir}/logs/s10.txt


echo -e "time-consuming: $SECONDS seconds" #显示脚本执行耗时
