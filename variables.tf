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

## VCN Name:
#
variable "vcn_name" {
    default = "vcn"
}

## VCN CIDR:
#
variable "vcn_cidr" {
    default = "10.0.0.0/16"
}

## Public Subnet Name:
#
variable "public_subnet_name" {
    default = "Pub_subnet"
}

## Public Subnet CIDR:
#
variable "public_subnet_cidr" {
    default = "10.0.2.0/24"
}

## Public Route Table Name:
#
variable "pub_route_tab_name" {
    default = "Pub_RT"
}

## Public Security List Name:
#
variable "public_seclist_name" {
    default = "Pub_SecList"
}