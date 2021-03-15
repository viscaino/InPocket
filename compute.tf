// 2020, Terradorm file created by Bruno Viscaino

###################################################################
##
##      COMPUTE INSTANCE
##      This block deploy:
##          - Compute
##
##          
###################################################################

#--INSTANCE-CREATION------------------------------------------------------------------------------------
#
resource "oci_core_instance" "my_pub_instance" {
    for_each            = "${var.server_list}"
    availability_domain = "${each.value["ad"]}"
    compartment_id      = "${oci_identity_compartment.parent_compartment.id}"
    display_name        = "${each.value["name"]}"
    shape               = "${each.value["shape"]}"
    
    source_details {
        source_type = "image"
        source_id   = "${each.value["image"]}"
    }

    create_vnic_details {
        subnet_id           = "${oci_core_subnet.public.id}"
        display_name        = "${each.value["name"]}_pubvnic"
        assign_public_ip    = "${each.value["pubip"]}"
    }
    
    metadata    = {
        ssh_authorized_keys = "${file(var.ssh_public_key)}"
    }

}