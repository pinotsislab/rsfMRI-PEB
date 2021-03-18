% PEB specification  (using two levels see https://en.wikibooks.org/wiki/SPM/Parametric_Empirical_Bayes_(PEB))

% loading design matrix 
dm = load('design_matrix_rats_groups'); 

X = dm.X;
X_labels = dm.labels;

% load GCM file with all subjects in one column 
GCM = load('GCM_full_one_column.mat'); 
GCM = GCM.GCM;


% PEB settings 
M = struct();
M.alpha  = 1;
M.beta = 16;
M.he  = 0;
M.hC = 1/16;
field = {'A'};
M.Q      = 'all';
M.X      = X;
M.XNames = X_labels; 


% automatic search for best fit models (taking both A and B to the second
% level) 
[PEB_B, RCM_B] = spm_dcm_peb(GCM,M,field);

save('PEB_B.mat', 'PEB_B', 'RCM_B')

% Computing bayesian model average (i.e. weighting the parameters based on the posterior probabilities of the models)
BMA_B = spm_dcm_peb_bmc(PEB_B); 
save('BMA_search_B.mat', 'BMA_B');

% specific models (i.e. hypothesis testing based on models that have been specified a prior)

% load PEBs 
load('PEB_B.mat');

% load templates 
templates = load('../individual_GCMs/GCM_templates.mat');

%run model comparison 
[BMA_B, BMR_B] = spm_dcm_peb_bmc(PEB_B, templates.GCM);






