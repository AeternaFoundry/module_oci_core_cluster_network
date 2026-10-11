resource "oci_core_cluster_network" "core_cluster_networks" {
  for_each = var.core_cluster_networks

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "instance_pools" {
    for_each = each.value.instance_pools
    content {
      defined_tags              = instance_pools.value.defined_tags
      display_name              = instance_pools.value.display_name
      freeform_tags             = instance_pools.value.freeform_tags
      instance_configuration_id = instance_pools.value.instance_configuration_id
      size                      = instance_pools.value.size
    }
  }

  placement_configuration {
    availability_domain  = each.value.placement_configuration.availability_domain
    placement_constraint = each.value.placement_configuration.placement_constraint
    primary_subnet_id    = each.value.placement_configuration.primary_subnet_id
    dynamic "primary_vnic_subnets" {
      for_each = each.value.placement_configuration.primary_vnic_subnets != null ? [each.value.placement_configuration.primary_vnic_subnets] : []
      content {
        dynamic "ipv6address_ipv6subnet_cidr_pair_details" {
          for_each = primary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details != null ? primary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details : []
          content {
            ipv6subnet_cidr = ipv6address_ipv6subnet_cidr_pair_details.value.ipv6subnet_cidr
          }
        }
        is_assign_ipv6ip = primary_vnic_subnets.value.is_assign_ipv6ip
        subnet_id        = primary_vnic_subnets.value.subnet_id
      }
    }
    dynamic "secondary_vnic_subnets" {
      for_each = each.value.placement_configuration.secondary_vnic_subnets != null ? each.value.placement_configuration.secondary_vnic_subnets : []
      content {
        display_name = secondary_vnic_subnets.value.display_name
        dynamic "ipv6address_ipv6subnet_cidr_pair_details" {
          for_each = secondary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details != null ? secondary_vnic_subnets.value.ipv6address_ipv6subnet_cidr_pair_details : []
          content {
            ipv6subnet_cidr = ipv6address_ipv6subnet_cidr_pair_details.value.ipv6subnet_cidr
          }
        }
        is_assign_ipv6ip = secondary_vnic_subnets.value.is_assign_ipv6ip
        subnet_id        = secondary_vnic_subnets.value.subnet_id
      }
    }
  }

  dynamic "cluster_configuration" {
    for_each = each.value.cluster_configuration != null ? [each.value.cluster_configuration] : []
    content {
      hpc_island_id     = cluster_configuration.value.hpc_island_id
      network_block_ids = cluster_configuration.value.network_block_ids
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

