variable "project_id" { type = string }
variable "region"     { type = string  default = "us" }

# Personas as Google Groups
variable "group_fine_grained" { type = string  default = "" }
variable "group_masked"       { type = string  default = "" }
