variable "image_tag" {
  description = "Tag des lokal gebauten Docker-Images aus Sprint 1"
  type        = string
  default     = "hf-sys-app:v1"
}

variable "app_version" {
  description = "Umgebungsvariable APP_VERSION im Container"
  type        = string
  default     = "tf-managed-1.0"
}
