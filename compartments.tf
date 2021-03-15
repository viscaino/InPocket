// 2021, Terradorm file created by Bruno Viscaino

###################################################################
##
##      CCOMPARTMENT BLOCK
##      This block deploy the compartment sctucture based on
##      environment prefix and map compartment variables:
##      
##      Sample of deployment:
##      
##      EnvPrefix_Compartment
##      |
##      |_EnvPrefixNetworkCompartment
##      |_EnvPrefixStorageCompartment
##      |_EnvPrefixComputeCompartment
##      |_EnvPrefixDatabaseCompartment
##
##      Repeat it for QA and Dev changing the Environment Prefix
##      variable.
##
###################################################################

## Create a Parent Compartment:
#
resource "oci_identity_compartment" "parent_compartment" {
    compartment_id  = "${var.root_compartment}"
    name            = "${var.env_prefix}_Compartment"
    description     = "${var.env_prefix}_Environment"
    }

## Create a Child Compartments:
## PS: This block use a for_each function based on map variable
#
resource "oci_identity_compartment" "child_compartment" {
    for_each        = "${var.childmap}"
    name            = "${var.env_prefix}${each.key}"
    compartment_id  = "${oci_identity_compartment.parent_compartment.id}"
    description     = "${var.env_prefix} ${each.value}"
}

output "NetworkCompartment_ID" {
    value = "${lookup(oci_identity_compartment.child_compartment["Network"], "id")}"
}

output "ComputeCompartment_ID" {
    value = "${lookup(oci_identity_compartment.child_compartment["Compute"], "id")}"
}

output "StorageCompartment_ID" {
    value = "${lookup(oci_identity_compartment.child_compartment["Storage"], "id")}"
}

output "DatabaseCompartment_ID" {
    value = "${lookup(oci_identity_compartment.child_compartment["Database"], "id")}"
}