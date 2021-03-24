# Packer 

This configuartion can be used to spin up an EC2 instance, provison Apache or Nginx on Amazon Linux OS and package the snapshot as an Amazon Machine Image (AMI).
The pipeline gets triggered when there is a `push` on the master branch.

## Add AWS Credentials

```
{
"aws_access_key":"",
"aws_secret_key":"",
"token":"",
"ssh_username":""
}

```

## About

- The configuration is integrated with [Goss](https://github.com/aelsabbahy/goss) for testing the Image.
- On Pull Request it validates the configuration based on the scripts mentioned in test.yaml file.
- On Merge it builds the nginx image in configured AWS Account.

## Run it locally to test

- Download and Install `Packer` [Click Here](https://www.packer.io/)
- Install the binary `packer-provisioner-goss` [Click Here](https://github.com/YaleUniversity/packer-provisioner-goss/releases/tag/v3.0.2)
- Run the command `packer validate -var-file=vars.json template.json` to see if everything is working fine. If the configuration is successful, it will exit with status code `0` else errors will be thrown. 

## Contributors

- [Ranopriyo Neogy](https://github.com/ranopriyo-neogy) - Initial work




