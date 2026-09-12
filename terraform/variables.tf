variable "node_count" {
  description = "Number of enterprise server nodes to provision"
  type        = number
  default     = 2
}

variable "network_name" {
  description = "Isolated bridge network name"
  type        = string
  default     = "enterprise_net"
}
