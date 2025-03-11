variable "tags" {
  type = map(string)
  default = {
    Project = "HOTC"
    Environment = "Production"
    Provisioner = "Terraform"
  }
}