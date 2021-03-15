// 2021, Terradorm file created by Bruno Viscaino

## Create a Parent Compartment:
#
resource "oci_identity_compartment" "parent_compartment" {
    compartment_id  = "${var.root_compartment}"
    name            = "${var.env_prefix}_Compartment"
    description     = "${var.env_prefix}_Environment"
}