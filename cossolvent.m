function cossolvent(Q_CO2, x_cossolvent, cossolvent)
% Calculates the cossolvent flowrate in ml/min for a given cossolvent mass
% fraction.
% Based on the following experimental calibration curves: 
% ETHANOL: Q_cossolvent[g/min] = 0.763861 * Qm_cossolvent[ml/min] + 0.007951
% 
%   Run as: 
%
%   cossolvent(Q_CO2, x_cossolvent)
%   or 
%   cossolvent(Q_CO2, x_cossolvent, cossolvent)
%
%   Q_CO2 is the CO2 flowrate in g/min
%   x_cossolvent is the cossolvent mass fraction
%   cossolvent is a string representing the cossolvent. Default is 'ethanol'.
%
%   Example: 
%
%   cossolvent(12, 0.05)
%   or 
%   cossolvent(12, 0.15, 'ethanol)

if ~exist('cossolvent','var')
    cossolvent = 'ethanol';
end

x = [1-x_cossolvent, x_cossolvent];  % mass fractions
Qm_cossolvent = Q_CO2/x(1) - Q_CO2;  % g/min, cossolvent mass flowrate

if strcmp(cossolvent, 'ethanol')
    Q_cossolvent = (Qm_cossolvent - 0.007951) / 0.763861;  % ml/min, cossolvent volumetric flowrate
    fprintf('\nQ_CO2 = %.1f g/min | %s %%m/m = %.0f %% \n', Q_CO2, cossolvent, x(2)*100)
    fprintf('Q_cossolvent = %.3f ml/min \n\n', Q_cossolvent)
else
    fprintf('No data for cossolvent %s. Only ethanol is available. \n\n', cossolvent)
end
