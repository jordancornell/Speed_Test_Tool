#!/bin/bash

# This script performs a speed test of the internet connection using SpeedTest's Command Line Interface
# Appends notable metrics to log file
# Intended to be called automatically via cron scheduling


# If log file does not already exist in directory, create with appropriate header
log_file=./connection_log.txt
if [ ! -f "$log_file" ]
then
touch connection_log.txt
echo -e 'DAY/DATE/TIME\t\tLatency (ms)\tDownload (Mbps)\tUpload (Mbps)'>>connection_log.txt
fi

# Perform speed test with SpeedTest CLI, write to temporary log file 
/usr/bin/speedtest > temp_log.txt

# Write Day, Date, Time to log file
echo -n `date +"%a %D %T"` >> connection_log.txt
printf ';\t'>> connection_log.txt

# Write Latency, Download and Upload Metrics from SpeedTest to log file
awk '/Latency:/{printf $2;}' temp_log.txt >> connection_log.txt
printf ';\t\t'>> connection_log.txt
awk '/Download:/{printf $3}' temp_log.txt >> connection_log.txt
printf ';\t\t'>> connection_log.txt
awk '/Upload:/{printf $3}' temp_log.txt >> connection_log.txt
printf ";\n">> connection_log.txt

# Remove temp log file
rm temp_log.txt

echo done
