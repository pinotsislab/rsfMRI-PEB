
%% Settings
%% Whisker pad postInjection group

% MRI scanner settings
TR = 2;      % Repetition time (secs)
TE = 0.016;  % Echo time (secs) 

% Experiment settings
nsubjects   = 8;
nregions    = 4; 
nconditions = 1; % not sure how we can specify this yet since its just one data file 

% Index of each condition in the DCM
postInjection = 1;

% Index of each region in the DCM
S1BF_L=1; S1BF_R=2; Sensory_Thalamus_L=3; Sensory_Thalamus_R=4;

%% Specify DCMs (one per subject)

% A-matrix (on / off)
a = ones(nregions,nregions);
a(S1BF_L,Sensory_Thalamus_R) = 0;
a(Sensory_Thalamus_R,S1BF_L) = 0;
a(S1BF_R,Sensory_Thalamus_L) = 0;
a(Sensory_Thalamus_L,S1BF_R) = 0;

% B-matrix
b = zeros(nregions,nregions);

% C-matrix
c = zeros(nregions,nconditions);


% D-matrix (disabled)
d = zeros(nregions,nregions,0);

start_dir = pwd;

% Select whether to include each condition from the SPM.mat 
include = [0]';

% Specify DCM

for subject = 1:nsubjects
    
    name = sprintf('rat%1d', subject);
    
    % Load SPM
    
    glm_dir = fullfile('..','postWhisk',name);
    SPM     = load(fullfile(glm_dir, 'SPM.mat'));
    SPM     = SPM.SPM;
    
   
    % Load ROIs 
    
    f       = {fullfile(glm_dir, 'VOI_S1BF_L_Whisk.mat');
               fullfile(glm_dir ,'VOI_S1BF_R_Whisk.mat'); 
               fullfile(glm_dir ,'VOI_Sensory_Thalamus_L_Whisk.mat'); 
               fullfile(glm_dir ,'VOI_Sensory_Thalamus_R_Whisk.mat')};
    
    for r = 1:length(f) XY = load(f{r});
        XY = load(f{r});
        xY(r) = XY.xY;
        
    end


    % Move to output directory
    cd(glm_dir);

    
    % Select whether to include each condition from the design matrix
    % (preInjection, postInjection)
    
    % Specify. Corresponds to the series of questions in the GUI.
    s = struct();
    s.name       = 'full';
    s.u          = include;               
    s.delays     = repmat(TR,1,nregions);   % Slice timing for each region
    s.TE         = TE;
    s.nonlinear  = false;
    s.two_state  = false;
    s.stochastic = false;
    s.centre     = true;
    s.induced    = 1;
    s.a          = a;
    s.b          = b;
    s.c          = c;
    s.d          = d;

    DCM = spm_dcm_specify(SPM,xY,s);
    
    % Return to script directory
    cd(start_dir);

end
