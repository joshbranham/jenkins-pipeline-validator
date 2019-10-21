#!/bin/bash
#
# To validate a Jenkins pipeline, run this script (assuming a Jenkins is running at port 8080):
#   ./validate.sh -f filename.groovy

PORT=8080
JENKINS="http://localhost:$PORT"

while [ -n "$1" ]; do
    case "$1" in
    -f|--file)
      FILE=$2
      shift
      ;;
    *) echo "Option $1 not recognized"
      exit 1
      ;;
    esac
    shift
done

if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist"
    exit 1
fi

validate () {
    echo "$response" | grep -q "Jenkinsfile successfully validated."
}

if ! response=$(curl -s -X POST -F "jenkinsfile=<$FILE" $JENKINS/pipeline-model-converter/validate)
then
    echo "Error validating Jenkinsfile, check if Jenkins is available" >&2
    exit 1
else
    if validate
    then
        echo "$response"
        exit
    else
        echo "Validation error with $FILE"
        echo "$response"
        exit 1
    fi
fi
