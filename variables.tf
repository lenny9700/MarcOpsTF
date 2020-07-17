variable "prefix" {
  description = "The prefix used for all resources in this example"
  default     =   "TEST"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default     =   "West Europe"
}
variable "tags" {
    default     = {
        source  = "devops"
        env     = "development"
    }
}