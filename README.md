# sfe-flow-rate
Matlab functions to read and analyse flow-rate data from a Coriolis flow-meter.


## `getAvgFlowrate.m` (command line function)
Calculates the average flowrate from the SFE equipment flowrate file.

Run from the command window as: 
```matlab
getAvgFlowrate(filename)
```
or 
```matlab
getAvgFlowrate(filename, target)
```
- `filename` is a string of the flowrate file (without .txt extention)
- `target` is the value of the desired flowrate. If target is provided the desired value will be drawn on the graph (optional parameter).


## `monitorAvgFlowrate.m` (command line function)
Automatically monitors the flowrate by calculating the average value every 60 seconds. Ctrl+C to stop.
  
Run from the command window as: 
```matlab
monitorAvgFlowrate(filename)
```
or 
```matlab
monitorAvgFlowrate(filename, target)
```

- `filename` is a string of the flowrate file (without .txt extention).
- `target` is the value of the desired flowrate. If target is provided the desired value will be drawn on the graph (optional parameter).


## `cossolvent.m` (command line function)
Calculates the cossolvent flowrate in ml/min for a given cossolvent mass fraction
  
Run from the command window as: 
```matlab
cossolvent(Q_CO2, x_cossolvent)
```
or 
```matlab
cossolvent(Q_CO2, x_cossolvent, cossolvent)
```

- `Q_CO2` is the CO2 flowrate in g/min
- `x_cossolvent` is the cossolvent mass fraction
- `cossolvent` is a string representing the cossolvent. Currently, only `ethanol` is supported. Default is `ethanol`. 


## `flowratesAnalysis.m` (script)
Script to run through all flow-rate files in the specified folders and report time and average flow-rates.
