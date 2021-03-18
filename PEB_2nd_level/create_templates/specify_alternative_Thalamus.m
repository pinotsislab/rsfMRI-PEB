
%% Specify 2 alternative models for the Thalamus group
%  These will be templates for the group analysis

% Define A-matrix for alternative models 

% Note: The first 15 models are the same as for the whisker pad group. The
% last 17 account for unilateral effects only.

% 1. full model 
a_Thal_fam{1} = [0 1 1 0;
                 1 0 0 1;
                 1 0 0 1;
                 0 1 1 0];
              
% 2. no cortex to thalamus              
a_Thal_fam{2} = [1 1 1 0;
                 1 1 0 1;
                 0 0 1 1;
                 0 0 1 1];
              
% 3. no thalamus to cortex        
a_Thal_fam{3} = [1 1 0 0;
                 1 1 0 0;
                 1 0 1 1;
                 0 1 1 1];
              
% 4. no cortex exchange     
a_Thal_fam{4} = [1 0 1 0;
                 0 1 0 1;
                 1 0 1 1;
                 0 1 1 1]; 
              
              
% 5. no cortex exchange,no cortex to thalamus     
a_Thal_fam{5} = [1 0 1 0;
                 0 1 0 1;
                 0 0 1 1;
                 0 0 1 1];  
              
              
% 6. no cortex exchange, no thalamus to cortex      
a_Thal_fam{6} = [1 0 0 0;
                  0 1 0 0;
                  1 0 1 1;
                  0 1 1 1];   
              
              
% 7. no thalamic exchange    
a_Thal_fam{7} = [1 1 1 0;
                 1 1 0 1;
                 1 0 1 0;
                 0 1 0 1];  
                            
% 8. no thalamic exchange, no cortex to thalamus   
a_Thal_fam{8} = [1 1 1 0;
                  1 1 0 1;
                  0 0 1 0;
                  0 0 0 1]; 
              
              
% 9. no thalamic exchange, no thalamus to cortex   
a_Thal_fam{9} = [1 1 0 0;
                 1 1 0 0;
                 1 0 1 0;
                 0 1 0 1];   
              
              
% 10. only thalamus on  
a_Thal_fam{10} = [1 0 0 0;
                   0 1 0 0;
                   0 0 1 1;
                   0 0 1 1];                 
              
% 11. no contralateral exchange
a_Thal_fam{11} = [1 0 1 0;
                  0 1 0 1;
                  1 0 1 0;
                  0 1 0 1];                 
              
% 12. no contralateral exchange, no thalamus to cortex 
a_Thal_fam{12} = [1 0 0 0;
                  0 1 0 0;
                  1 0 1 0;
                  0 1 0 1];                
               
% 13. no contralateral exchange, no cortex to thalamus
a_Thal_fam{13} = [1 0 1 0;
                  0 1 0 1;
                  0 0 1 0;
                  0 0 0 1];                
               
% 14. no exchange between thalamus and cortex 
a_Thal_fam{14} = [1 1 0 0;
                  1 1 0 0;
                  0 0 1 1;
                  0 0 1 1];                                 
               
% 15. null model
a_Thal_fam{15} = [1 0 0 0;
                   0 1 0 0;
                   0 0 1 0;
                   0 0 0 1];                      
              
               
% NOW UNILATERAL HYPOTHESIS TESTING 

% 1. full model no left thalamus - left cortex exchange 
a_Thal_fam{16} = [1 1 0 0;
                  1 1 0 1;
                  0 0 1 1;
                  0 1 1 1];
              
% 2. full model - no left thalamus to left cortex              
a_Thal_fam{17} = [1 1 0 0;
                  1 1 0 1;
                  1 0 1 1;
                  0 1 1 1];
              
% 3. full model - no left cortex to left thalamus               
a_Thal_fam{18} = [1 1 1 0;
                  1 1 0 1;
                  0 0 1 1;
                  0 1 1 1];
                                                   
% 4. no cortex exchange, no left thalamus - left cortex exchange         
a_Thal_fam{19} =  [1 0 0 0;
                   0 1 0 1;
                   0 0 1 1;
                   0 1 1 1];

