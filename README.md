# Automated SpeedTest Assessment and Logging

### Summary

Since moving into my new apartment and beginning a contract with a new ISP, I have frequently been dissapointed with the connection speed, which is often significantly slower than advertised, particularly during peak weekday hours. I have long relied on the Ookla SpeedTest tool for connection diagnostics, but desired a way to automate the process and log the results.

The purpose of this project was to develop a simple wrapper around Ookla's SpeedTest tool so that it would be executed on my machine at specified time intervals, and log the desired connection metrics in a manner that allows for later reference and analytics.

*run_speedtest.sh* is a bash script that does the following:
1. Performs a connection speed test using SpeedTest CLI, writes output to temporary log file
2. Uses awk to pull specified connection metrics from SpeedTest output (Latency, Download, and Upload)
3. Append these metrics, as well as the Day, Date and Time of the test, to a log file (If log file does not already exist, create it)


### Setup

The following describes how the tool is set up and used (specifically on a Linux machine)

Instructions for installation of the SpeedTest CLI tool can be found on their site:
https://www.speedtest.net/apps/cli

The following line needs to be added to the user's crontab file to automate the running of the bash script:

\*/30 \* \* \* \* cd \<*path to directory*\> && ./run_speedtest.sh

This command changes to the appropriate directory (as the bash script expects that the log files will exist in the same directory as itself), and then executes the script. This particular example will cause the tool to be run and results logged every 30 minutes, but can be modified as needed. 

The result is a log file, *connection_log.txt*, created in the same directory as the *run_speedtest.sh* script, with a record of the date/time and connection metrics of all tests performed.

### Analytics

The tool generates an output that looks like this:

![Log Example](/images/Log_Example.png)

Once this tool collects at least a few weeks worth of data, the next step will be an analytical tool to assess the average connection metrics throughout the day/week. Perhaps an alert could be issued to the user when the download speed falls below a certain threshold for a number of consecutive assessments. Perhaps even an automated complaint email delivered to my ISP's customer service department ;)
