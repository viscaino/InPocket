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
    availability_domain = "hSxN:US-ASHBURN-AD-2"
    compartment_id      = "${oci_identity_compartment.parent_compartment.id}"
    display_name        = "ServName1"
    shape               = "VM.Standard.E2.2"
    
    source_details {
        source_type = "image"
        source_id   = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda"
    }

    create_vnic_details {
        subnet_id           = "${oci_core_subnet.public.id}"
        display_name        = "ServName1_pubvnic"
        assign_public_ip    = true
    }
    /*
    metadata    = {
        ssh_authorized_keys = "${file(var.ssh_public_key)}"
    }
    */
}