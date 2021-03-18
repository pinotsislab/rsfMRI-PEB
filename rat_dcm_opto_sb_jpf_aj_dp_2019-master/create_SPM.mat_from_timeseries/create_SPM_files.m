% This code can be used to create SPM.mat files required for the DCM analysis if timerseries data from 
% ROIs are available.

% specifying SPM.mat and ROI for each subject in each condition 


dat_Thal  = load('Thalamic_Inactivation_data.mat');                                  % name of the file with the data that you wish to load
dat_Whisk = load('Whisker_Pad_Inactivation_data.mat'); 


conditions = {'preThal', 'postThal', 'preWhisk', 'postWhisk'};                       % names of the conditions (here, Thal (pre + post) and Whisk (pre + post) 
dat_conditions = {dat_Thal.preInjectionData;                                         % accessing the data for the specific conditions in the Thal and Whisk data 
                  dat_Thal.postInjectionData;
                  dat_Whisk.preInjectionData; 
                  dat_Whisk.postInjectionData};           
              
TR_list = [2.5, 2.5, 2, 2];                                                          % TR times for each condition 

TE_list = [0.0058805, 0.0058805, 0.016, 0.016];                                      % TE times for each condition 

VOI_names = {'Thal.mat';                                                             % names of the VOI groups for each condition 
             'Thal.mat';
             'Whisk.mat';
             'Whisk.mat'};  

ROIlist = {'S1BF_L','S1BF_R','Sensory_Thalamus_L','Sensory_Thalamus_R'};             % ROI list is the same for all conditions 


% loop for accessing each condition and creating 1) a directory for each
% condition and 2) a directory for each subject/rat within this condition
% directory that includes the spm and ROI structures

for condition = 1:length(conditions)

    data = dat_conditions{condition};          % specify the data  
    name = conditions{condition};              % specify the name 

    [nrats nregions ntime] = size(data);       % splitting the data 

    TR = TR_list(condition);                   % assigning appropriate TR and TE 
    TE = TE_list(condition);


    % Make output directory
    
    rat_group_dir = name;
    mkdir(rat_group_dir);

    for rat = 1:nrats
        rat_dir = fullfile(rat_group_dir, sprintf('rat%d',rat));                        % change first argument to the directory name that suits your needs best (here, we have rats, instead of human subjects)
        mkdir(rat_dir);

        % Prepare VOIs
        for region = 1:nregions

            % Get timeseries
            Y= squeeze(data(rat, region, :));

            % Make spm compatible stucture
            xY    = struct();
            xY.u  = Y;  
            xY.X0 = repelem(ones(ntime,1),1);
            xY.Sess = 1;
            xY.name = ROIlist{region};
            str   = sprintf(strcat('VOI_%s_',VOI_names{condition}), ROIlist{region});  
            save(fullfile(rat_dir,str),'xY');
        end

        % Prepare SPM
        SPM = struct();
        SPM.Sess(1).U(1).dt = TR/16;
        SPM.Sess(1).U(1).u  = [name]; 
        SPM.Sess(1).U(1).name = {name};
        SPM.xY.RT   = TR;
        save(fullfile(rat_dir,'SPM.mat'),'SPM');
    end
    
end



