// 2021, Terradorm file created by Bruno Viscaino

###-!!WARNING!!-####################################################
##
##      SECURITY LIST FOR PUBLIC SUBNET
##      Consider change the security rules to improve the 
##      security baseline.
##      
###################################################################

resource "oci_core_security_list" "seclist_public" {
    compartment_id      = "${oci_identity_compartment.child_compartment.id}"
    vcn_id              = "${oci_core_vcn.create_vcn.id}"
    display_name        = "${var.env_prefix}${var.vcn_name}${var.public_seclist_name}"

  // allow outbound udp traffic on a port range
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "17" // udp
    stateless   = true

    udp_options {
      min = 319
      max = 320
    }
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

}

output "Public_SecurityList_ID" {
    value       = "${oci_core_security_list.seclist_public.id}"
}