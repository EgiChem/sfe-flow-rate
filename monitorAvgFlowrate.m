function monitorAvgFlowrate(filename, target, interval)
% Calculates the average flowrate every 'interval' seconds. Ctrl+C to stop.
%   Run as: 
%
%   monitorAvgFlowrate(filename)
%   or 
%   monitorAvgFlowrate(filename, target)
%   or 
%   monitorAvgFlowrate(filename, target, interval)
%
%   filename is a string of the flowrate file (without .txt extention)
%   target is the value of the desired flowrate. If target is provided the desired value will be drawn on the graph (optional parameter)
%   calculation is performed every 'interval' seconds. Default is 60 seconds


while true
    tic
    
    if exist('target','var')
        getAvgFlowrate(filename, target)
    else
        getAvgFlowrate(filename)
    end
    
    if exist('interval','var')
        pause(interval-toc);
    else
        pause(60-toc);
    end
    
    disp('==========================')
    
    clf(1);
end
