#https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2021-01.csv
#https://s3.amazonaws.com/nyc-tlc/trip+data/green_tripdata_2021-01.csv
set -e

URL_PREFIX="https://s3.amazonaws.com/nyc-tlc/trip+data"
TAXI_TYPE=$1 #"yellow"
YEAR=$2 #2021

for MONTH in {1..12}; 
    do
        FMONTH=`printf %02d ${MONTH}` 
        URL="${URL_PREFIX}/${TAXI_TYPE}_tripdata_$YEAR-${FMONTH}.csv"

        LOCAL_PREFIX="data/row/${TAXI_TYPE}/${YEAR}/${FMONTH}"
        LOCAL_FILE="${TAXI_TYPE}_tripdata_${YEAR}_${FMONTH}.csv"
        LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

        mkdir -p ${LOCAL_PREFIX}

        echo "downloading ${LOCAL_PATH}"
        wget ${URL} -O ${LOCAL_PATH}

        echo "compressing ${LOCAL_PATH}"
        gzip ${LOCAL_PATH}
    done
