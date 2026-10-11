output "core_cluster_networks_id" {
  description = "Map of id values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no id are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "core_cluster_networks_cluster_configuration" {
  description = "Map of cluster_configuration values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no cluster_configuration are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => one(v.cluster_configuration) if v.cluster_configuration != null && length(v.cluster_configuration) > 0 }
}
output "core_cluster_networks_compartment_id" {
  description = "Map of compartment_id values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no compartment_id are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "core_cluster_networks_defined_tags" {
  description = "Map of defined_tags values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no defined_tags are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "core_cluster_networks_display_name" {
  description = "Map of display_name values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no display_name are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "core_cluster_networks_freeform_tags" {
  description = "Map of freeform_tags values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "core_cluster_networks_hpc_island_id" {
  description = "Map of hpc_island_id values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no hpc_island_id are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.hpc_island_id if v.hpc_island_id != null && length(v.hpc_island_id) > 0 }
}
output "core_cluster_networks_instance_pools" {
  description = "Map of instance_pools values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no instance_pools are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.instance_pools if v.instance_pools != null && length(v.instance_pools) > 0 }
}
output "core_cluster_networks_network_block_ids" {
  description = "Map of network_block_ids values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no network_block_ids are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.network_block_ids if v.network_block_ids != null && length(v.network_block_ids) > 0 }
}
output "core_cluster_networks_placement_configuration" {
  description = "Map of placement_configuration values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no placement_configuration are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => one(v.placement_configuration) if v.placement_configuration != null && length(v.placement_configuration) > 0 }
}
output "core_cluster_networks_state" {
  description = "Map of state values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no state are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.state if v.state != null && length(v.state) > 0 }
}
output "core_cluster_networks_time_created" {
  description = "Map of time_created values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no time_created are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "core_cluster_networks_time_updated" {
  description = "Map of time_updated values across all core_cluster_networks, keyed the same as var.core_cluster_networks except keys with no time_updated are omitted"
  value       = { for k, v in oci_core_cluster_network.core_cluster_networks : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

