// 2020, Terradorm file created by Bruno Viscaino

###################################################################
##
##      COMPUTE INSTANCE
##      This block deploy:
##          - Compute
##
##          
###################################################################

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

#--INSTANCE-CREATION------------------------------------------------------------------------------------
#
resource "oci_core_instance" "my_pub_instance" {
    region              = "us-ashburn-1"
    availability_domain = data.oci_identity_availability_domain.ad.name
    compartment_id      = "${oci_identity_compartment.parent_compartment.id}"
    display_name        = "ServName1"
    shape               = "VM.Standard.E3.Flex"

    shape_config {
    ocpus = 2
    memory_in_gbs = 4
    }
    
    source_details {
        source_type = "image"
        source_id = var.flex_instance_image_ocid[var.region]
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