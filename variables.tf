variable "core_cluster_networks" {
  description = <<EOT
Map of core_cluster_networks, attributes below
Required:
    - compartment_id
    - instance_pools (block):
        - defined_tags (optional)
        - display_name (optional)
        - freeform_tags (optional)
        - instance_configuration_id (required)
        - size (required)
    - placement_configuration (block):
        - availability_domain (required)
        - placement_constraint (optional)
        - primary_subnet_id (optional)
        - primary_vnic_subnets (optional, block):
            - ipv6address_ipv6subnet_cidr_pair_details (optional, block):
                - ipv6subnet_cidr (optional)
            - is_assign_ipv6ip (optional)
            - subnet_id (required)
        - secondary_vnic_subnets (optional, block):
            - display_name (optional)
            - ipv6address_ipv6subnet_cidr_pair_details (optional, block):
                - ipv6subnet_cidr (optional)
            - is_assign_ipv6ip (optional)
            - subnet_id (required)
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - cluster_configuration (block):
        - hpc_island_id (required)
        - network_block_ids (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    instance_pools = list(object({
      defined_tags              = optional(map(string))
      display_name              = optional(string)
      freeform_tags             = optional(map(string))
      instance_configuration_id = string
      size                      = number
    }))
    placement_configuration = object({
      availability_domain  = string
      placement_constraint = optional(string)
      primary_subnet_id    = optional(string)
      primary_vnic_subnets = optional(object({
        ipv6address_ipv6subnet_cidr_pair_details = optional(list(object({
          ipv6subnet_cidr = optional(string)
        })))
        is_assign_ipv6ip = optional(bool)
        subnet_id        = string
      }))
      secondary_vnic_subnets = optional(list(object({
        display_name = optional(string)
        ipv6address_ipv6subnet_cidr_pair_details = optional(list(object({
          ipv6subnet_cidr = optional(string)
        })))
        is_assign_ipv6ip = optional(bool)
        subnet_id        = string
      })))
    })
    cluster_configuration = optional(object({
      hpc_island_id     = string
      network_block_ids = optional(list(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.core_cluster_networks : (
        length(v.instance_pools) >= 1
      )
    ])
    error_message = "Each instance_pools list must contain at least 1 items"
  }
}

