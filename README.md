For the communication between Matlab and myRio, the myRio device as to be mounted as a network drive Z:

Once mounted
	- the generated controllers from files located in 'Matlab\controllers\[...]' are sent to 'Z:\home\lvuser\khatanas\controlers'
	- the generated trajectories generated in 'Matlab\labviewInOut.m' are sent to 'Z:\home\lvuser\khatanas\signals'
	- the collected data are saved in 'Z:\home\lvuser\khatanas\outputs' are read by files located in 'Matlab\sysID\[...]'

The binary files of the controllers used to get the final results presented in the report can be found in 'Matlab\controllers\binaryFile\[...]'
The binary files of the collected data used to identify the system and to test its performances can be found in 'Matlab\data\[...]'
Some Matlab variables generated in some file and needed in others are stored in 'Matlab\store\[...]'


