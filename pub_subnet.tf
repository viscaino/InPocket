// 2021, Terradorm file created by Bruno Viscaino
#
# PUBLIC SUBNET
#

resource "oci_core_subnet" "public" {    
    display_name        = "${var.env_prefix}${var.vcn_name}${var.public_subnet_name}"
    compartment_id      = "${lookup(oci_identity_compartment.child_compartment["Network"], "id")}"
    vcn_id              = "${oci_core_vcn.create_vcn.id}"
    cidr_block          = "${var.public_subnet_cidr}"
    route_table_id      = "${oci_core_route_table.public.id}"
    security_list_ids   = ["${oci_core_security_list.seclist_public.id}"]
    prohibit_public_ip_on_vnic = false
}

output "Public_Subnet_ID" {
    value       = "${oci_core_subnet.public.id}"
}