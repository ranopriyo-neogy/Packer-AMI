#!/bin/bash

echo $stack

cd postprocessors
AMI_ID=$(python ami_jsonparser.py)

/usr/local/bin/aws --region $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e "s/.$//") ssm put-parameter --name "/sit/$stack/new_ami_id" --type "String" --value "$AMI_ID" --overwrite
