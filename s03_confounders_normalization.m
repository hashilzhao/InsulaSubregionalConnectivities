clear all
base_dir='/expdata2/insula.validation';
data_dir='/expdata2/insula.validation/data'

sublist=dir('data/sub*');

for sub=1:length(sublist)
    
    datadir=fullfile(data_dir,sublist(sub,1).name,'analysis/prepro.feat');
    cd(datadir);
    a=importdata('csf.txt');
    b=importdata('wm.txt');
    c=importdata('confoundevs.txt');
    
    tmp1=zscore(a);
    tmp2=zscore(b);
    tmp3=c(:,1);
    tmp4=c(:,2);
    tmp5=c(:,3);
    tmp6=c(:,4);
    tmp7=c(:,5);
    tmp8=c(:,6);

    txt_csf=sprintf('%s/z_csf.txt',datadir);
    txt_wm=sprintf('%s/z_wm.txt',datadir);
    txt_motion1=sprintf('%s/motion1.txt',datadir);
    txt_motion2=sprintf('%s/motion2.txt',datadir);
    txt_motion3=sprintf('%s/motion3.txt',datadir);
    txt_motion4=sprintf('%s/motion4.txt',datadir);
    txt_motion5=sprintf('%s/motion5.txt',datadir);
    txt_motion6=sprintf('%s/motion6.txt',datadir);

    eval(sprintf('save %s tmp1 -tabs -ascii',txt_csf));
    eval(sprintf('save %s tmp2 -tabs -ascii',txt_wm));
    eval(sprintf('save %s tmp3 -tabs -ascii',txt_motion1));
    eval(sprintf('save %s tmp4 -tabs -ascii',txt_motion2));
    eval(sprintf('save %s tmp5 -tabs -ascii',txt_motion3));
    eval(sprintf('save %s tmp6 -tabs -ascii',txt_motion4));
    eval(sprintf('save %s tmp7 -tabs -ascii',txt_motion5));
    eval(sprintf('save %s tmp8 -tabs -ascii',txt_motion6));

    cd(base_dir)

end
