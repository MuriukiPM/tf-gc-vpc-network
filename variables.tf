variable "network_name" {}
variable "network_auto_create_subnetworks" {
  type        = bool
  description = "whether to create default subnets or not"
  default     = false
}
variable "network_description" {
  type        = string
  description = "describe your network homie"
  default     = "vpc"
}
variable "network_routing_mode" {
  type         = string
  describption = "REGIONAL or GLOBAL"
  default      = "REGIONAL"
}
variable "subnetworks" {
  description = "Map of subnetwork names to configuration"
  default     = {}
}
