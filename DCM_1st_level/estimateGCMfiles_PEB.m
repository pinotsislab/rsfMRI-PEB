% Find all DCM files

conditions = {'preThal', 'postThal', 'preWhisk', 'postWhisk'};


for condition = 1:length(conditions)    
        
    % DCM filenames -> DCM structures
    GCM = spm_dcm_load(conditions{condition});
    
    % Estimate DCMs (this won't effect original DCM files) 
    GCM = spm_dcm_peb_fit(GCM);
    
    % Save estimated GCM
    save(strcat(conditions{condition}, 'peb_est'),'GCM');
    
end

