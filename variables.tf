// 2021, Terradorm file created by Bruno Viscaino
#
# VARIABLE FILE
#

variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaakankmz2x3rclvsqfxvro7f6iar2cowvb6inb7pe5th7fmxthrigq"
}

## Root Compartment:
#
variable "root_compartment" {
    default = "ocid1.compartment.oc1..aaaaaaaaxeiis2garnop7rnbhw3c23khblpc72xf7lsstjue2ot3qxwhkpaq"
}

## Environment in use:
#
variable "env_prefix" {
    default = "D101"
}

## Nested Compartment Map:
#
variable "childmap" {
    type = "map"
    default = {
        Network  = "Network Compartment",
        Compute  = "Compute Compartment",
        Storage  = "Storage Compartment",
        Database = "Database Compartment"
    }
}