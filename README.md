# CMCC Spreads UI
## Description

The CMCC Spreads UI was developed to provide a common tool to create and manage experiments using CESM-DART in data assimilation products using ecFlow system.

## Getting Started

### Dependencies:

* ecFlow 5.* or later
* Korn Shell (KSH)
* Anaconda
* Git
### Installing


* Create anaconda enviroment
```console
conda create -n ecflow
conda activate ecflow
conda install -c conda-forge ecflow
```
* Clone 
```
git clone https://github.com/guaturamarcelo/CMCC-Spreads_ui
```

* Applying the path modifications before start the server
```
cd CMCC-Spreads_ui
./run.ksh 1

```
> **Warning**:
Option 1 is only necessary at the first time before load the suite spreads_ui

After that process use the script run.ksh to manage the ecFlow server's and the new experiments.
```
./run.ksh
```
1) Replace path 
2) List servers running
3) Starting Server
4) Stop Server
5) Load spreads_ui
6) List experiments available
7) Exit


## Authors

Marcelo Guatura (guaturamarcelo@gmail.com)  
Giovanni Conti (giovanni.conti@cmcc.it)
 
## Contributions
Carla Cardinali (carla.cardinali@cmcc.it)  
Luis de Gonçalves (luis.goncalves@cmcc.it)  
Swapan Mallick (swapan.mallick@cmcc.it)  
## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the GPL-3.0 License - see the LICENSE.md file for details