function monitorAvgFlowrate(filename, target)
% Calculates the average flowrate every 60 seconds. Ctrl+C to stop.
%   Run as: 
%
%   monitorAvgFlowrate(filename)
%   or 
%   monitorAvgFlowrate(filename, target)
%
%   filename is a string of the flowrate file (without .txt extention)
%   target is the value of the desired flowrate. If target is provided the desired value will be drawn on the graph (optional parameter)


while true
    tic
    
    if exist('target','var')
        getAvgFlowrate(filename, target)
    else
        getAvgFlowrate(filename)
    end

    pause(60-toc);
    
    disp('==========================')
    
    clf(1);
end