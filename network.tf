// 2021, Terradorm file created by Bruno Viscaino

## CREATE A VCN:

resource "oci_core_vcn" "create_vcn" {
    display_name    = "${var.env_prefix}${var.vcn_name}"
    cidr_block      = "${var.vcn_cidr}"
    compartment_id  = "${oci_identity_compartment.parent_compartment.id}"
}

output "my_vcn" {
    value       = "${oci_core_vcn.create_vcn.id}"
}

## CREATE A INTERNET GATEWAY:

resource "oci_core_internet_gateway" "create_igw" {
    display_name    = "${var.env_prefix}${var.vcn_name}_igw"
    compartment_id  = "${oci_identity_compartment.parent_compartment.id}"
    vcn_id          = "${oci_core_vcn.create_vcn.id}"
}

output "my_igw_id_output" {
    value       = "${oci_core_internet_gateway.create_igw.id}"
}

## CREATE A SERVICE GATEWAY:

resource "oci_core_service_gateway" "create_svcgw" {
    display_name    = "${var.env_prefix}${var.vcn_name}_svcgw"
    compartment_id  = "${oci_identity_compartment.parent_compartment.id}"
    vcn_id          = "${oci_core_vcn.create_vcn.id}"
    services {
    service_id = "${lookup(data.oci_core_services.test_services.services[0], "id")}"
  }
}

output "my_svcgw_output" {
    value       = "${oci_core_service_gateway.create_svcgw.id}"
}

## CREATE A NAT GATEWAY:

resource "oci_core_nat_gateway" "create_natgw" {
    display_name    = "${var.env_prefix}${var.vcn_name}_natgw"
    compartment_id  = "${oci_identity_compartment.parent_compartment.id}"
    vcn_id          = "${oci_core_vcn.create_vcn.id}"  
}

output "my_natgw_output" {
    value       = "${oci_core_nat_gateway.create_natgw.id}"  
}