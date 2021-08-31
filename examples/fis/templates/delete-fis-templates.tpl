#!/bin/bash -ex
OUTPUT='.fis_cli_result'
while read id; do
  aws fis delete-experiment-template --id $${id} --output text --query 'experimentTemplate.id' 2>&1 > /dev/null
done < $${OUTPUT}
rm $${OUTPUT}
