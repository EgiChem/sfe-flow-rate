function getAvgFlowrate(filename, target)
% Calculates the average flowrate from the SFE equipment flowrate file.
%   Run as: 
%
%   getAvgFlowrate(filename)
%   or 
%   getAvgFlowrate(filename, target)
%
%   filename is a string of the flowrate file (without .txt extention)
%   target is the value of the desired flowrate. If target is provided the desired value will be drawn on the graph (optional parameter)


% Configuaration variables
maxScale = 14.52; % Maximum of the flowrate scale

% Open and read file
fileID = fopen(strcat(filename, '.txt'),'r');
data = fscanf(fileID, '%f;%f', [2 Inf])';
fclose(fileID);
time = data(:,1);
Q = data(:,2)*maxScale/100;

% Reduce the number of points to one per second
temp = data(:,1);
size1 = size(temp,1);
t1 = 0;
t2 = floor(time(end));

j=0;
for i=1:size1
    if temp(i) >= t1-1 && temp(i) <= t2+1
        test = mod(i,10);
        if test == 0
            j = j+1;
            temp_new(j) = temp(i);
            Q_new(j) = Q(i);
        end
    end
end
size2 = j;

% Remove negative values
for i=1:size2
    if Q_new(i) < 0
        Q_new(i) = 0;
    end
end

% Calculate average flowrate
Qavg = sum(Q_new)/(t2-t1);

% Create flowrate plot
figure(1)
plot(temp_new, Q_new, '-r', [t1 t2], [Qavg Qavg],'-b')
if exist('target','var')
    hold on;
    plot([t1 t2], [target target],'--b')
    legend_strs = {'Instantaneous', 'Average', 'Target'};
    hold off;
else
    legend_strs = {'Instantaneous', 'Average'};
end
xlim([t1 t2])
ylim([0 max(Q_new)*1.1])
xlabel('Time (s)')
ylabel('Flowrate (g/min)')
legend(legend_strs, 'Location', 'south', 'Orientation','horizontal')

% Add average value annotation
str = sprintf('Average = %.2f', Qavg);
annotation('textbox',[0.65 0.7 .2 .2], 'String',str, 'FitBoxToText','on', 'EdgeColor','none');

% Print other relevant results
fprintf('\nTime: %.0f seconds (%.1f minutes) \n', temp_new(end), temp_new(end)/60);
fprintf('\nAverage flowrate: %.4f g/min \n', Qavg);
fprintf('\n\n')

