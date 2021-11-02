# InsulaSubregionalConnectivities
Code accompanying the paper: Zhao, H. et.al. (202x). How distinct functional insular subdivisions as hub of interoceptive awareness network mediate two interacting neurocognitive systems. xx, xx, xxxx.
# Insular subregional functional connectivity analysis 
The processing pipeline of functional connectivity were based on the below codes step by step:

Step 0: non–brain tissue elimination using bet2

s0_non-brain_tissue_elimination.sh

Step 1: MPRAGE Images segmenation & preprocessing including removing head motion artifact using MCFLIRT, filtering using a non-linear high pass filter (100s), spatially smoothing using a 5-mm full-width-half-maximum (FWHM) Gaussian kernel, and grand-mean intensity normalization

s1_preprocessing.sh
preprocessing.fsf

Step 2: SEEDS transformation of seeds from standard space into individuals' space & Signals extraction of the eight confounders including six motion parameters, white matter signal, cerebrospinal fluid signal, and their associated derivatives.

s2_signal_extractions.sh

Step 3: normalizing the singals of extracted eight confounders in step 2 above.

s3_confounders_normalization.sh
s3_confounders_normalization.m

Step 4: regressing eight confounders.

s4_confounders_regression.sh
confounders_regression.fsf

Step 5: SEEDS signals extraction & Residuals Normalization

s5_residuals_normalization.sh

Step 6: Normalization of extracted SEEDS signals sequences.

s6_seeds_normalization.sh
s6_seed_normalization.m

Step 7: SEEDS-based functional connectivity in individuals

s7_seeds_FC.sh
lDAI.fsf
lVAI.fsf
lPI.fsf
rDAI.fsf
rVAI.fsf
rPI.fsf

Step 8: 




