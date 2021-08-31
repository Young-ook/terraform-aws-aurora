#!/bin/bash -ex
OUTPUT='.fis_cli_result'
TEMPLATES=('failover-db-cluster.json' 'reboot-db-instances.json')

for template in $${TEMPLATES[@]}; do
  aws fis create-experiment-template --cli-input-json file://$${template} --output text --query 'experimentTemplate.id' 2>&1 | tee -a $${OUTPUT}
done
