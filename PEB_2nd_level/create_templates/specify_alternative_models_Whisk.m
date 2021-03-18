
%% Specifing alternative models for the whisker group for hypothesis testing 
%  These will be templates for the group analysis

% Define A-matrix for each family (factor: Whisk)

% 1. full model 
a_Whisk_fam{1} = [1 1 1 0;
                  1 1 0 1;
                  1 0 1 1;
                  0 1 1 1];
              
% 2. no cortex to thalamus              
a_Whisk_fam{2} = [1 1 1 0;
                  1 1 0 1;
                  0 0 1 1;
                  0 0 1 1];
              
% 3. no thalamus to cortex        
a_Whisk_fam{3} = [1 1 0 0;
                  1 1 0 0;
                  1 0 1 1;
                  0 1 1 1];
              
% 4. no cortex exchange     
a_Whisk_fam{4} = [1 0 1 0;
                  0 1 0 1;
                  1 0 1 1;
                  0 1 1 1]; 
              
              
% 5. no thalamic exchange, no cortex to thalamus     
a_Whisk_fam{5} = [1 1 1 0;
                  1 1 0 1;
                  0 0 1 0;
                  0 0 0 1]; 
               
              
              
% 6. no cortex exchange, no thalamus to cortex      
a_Whisk_fam{6} = [1 0 0 0;
                  0 1 0 0;
                  1 0 1 1;
                  0 1 1 1];   
              
              
% 7. no thalamic exchange    
a_Whisk_fam{7} = [1 1 1 0;
                  1 1 0 1;
                  1 0 1 0;
                  0 1 0 1];  
                            
% 8. no cortex exchange,no cortex to thalamus   
a_Whisk_fam{8} = [1 0 1 0;
                  0 1 0 1;
                  0 0 1 1;
                  0 0 1 1]; 
              
              
% 9. no thalamic exchange, no thalamus to cortex   
a_Whisk_fam{9} = [1 1 0 0;
                  1 1 0 0;
                  1 0 1 0;
                  0 1 0 1];   
              
              
% 10. only thalamus on  
a_Whisk_fam{10} = [1 0 0 0;
                   0 1 0 0;
                   0 0 1 1;
                   0 0 1 1];                 
              
% 11. no contralateral exchange
a_Whisk_fam{11} = [1 0 1 0;
                   0 1 0 1;
                   1 0 1 0;
                   0 1 0 1];                 
              
% 12. no contralateral exchange, no thalamus to cortex 
a_Whisk_fam{12} = [1 0 0 0;
                   0 1 0 0;
                   1 0 1 0;
                   0 1 0 1];                
               
% 13. no contralateral exchange, no cortex to thalamus
a_Whisk_fam{13} = [1 0 1 0;
                   0 1 0 1;
                   0 0 1 0;
                   0 0 0 1];                
               
% 14. no exchange between thalamus and cortex 
a_Whisk_fam{14} = [1 1 0 0;
                   1 1 0 0;
                   0 0 1 1;
                   0 0 1 1];                                 
               
% 15. null model
a_Whisk_fam{15} = [1 0 0 0;
                   0 1 0 0;
                   0 0 1 0;
                   0 0 0 1];  
               
% 15. only cortex (although unlikely)
a_Whisk_fam{16} = [1 1 0 0;
                   1 1 0 0;
                   0 0 1 0;
                   0 0 0 1];                
               
a_Whisk_fam_names = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'};               
               
                                                    
% Make a DCM for each mixture of these factors
% -------------------------------------------------------------------------

% Load and unpack an example DCM
GCM_full = load('../../GCM_files/postWhisk.mat');
GCM_full = spm_dcm_load(GCM_full.GCM);
DCM_template = GCM_full{1,1};
b = DCM_template.b;
d = DCM_template.d;
c = DCM_template.c;
options = DCM_template.options;

% Output cell array for new models
GCM_templates = {};

m = 1;
for t = 1:length(a_Whisk_fam_names)
    % Prepare A-matrix and C-Matrix 
    a = a_Whisk_fam{t};


    % Prepare model name
    name = sprintf('Whisk: %s',a_Whisk_fam_names{t}) ;
    
    % Build minimal DCM
    DCM = struct();
    DCM.a       = a;
    DCM.b       = b;
    DCM.c       = c;
    DCM.d       = d;
    DCM.options = options;
    DCM.name    = name;                    
    GCM_templates{1,m} = DCM;

    % Record the assignment of this model to each family
    Whisk_family(m) = t;
    m = m + 1;    
end


% Save
GCM_W_alt = GCM_templates;
save('GCM_templates_W.mat','GCM_W_alt',...
    'Whisk_family');


