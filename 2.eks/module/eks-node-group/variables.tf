variable "name-cluster" {
    type = string
}

variable "name-node-group" {
    type = string
}

variable "tags-node-group" {
    type = map(string)
}

variable "id-subnet-1" {
    type = string
}
variable "id-subnet-2" {
    type = string
}

variable "cluster-security-group-id" {
    type = string
}

variable "name-role-node-group" {
    type = string
}
variable "name-scg-node-group" {
    type = string
}

variable "id-vpc" {
    type = string
}

variable "node-capacity-type" {
    type = string
}
variable "node-instance-type" {
    type = list(string)
}
variable "min-node-size" {
    type = number
}
variable "max-node-size" {
    type = number
}
variable "desired-node-size" {
    type = number
}