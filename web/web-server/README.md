# web-server

This portion of the project is used to host the thin web server. It stores the sensor data
reported over MQTT, and serves it via an HTTP GET request on port 8081.


### Setup
1. Install package dependencies, and build the project by running `npm install .` <i>This may require you to create a 'dist' directory </i>
2. Provided you've already completed the steps needed to generate credential files for the enclosure portion of the project, simply create a 'certs' directory and copy the appropriate files to the directory.  
3. Run ` ./start.sh `
