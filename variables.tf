variable "yandex_cloud_id" {
  default = "b1ggp2bhrul82jpvs4rt"
}

variable "yandex_folder_id" {
  default = "b1gh1p257m29u8c4p09p"
}

variable "zone" {
  default = "ru-central1-a"  
}

variable "yandex_cloud_auth" {
  sensitive = true
}

terraform {
  backend "remote" {
    organization = "Rziankin"
    workspaces {
      name = "ws-dmRHJVQpT817shof"
    }
  }
}

provider "random" {}

data "terraform_remote_state" "example" {
  backend = "remote"

  alias = "ws-dmRHJVQpT817shof"
}

locals {
  yandex_cloud_auth = data.terraform_remote_state.example.outputs["yandex_cloud_auth"]
}

output "yandex_cloud_auth" {
  value = local.yandex_cloud_auth
}
