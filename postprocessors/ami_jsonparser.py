#!/usr/bin/env python

import json

with open('../manifest.json', 'r') as f:
    data=json.load(f)

# Extract AMI ID from the latest build - last array element of "builds"
tokens = data["builds"][-1]["artifact_id"].split(":")
print(tokens[1])