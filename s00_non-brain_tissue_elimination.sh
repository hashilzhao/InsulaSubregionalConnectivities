# this script is for InsulaSubregionalConnectivities study, writen by Haichao Zhao in 2021-06-01

basedir='/expdata2/insula.validation'
datadir='/expdata2/insula.validation/data'
logdate=`date +%Y%m%d_%T`
historylog=`date`

sublist=$(ls ${datadir})
mkdir -p ${datadir}/slicesdir
mkdir -p ${basedir}/logs
echo '<HTML><TITLE>slicedir</TITLE><BODY BGCOLOR="#aaaaff">' > ${datadir}/slicesdir/index.html

pipe (){
local sta=$1
local num=$2
echo "process $sta : $((sta + num))"

for sub in $(echo ${sublist} | cut -f$sta-$((sta+num)) -d " ")
do
    echo now we are processing ${sub} ......
    
    echo rename of ${sub}
    fslmaths ${datadir}/${sub}/data/t1.nii.gz ${datadir}/${sub}/data/mprage.nii.gz
    echo fslmaths ${datadir}/${sub}/data/t1.nii.gz ${datadir}/${sub}/data/mprage.nii.gz >> $basedir/logs/${sub}_s0.txt
    fslreorient2std ${datadir}/${sub}/data/mprage.nii.gz
    echo fslreorient2std ${datadir}/${sub}/data/mprage.nii.gz  >> $basedir/logs/${sub}_s0.txt
    
    echo now running bet2 the mprage of ${sub} .......
    
    bet ${datadir}/${sub}/data/mprage ${datadir}/${sub}/data/mprage_brain -f 0.2 -B
    echo bet ${datadir}/${sub}/data/mprage ${datadir}/${sub}/data/mprage_brain -f 0.2 -B >> $basedir/logs/${sub}_s0.txt

    echo now generating the checking images of bet results .......
    
    mkdir -p ${datadir}/tmp.${sub}
    echo mkdir -p ${datadir}/tmp.${sub} >> ${basedir}/logs/${sub}_s0.txt

    slicer ${datadir}/${sub}/data/mprage_brain.nii.gz ${datadir}/${sub}/data/mprage.nii.gz -s 2 -x 0.35 ${datadir}/tmp.${sub}/sla.png -x 0.45 ${datadir}/tmp.${sub}/slb.png -x 0.55 ${datadir}/tmp.${sub}/slc.png -x 0.65 ${datadir}/tmp.${sub}/sld.png -y 0.35 ${datadir}/tmp.${sub}/sle.png -y 0.45 ${datadir}/tmp.${sub}/slf.png -y 0.55 ${datadir}/tmp.${sub}/slg.png -y 0.65 ${datadir}/tmp.${sub}/slh.png -z 0.35 ${datadir}/tmp.${sub}/sli.png -z 0.45 ${datadir}/tmp.${sub}/slj.png -z 0.55 ${datadir}/tmp.${sub}/slk.png -z 0.65 ${datadir}/tmp.${sub}/sll.png
    echo slicer ${datadir}/${sub}/data/mprage_brain.nii.gz ${datadir}/${sub}/data/mprage.nii.gz -s 2 -x 0.35 ${datadir}/tmp.${sub}/sla.png -x 0.45 ${datadir}/tmp.${sub}/slb.png -x 0.55 ${datadir}/tmp.${sub}/slc.png -x 0.65 ${datadir}/tmp.${sub}/sld.png -y 0.35 ${datadir}/tmp.${sub}/sle.png -y 0.45 ${datadir}/tmp.${sub}/slf.png -y 0.55 ${datadir}/tmp.${sub}/slg.png -y 0.65 ${datadir}/tmp.${sub}/slh.png -z 0.35 ${datadir}/tmp.${sub}/sli.png -z 0.45 ${datadir}/tmp.${sub}/slj.png -z 0.55 ${datadir}/tmp.${sub}/slk.png -z 0.65 ${datadir}/tmp.${sub}/sll.png >> ${basedir}/logs/${sub}_s0.txt

    pngappend ${datadir}/tmp.${sub}/sla.png + ${datadir}/tmp.${sub}/slb.png + ${datadir}/tmp.${sub}/slc.png + ${datadir}/tmp.${sub}/sld.png + ${datadir}/tmp.${sub}/sle.png + ${datadir}/tmp.${sub}/slf.png + ${datadir}/tmp.${sub}/slg.png + ${datadir}/tmp.${sub}/slh.png + ${datadir}/tmp.${sub}/sli.png + ${datadir}/tmp.${sub}/slj.png + ${datadir}/tmp.${sub}/slk.png + ${datadir}/tmp.${sub}/sll.png ${datadir}/tmp.${sub}/mprage_brain_2mprage1.png
    echo pngappend ${datadir}/tmp.${sub}/sla.png + ${datadir}/tmp.${sub}/slb.png + ${datadir}/tmp.${sub}/slc.png + ${datadir}/tmp.${sub}/sld.png + ${datadir}/tmp.${sub}/sle.png + ${datadir}/tmp.${sub}/slf.png + ${datadir}/tmp.${sub}/slg.png + ${datadir}/tmp.${sub}/slh.png + ${datadir}/tmp.${sub}/sli.png + ${datadir}/tmp.${sub}/slj.png + ${datadir}/tmp.${sub}/slk.png + ${datadir}/tmp.${sub}/sll.png ${datadir}/tmp.${sub}/mprage_brain_2mprage1.png >> ${basedir}/logs/${sub}_s0.txt

    slicer ${datadir}/${sub}/data/mprage ${datadir}/${sub}/data/mprage_brain -s 2 -x 0.35 ${datadir}/tmp.${sub}/sla.png -x 0.45 ${datadir}/tmp.${sub}/slb.png -x 0.55 ${datadir}/tmp.${sub}/slc.png -x 0.65 ${datadir}/tmp.${sub}/sld.png -y 0.35 ${datadir}/tmp.${sub}/sle.png -y 0.45 ${datadir}/tmp.${sub}/slf.png -y 0.55 ${datadir}/tmp.${sub}/slg.png -y 0.65 ${datadir}/tmp.${sub}/slh.png -z 0.35 ${datadir}/tmp.${sub}/sli.png -z 0.45 ${datadir}/tmp.${sub}/slj.png -z 0.55 ${datadir}/tmp.${sub}/slk.png -z 0.65 ${datadir}/tmp.${sub}/sll.png
    echo slicer ${datadir}/${sub}/data/mprage ${datadir}/${sub}/data/mprage_brain -s 2 -x 0.35 ${datadir}/tmp.${sub}/sla.png -x 0.45 ${datadir}/tmp.${sub}/slb.png -x 0.55 ${datadir}/tmp.${sub}/slc.png -x 0.65 ${datadir}/tmp.${sub}/sld.png -y 0.35 ${datadir}/tmp.${sub}/sle.png -y 0.45 ${datadir}/tmp.${sub}/slf.png -y 0.55 ${datadir}/tmp.${sub}/slg.png -y 0.65 ${datadir}/tmp.${sub}/slh.png -z 0.35 ${datadir}/tmp.${sub}/sli.png -z 0.45 ${datadir}/tmp.${sub}/slj.png -z 0.55 ${datadir}/tmp.${sub}/slk.png -z 0.65 ${datadir}/tmp.${sub}/sll.png >> ${basedir}/logs/${sub}_s0.txt

    pngappend ${datadir}/tmp.${sub}/sla.png + ${datadir}/tmp.${sub}/slb.png + ${datadir}/tmp.${sub}/slc.png + ${datadir}/tmp.${sub}/sld.png + ${datadir}/tmp.${sub}/sle.png + ${datadir}/tmp.${sub}/slf.png + ${datadir}/tmp.${sub}/slg.png + ${datadir}/tmp.${sub}/slh.png + ${datadir}/tmp.${sub}/sli.png + ${datadir}/tmp.${sub}/slj.png + ${datadir}/tmp.${sub}/slk.png + ${datadir}/tmp.${sub}/sll.png ${datadir}/tmp.${sub}/mprage_brain_2mprage2.png
    echo pngappend ${datadir}/tmp.${sub}/sla.png + ${datadir}/tmp.${sub}/slb.png + ${datadir}/tmp.${sub}/slc.png + ${datadir}/tmp.${sub}/sld.png + ${datadir}/tmp.${sub}/sle.png + ${datadir}/tmp.${sub}/slf.png + ${datadir}/tmp.${sub}/slg.png + ${datadir}/tmp.${sub}/slh.png + ${datadir}/tmp.${sub}/sli.png + ${datadir}/tmp.${sub}/slj.png + ${datadir}/tmp.${sub}/slk.png + ${datadir}/tmp.${sub}/sll.png ${datadir}/tmp.${sub}/mprage_brain_2mprage2.png >> ${basedir}/logs/${sub}_s0.txt

    pngappend ${datadir}/tmp.${sub}/mprage_brain_2mprage1.png - ${datadir}/tmp.${sub}/mprage_brain_2mprage2.png ${datadir}/slicesdir/${sub}_mprage_brain_2mprage.png
    echo pngappend ${datadir}/tmp.${sub}/mprage_brain_2mprage1.png - ${datadir}/tmp.${sub}/mprage_brain_2mprage2.png ${datadir}/slicesdir/${sub}_mprage_brain_2mprage.png >> ${basedir}/logs/${sub}_s0.txt

    rm -rf ${datadir}/tmp.${sub}
    echo rm -f ${datadir}/tmp.${sub} >> ${basedir}/logs/${sub}_s0.txt

    echo '<a href="'${sub}_mprage_brain_2mprage'.png"><img src="'${sub}_mprage_brain_2mprage'.png" WIDTH='1500' >' ${sub}_mprage_brain_2mprage.png'</a><br>' >> ${datadir}/slicesdir/index.html
    echo echo '<a href="'${sub}_mprage_brain_2mprage'.png"><img src="'${sub}_mprage_brain_2mprage'.png" WIDTH='1500' >' ${sub}_mprage_brain_2mprage.png'</a><br>' ">> ${datadir}/slicesdir/index.html" >> ${basedir}/logs/${sub}_s0.txt
    
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
echo -e "time-consuming: $SECONDS seconds" #显示脚本执行耗时

echo '</BODY></HTML>' >> ${datadir}/slicesdir/index.html
echo 'Finished. To view, point your web browser at'
echo file:${datadir}/slicesdir/index.html
