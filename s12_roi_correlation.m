clear all;

sublist=dir('data/sub*');

for sub=1:length(sublist)
    
	base_dir='/expdata2/insula.validation';
    datadir=fullfile(base_dir,'data',sublist(sub,1).name,'analysis/roi_analysis/extracted_roi');
    cd(datadir);

    tmpl1=zscore(importdata('lDAI.txt'));
    tmpl2=zscore(importdata('lPI.txt'));
    tmpl3=zscore(importdata('lVAI.txt'));
    tmpr1=zscore(importdata('rDAI.txt'));
    tmpr2=zscore(importdata('rPI.txt'));
    tmpr3=zscore(importdata('rVAI.txt'));
    
    tmpl4=zscore(importdata('lAMG.txt'));
    tmpl5=zscore(importdata('lDACC.txt'));
    tmpl6=zscore(importdata('lDLPFC.txt'));
    tmpl7=zscore(importdata('lOFC.txt'));
    tmpl8=zscore(importdata('lPriSSCortex.txt'));
    tmpl9=zscore(importdata('lRACC.txt'));
    tmpl10=zscore(importdata('lSecSSCortex.txt'));
    tmpl11=zscore(importdata('lSGACC.txt'));
    tmpl12=zscore(importdata('lSMA.txt'));
    tmpl13=zscore(importdata('lTHAM.txt'));
    tmpl14=zscore(importdata('lVLPFC.txt'));
    tmpl15=zscore(importdata('Stm.txt'));

    tmpr4=zscore(importdata('rAMG.txt'));
    tmpr5=zscore(importdata('rDACC.txt'));
    tmpr6=zscore(importdata('rDLPFC.txt'));
    tmpr7=zscore(importdata('rOFC.txt'));
    tmpr8=zscore(importdata('rPriSSCortex.txt'));
    tmpr9=zscore(importdata('rRACC.txt'));
    tmpr10=zscore(importdata('rSecSSCortex.txt')); 
    tmpr11=zscore(importdata('rSGACC.txt'));
    tmpr12=zscore(importdata('rSMA.txt'));
    tmpr13=zscore(importdata('rTHAM.txt')); 
    tmpr14=zscore(importdata('rVLPFC.txt'));   
    tmpr15=zscore(importdata('Stm.txt'));    

    for roi= [4:15]
        lDAICorr(roi)=corr(tmpl1,eval(sprintf('tmpl%d',roi)));
        lPICorr(roi)=corr(tmpl2,eval(sprintf('tmpl%d',roi)));
        lVAICorr(roi)=corr(tmpl3,eval(sprintf('tmpl%d',roi)));
        rDAICorr(roi)=corr(tmpr1,eval(sprintf('tmpr%d',roi)));
        rPICorr(roi)=corr(tmpr2,eval(sprintf('tmpr%d',roi)));
        rVAICorr(roi)=corr(tmpr3,eval(sprintf('tmpr%d',roi)));
    end
    
    outfile=fullfile(datadir,'Corr.mat');
    save(outfile,'lDAICorr', 'lPICorr', 'lVAICorr', 'rDAICorr', 'rPICorr', 'rVAICorr');
    cd(base_dir)
end

sublist=dir('data/sub*');

for sub=1:length(sublist)
    
	base_dir='/expdata2/insula.validation';
    datafile=fullfile(base_dir,'data',sublist(sub,1).name,'analysis/roi_analysis/extracted_roi/Corr.mat');
    eval(sprintf('load %s',datafile))
    Corr_lDAI(:,sub)=lDAICorr';
    Corr_lPI(:,sub)=lPICorr';
    Corr_lVAI(:,sub)=lVAICorr';
    Corr_rDAI(:,sub)=rDAICorr';
    Corr_rPI(:,sub)=rPICorr';
    Corr_rVAI(:,sub)=rVAICorr';

end    
    outfile=fullfile(base_dir,'gresults/Corr.mat')
    save(outfile,'Corr_lDAI', 'Corr_lPI', 'Corr_lVAI', 'Corr_rDAI', 'Corr_rPI', 'Corr_rVAI');
    clear all;

