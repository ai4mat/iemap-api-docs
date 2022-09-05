#!/bin/bash

for i in "$@"; do
  case $i in
    -m=*|--metadata=*)
      METADATAFILE="${i#*=}"
      shift # past argument=value
      ;;
    -f=*|--datafile=*)
      DATAFILES="${i#*=}"
      shift # past argument=value
      ;;
    -f=*|--datafile=*)
      PROPERTYFILES="${i#*=}"
      shift # past argument=value
      ;;
    -*|--*)
      echo "Unknown option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

echo "METADATAFILE  = ${METADATAFILE}"
echo "DATAFILES     = ${DATAFILES}"
echo "PROPERTYFILES = ${PROPERTYFILES}"

IPADDR=https://ai4mat.enea.it/v1

# Upload metadata json file
REQUEST=$(curl --location --request POST "$IPADDR/project/add" \
--data-raw '{ \
"json": '$METADATAFILE' \
}')

ID=echo($REQUEST)

# Upload data files
for f in $DATAFILES
do
	echo "Uploading the file $f as data"
    curl --location --request POST "$IPADDR/project/add/file" \
    --data-raw '{"inserted_id": '$ID', "file": '$f' }'
done


# Upload property files
for f in $PROPERTYFILES
do
	echo "Uploading the file $f as property"
    curl --location --request POST "$IPADDR/project/add/propertyfile" \
    --data-raw '{"inserted_id": '$ID', "file": '$f' }'
done