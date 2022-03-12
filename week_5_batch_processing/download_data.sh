#https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2021-01.csv
#https://s3.amazonaws.com/nyc-tlc/trip+data/green_tripdata_2021-01.csv
set -e

URL_PREFIX="https://s3.amazonaws.com/nyc-tlc/trip+data"
TAXI_TYPE=$1 #"yellow"
MONTH=$2
YEAR=$3 #2021

