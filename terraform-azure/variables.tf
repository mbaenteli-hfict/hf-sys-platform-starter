variable "group_id" {
  description = "Gruppenkürzel (z. B. g1, g2)"
  type        = string
  default     = "g1"
}

variable "location" {
  description = "Erlaubte Azure-Region gemäss Landing-Zone-Policy"
  type        = string
  default     = "switzerlandnorth"

  validation {
    condition     = contains(["switzerlandnorth", "switzerlandwest"], var.location)
    error_message = "Compliance-Verstoss: Es sind nur Schweizer Regionen erlaubt!"
  }
}
