# InsulaSubregionalConnectivities
Code accompanying the paper: Zhao, H. et.al. (202x). How distinct functional insular subdivisions as hub of interoceptive awareness network mediate two interacting neurocognitive systems. xx, xx, xxxx.
# Insular subregional functional connectivity analysis 
The processing pipeline of functional connectivity were based on the below codes step by step:

Step 00: non–brain tissue elimination using bet2

s00_non-brain_tissue_elimination.sh

Step 01: MPRAGE Images segmenation & preprocessing including removing head motion artifact using MCFLIRT, filtering using a non-linear high pass filter (100s), spatially smoothing using a 5-mm full-width-half-maximum (FWHM) Gaussian kernel, and grand-mean intensity normalization

s01_preprocessing.sh
preprocessing.fsf

Step 02: SEEDS transformation of seeds from standard space into individuals' space & Signals extraction of the eight confounders including six motion parameters, white matter signal, cerebrospinal fluid signal, and their associated derivatives.

s02_signal_extractions.sh

Step 03: normalizing the singals of extracted eight confounders in step 2 above.

s03_confounders_normalization.sh
s03_confounders_normalization.m

Step 04: regressing eight confounders.

s04_confounders_regression.sh
confounders_regression.fsf

Step 05: SEEDS signals extraction & Residuals Normalization

s05_residuals_normalization.sh

Step 06: Normalization of extracted SEEDS signals sequences.

s06_seeds_normalization.sh
s06_seeds_normalization.m

Step 07: SEEDS-based functional connectivity in individuals

s07_seeds_FC.sh
lDAI.fsf
lVAI.fsf
lPI.fsf
rDAI.fsf
rVAI.fsf
rPI.fsf

Step 08: copying transformation files to runing groups analysis

s08_transformation_copying.sh

Step 09: FC comparison between SEEDS

s09_seeds_comparison.sh
lDAI_lVAI.fsf
lDAI_lPI.fsf
lVAI_lPI.fsf
rDAI_rVAI.fsf
rDAI_rPI.fsf
rVAI_rPI.fsf

Steps 10: running group analysis

s10_group_analysis.sh
glDAI.fsf
glVAI.fsf
glPI.fsf
grDAI.fsf
grVAI.fsf
grPI.fsf
glDAI_lVAI.fsf
glDAI_lPI.fsf
glVAI_lPI.fsf
grDAI_rVAI.fsf
grDAI_rPI.fsf
grVAI_rPI.fsf

Step 11: running ROI analysis: extracting ROIs' time series.

s11_roi_signals_extraction.sh
ROIs.zip

Step 12: normalization of ROIs' time series, and calculating the correlations between insular SEEDs and ROIs.

s12_roi_correlation.sh
s12_roi_correlation.m
