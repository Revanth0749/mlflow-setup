variable "alias" {
  type = string
  description = "Alias for the key, must start with alias/"

  validation {
    condition = startswith(var.alias, "alias/")
    error_message = "The alias must start with alias/"
  }
}

variable "description" {
  type = string
  description = "What this key is used for"
}

variable "deletion_window_in_days" {
  type = number
  description = "Waiting period before a deleted key is actually removed (7 to. 30)."
  default = 30

  validation {
    condition = var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30
    error_message = "deletion_window_in_days must be between 7 and 30"
  }
}

variable "enable_key_rotation" {
  type = bool
  description = "Rotate the key automatically every year"
  default = true
}

variable "key_administrators" {
  type = list(string)
  description = "IAM role/user ARNs that can manage the keybut not use it for encryption."
  default = []
}

variable "key_users" {
  type = list(string)
  description = "IAM role/user ARNs that can use the key to encrypt and decrypt."
  default = []
}

variable "tags" {
  type = map(string)
  description = "Tags applied to the key"
  default = {}
}
