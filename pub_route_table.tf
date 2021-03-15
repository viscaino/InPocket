// 2021, Terradorm file created by Bruno Viscaino
#
# PUBLIC ROUTE TABLE
#

resource "oci_core_route_table" "public" {
    display_name    = "${var.env_prefix}${var.vcn_name}${var.pub_route_tab_name}"
    compartment_id  = "${oci_identity_compartment.parent_compartment.id}"
    vcn_id          = "${oci_core_vcn.create_vcn.id}"
    
    route_rules {
        destination         = "0.0.0.0/0"
        network_entity_id   = "${oci_core_internet_gateway.create_igw.id}"
    }
}

output "Public_RouteTable_ID" {
    value       = "${oci_core_route_table.public.id}"
}