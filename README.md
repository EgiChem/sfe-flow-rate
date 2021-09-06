# sfe-flow-rate
Matlab functions to read and analyse flow-rate data from a Coriolis flow-meter.

## `flowratesAnalysis.m` (script)
Script to run run through all flow-rate files in the specified folders and report time and average flow-rates.


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
