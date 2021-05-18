# TalentQLAssessment1

This project is fully customizable to enable you test with your desired credentials.

The gcp.tf file initializes a GCP debian VM using terraform and runs the metadata start-up script (./apache.sh) to run apt-get update and install apache.

test_gcp.go verifies that the server is running, tests access to the compute instance via the public IP address and runs terraform.Destroy(t, terraformOptions) to delete all resources created if the tests are successful.

I used jenkins to set up the CI and the pipeline definition is contained in the Jenkinsfile.
