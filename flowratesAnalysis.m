% This script runs through automatically runs through all flow-rate files
% in the specified folders and reports time and average flow-rates

%% INPUT
% Folders to run through
flow_dirs = {'sample_data'};


%% RUN SCRIPT
clc;

for flow_dir = flow_dirs
    
    flowrate_files = dir(char(flow_dir));
    
    for i = 3:length(flowrate_files)
        flow_filename = flowrate_files(i).name(1:end-4);
        flow_filepath = strcat(flow_dir, '\', flow_filename);
        
        fprintf('%s \n', char(flow_filepath));
        getAvgFlowrate(char(flow_filepath), 12);
        
        % Pause script to allow data analysis
        disp('Press a key to continue.')
        pause;
        
        clf(1); % clear figure
    end
    
end