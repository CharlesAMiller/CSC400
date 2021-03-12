# stop script on error
set -e

# Check to see if root CA file exists, download if not
#if [ ! -f ./root-CA.crt ]; then
#  printf "\nDownloading AWS IoT Root CA certificate from AWS...\n"
#  curl https://www.amazontrust.com/repository/AmazonRootCA1.pem > root-CA.crt
#fi

# Check to see if AWS Device SDK for Python exists, download if not
#if [ ! -d ./aws-iot-device-sdk-python ]; then
#  printf "\nCloning the AWS SDK...\n"
#  git clone https://github.com/aws/aws-iot-device-sdk-python.git
#fi

# run pub/sub sample app using certificates downloaded in package
printf "\nRunning pub/sub sample application...\n"
python3 src/monitoring.py -e a3f2is79s27q7t-ats.iot.us-west-2.amazonaws.com -r certs/root-CA.crt -c certs/reptile-tank.cert.pem -k certs/reptile-tank.private.key -t "status"

# Check to see if AWS Device SDK for Python is already installed, install if not
#if ! python -c "import AWSIoTPythonSDK" &> /dev/null; then
#  printf "\nInstalling AWS SDK...\n"
#  pushd aws-iot-device-sdk-python
#  python setup.py install
#  result=$?
#  popd
#  if [ $result -ne 0 ]; then
#    printf "\nERROR: Failed to install SDK.\n"
#    exit $result
#  fi
#fi


