#!/bin/bash

cd postprocessors
AMI_ID=$(python ami_jsonparser.py)

# Read in AWS account numbers for sharing the AMI with
IN=$(cat aws_accounts.csv)
IFS=',' read -r -a aws_accounts <<< "$IN"

# Construct a string of AWS accounts with which to share this AMI
PREFIX="Add=["
SUFFIX="]"
HEAD="{UserId="
TAIL="}"
ALL_AWS_ACCOUNTS=$PREFIX

for acct in "${aws_accounts[@]}"
do
    ALL_AWS_ACCOUNTS="$ALL_AWS_ACCOUNTS$HEAD$acct$TAIL,"
done

# Remove trailing comma
ALL_AWS_ACCOUNTS=${ALL_AWS_ACCOUNTS%?}

# Build and format the string before passing it to AWS CLI
ALL_AWS_ACCOUNTS=$ALL_AWS_ACCOUNTS$SUFFIX
echo /usr/local/bin/aws ec2 --region us-east-1 modify-image-attribute --image-id $AMI_ID --launch-permission "$ALL_AWS_ACCOUNTS"

