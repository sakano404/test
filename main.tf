# Définition des variables
variable "message" {
  description = "The message to echo"
  type        = string
}

# Utilisation de la ressource null pour exécuter une commande locale
resource "null_resource" "echo_message" {
  provisioner "local-exec" {
    command = <<EOT
      echo "${var.message}"
    EOT
  }
}

# Sortie du message pour vérification
output "echoed_message" {
  description = "The message that was echoed"
  value       = var.message
}
