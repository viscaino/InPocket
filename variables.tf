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

## Server List Teste
#
variable "server_list" {
    type    = "map"
    default = {
        inst0    = {
            name    = "ServName1",
            ad      = "hSxN:US-ASHBURN-AD-1",
            shape   = "VM.Standard.E2.2",
            image   = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda",
            volname = "ServName1Vol01",
            volsize = "50",
            idxctrl = "0",
            pubip   = "true"
        }

       inst1    = {
          name    = "ServName2",
           ad      = "hSxN:US-ASHBURN-AD-2",
           shape   = "VM.Standard.E2.2",
           image   = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda",
           volname = "ServName2Vol01",
           volsize = "50",
           idxctrl = "1",
           pubip   = "true"
       }

    }
}

## SSH Public Key
#
variable "ssh_public_key" {
    description = "include public key into userdata directory"
    default = "userdata/id_rsa.pub"
}

## SSH private Key
#
variable "ssh_private_key" {
    default = "userdata/id_rsa"
}