# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# You must define the following environment variables.
# ---------------------------------------------------------------------------------------------------------------------

# GOOGLE_CREDENTIALS
# or
# GOOGLE_APPLICATION_CREDENTIALS
# ---------------------------------------------------------------------------------------------------------------------

provider "google" {

 project = "googleproject"
 region  = "us-central1"
 zone    = "us-central1-c"
}

resource "google_compute_instance" "apache_test" {
    name = "apacheserver"
    machine_type = "f1-micro"

    tags = ["http-server"]

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    metadata_startup_script =  file("./apache.sh")

    scheduling {
        preemptible = true
        automatic_restart = false
    }

    network_interface {
        network ="default"
        access_config {

        }
    }
}