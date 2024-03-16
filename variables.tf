variable "rgname" {
    type = string
    default = "firstrg"  
}

variable "location" {
    type = string
    default = "east us"
}

variable "nsgname" {
    type = string
    default = "first-security-group"
}

variable "vnetname" {
    type = string
    default = "first-network"
}

variable "addressspace" {
    type = string
    default = "10.0.0.0/24"
}

variable "subnetspace1" {
    type = string
    default = "10.0.0.0/25"
}

variable "subnetspace2" {
    type = string
    default = "10.0.0.128/25"
}

variable "dnsserver" {
    type = string
    default = "10.0.0.4"
}

variable "dnsserver2" {
    type = string
    default = "10.0.0.5"
}