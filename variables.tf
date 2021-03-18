// 2021, Terradorm file created by Bruno Viscaino
#
# VARIABLE FILE
#

# OCI Region Definition:
#
/*
variable "region" {
    default = "us-ashburn-1"
}
*/
# OCI Tenancy:
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
    default = "InPocket"
}

## VCN Name:
#
variable "vcn_name" {
    default = "vcn"
}

## VCN CIDR:
#
variable "vcn_cidr" {
    default = "11.0.0.0/16"
}

## Public Subnet Name:
#
variable "public_subnet_name" {
    default = "Pub_subnet"
}

## Public Subnet CIDR:
#
variable "public_subnet_cidr" {
    default = "11.0.2.0/24"
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

## SSH Public Key
#
variable "ssh_public_key" {
    description = "include public key into userdata directory"
    default = "id_rsa.pub"
}

## SSH private Key
#
variable "ssh_private_key" {
    default = "id_rsa"
}

variable "instance_image_ocid" {
  type = map(string)

  default = {
    # See https://docs.us-phoenix-1.oraclecloud.com/images/
    # Oracle-provided image "Oracle-Linux-7.5-2018.10.16-0"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaoqj42sokaoh42l76wsyhn3k2beuntrh5maj3gmgmzeyr55zzrwwa"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaitzn6tdyjer7jl34h2ujz74jwy5nkbukbh55ekp6oyzwrtfa4zma"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaa32voyikkkzfxyo4xbdmadc2dmvorfxxgdhpnk6dw64fa3l4jh7wa"
  }
}

variable "flex_instance_image_ocid" {
  type = map(string)
  default = {
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaa6hooptnlbfwr5lwemqjbu3uqidntrlhnt45yihfj222zahe7p3wq"
    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaa6tp7lhyrcokdtf7vrbmxyp2pctgg4uxvt4jz4vc47qoc2ec4anha"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaadvi77prh3vjijhwe5xbd6kjg3n5ndxjcpod6om6qaiqeu3csof7a"
    uk-london-1 = "ocid1.image.oc1.uk-london-1.aaaaaaaaw5gvriwzjhzt2tnylrfnpanz5ndztyrv3zpwhlzxdbkqsjfkwxaq"
  }
}