# Automated SpeedTest Assessment and Logging

### Summary

Since moving into my new apartment and beginning a contract with a new ISP, I have frequently been dissapointed with the connection speed, which is often significantly slower than advertised, particularly during peak weekday hours. I have long relied on the Ookla SpeedTest tool for connection diagnostics, but desired a way to automate the process and log the results.

The purpose of this project was to develop a wrapper around Ookla's SpeedTest tool so that it would be executed on my machine at specified time intervals, and log the desired connection metrics in a manner that allows for later reference and analytics.

### Setup

The following describes how the tool is set up and used (specifically on a Linux machine)

Instructions for installation of the SpeedTest CLI tool can be found on their site:

https://www.speedtest.net/apps/cli


The following line needs to be added to my user crontab file to automate the running of the bash script

'''
*/30 * * * * cd <path to directory> && ./run_speedtest.sh
'''


### Analytics
