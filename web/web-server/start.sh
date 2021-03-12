# run pub/sub sample app using certificates downloaded in package
printf "\nRunning pub/sub sample application...\n"
node dist/index.js --endpoint a3f2is79s27q7t-ats.iot.us-west-2.amazonaws.com --ca_file certs/root-CA.crt --cert certs/reptile-tank.cert.pem --key certs/reptile-tank.private.key 

