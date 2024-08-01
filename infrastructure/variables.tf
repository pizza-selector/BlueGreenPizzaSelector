variable "env" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "new_relic_key" {
  type        = string
  description = "Secret key for new relic"
}
