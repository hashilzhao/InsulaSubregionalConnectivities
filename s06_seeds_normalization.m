clear all

base_dir='/expdata2/insula.validation';
data_dir='/expdata2/insula.validation/data';
sublist=dir('data/sub*');

for sub=1:length(sublist)
  
    datadir=fullfile(data_dir,sublist(sub,1).name,'roi');
    cd(datadir);

    a=importdata('roi_lDAI.txt');
    b=importdata('roi_lPI.txt');
    c=importdata('roi_lVAI.txt');
    d=importdata('roi_rDAI.txt');
    e=importdata('roi_rPI.txt');
    f=importdata('roi_rVAI.txt');
    tmp1=zscore(a);
    tmp2=zscore(b);
    tmp3=zscore(c);
    tmp4=zscore(d);
    tmp5=zscore(e);
    tmp6=zscore(f);

    txt_lDAI=sprintf('%s/z_lDAI.txt',datadir);
    txt_lPI=sprintf('%s/z_lPI.txt',datadir);
    txt_lVAI=sprintf('%s/z_lVAI.txt',datadir);
    txt_rDAI=sprintf('%s/z_rDAI.txt',datadir);
    txt_rPI=sprintf('%s/z_rPI.txt',datadir);
    txt_rVAI=sprintf('%s/z_rVAI.txt',datadir);

    eval(sprintf('save %s tmp1 -tabs -ascii',txt_lDAI));
    eval(sprintf('save %s tmp2 -tabs -ascii',txt_lPI));
    eval(sprintf('save %s tmp3 -tabs -ascii',txt_lVAI));
    eval(sprintf('save %s tmp4 -tabs -ascii',txt_rDAI));
    eval(sprintf('save %s tmp5 -tabs -ascii',txt_rPI));
    eval(sprintf('save %s tmp6 -tabs -ascii',txt_rVAI));

    cd(base_dir)

end
