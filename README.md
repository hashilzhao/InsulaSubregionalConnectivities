# InsulaSubregionalConnectivities
Code accompanying the paper: Zhao, H. et.al. (202x). How distinct functional insular subdivisions as hub of interoceptive awareness network mediate two interacting neurocognitive systems. xx, xx, xxxx.
# Insular subregional functional connectivity analysis 
The processing pipeline of functional connectivity were based on the below codes step by step:

Step 0: non–brain tissue elimination using bet2

s0_non-brain_tissue_elimination.sh

Step 1: MPRAGE Images segmenation & preprocessing including removing head motion artifact using MCFLIRT, filtering using a non-linear high pass filter (100s), spatially smoothing using a 5-mm full-width-half-maximum (FWHM) Gaussian kernel, and grand-mean intensity normalization

s1_preprocessing.sh
preprocessing.fsf

Step 2: extraction of seed-based correlations as well as the eight confounders including six motion parameters, white matter signal, cerebrospinal fluid signal, and their associated derivatives.

s2_signal_extractions.sh