% 5. no cortex exchange, no left cortex exchange to left thalamus         
a_Thal_fam{20} =  [1 0 1 0;
                   0 1 0 1;
                   0 0 1 1;
                   0 1 1 1];               
               
% 6. no cortex exchange, no left thalamus to left cortex         
a_Thal_fam{21} =  [1 0 0 0;
                   0 1 0 1;
                   1 0 1 1;
                   0 1 1 1];            
               
% 7. no thalamus exchange, no left cortex - left thalamus exchange  
a_Thal_fam{22} =  [1 1 0 0;
                   1 1 0 1;
                   0 0 1 0;
                   0 1 0 1];            
                              
% 8. no thalamus exchange, no left cortex - left thalamus, no right cortex
% to right thalamus 
a_Thal_fam{23} =  [1 1 0 0;
                   1 1 0 1;
                   0 0 1 0;
                   0 0 0 1];   
               
% 9. no thalamus exchange, no left cortex - left thalamus, no right thalamus 
% to right cortex 
a_Thal_fam{24} =  [1 1 0 0;
                   1 1 0 0;
                   0 0 1 0;
                   0 1 0 1];                
               
% 10. only thalamus left to thalamus right 
a_Thal_fam{25} =  [1 0 0 0;
                   0 1 0 0;
                   0 0 1 0;
                   0 0 1 1];      
               
 % 11. only thalamus right to thalamus left 
a_Thal_fam{26} =  [1 0 0 0;
                   0 1 0 0;
                   0 0 1 1;
                   0 0 0 1];               
               
% 12. no exchange between cortex and thalamus, only right to left
a_Thal_fam{27} =  [1 1 0 0;
                   0 1 0 0;
                   0 0 1 1;
                   0 0 0 1];
             
               
% 13. no contralateral exchange, no exchange between left cortex and left
% thalamus, no right thalamus to right cortex 
a_Thal_fam{28} =  [1 0 0 0;
                   0 1 0 0;
                   0 0 1 0;
                   0 1 0 1];      
               
               
% 14. no contralateral exchange, no exchange between left cortex and left
% thalamus, no right cortex to right thalamus 
a_Thal_fam{29} =  [1 0 0 0;
                   0 1 0 1;
                   0 0 1 0;
                   0 0 0 1];  
               
                                    
% 15.  no contralateral exchange, no exchange between left cortex and left
% thalamus 
a_Thal_fam{30} =  [1 0 0 0;
                   0 1 0 1;
                   0 0 1 0;
                   0 1 0 1];  
                      
               
% 16. no exchange between cortex and thalamus, only left to right 
a_Thal_fam{31} =  [1 0 0 0;
                   1 1 0 0;
                   0 0 1 0;
                   0 0 1 1];    
               
               
% 17 only cortex models (added post-hoc here)

a_Thal_fam{32} =  [1 1 0 0;
                   1 1 0 0;
                   0 0 1 0;
                   0 0 0 1];     
               
               
a_Thal_fam{33} =  [1 1 0 0;
                   0 1 0 0;
                   0 0 1 0;
                   0 0 0 1];     
               
a_Thal_fam{34} =  [1 0 0 0;
                   1 1 0 0;
                   0 0 1 0;
                   0 0 0 1];    
                                                                                                         
                                                          
a_Thal_fam_names = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34'};


% Make a DCM for each model 
% -------------------------------------------------------------------------

% Load and unpack an example DCM
GCM_full = load('../../GCM_files/postThal.mat');
GCM_full = spm_dcm_load(GCM_full.GCM);
DCM_template = GCM_full{1,1};
b = DCM_template.b;
c = DCM_template.c;
d = DCM_template.d;
options = DCM_template.options;

% Output cell array for new models
GCM_templates = {};

m = 1;
for t = 1:length(a_Thal_fam_names)
    % Prepare B-matrix
    a = a_Thal_fam{t};

    % Prepare model name
    name = sprintf('Thal: %s',a_Thal_fam_names{t}) ;
    
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
    Thal_family(m) = t;
    m = m + 1;    
end


% Save
GCM_T_alt = GCM_templates;
save('GCM_templates_T.mat','GCM_T_alt',...
 'Thal_family');
   

