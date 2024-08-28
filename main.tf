# Définition des variables
variable "target_ip" {
  description = "IP address to ping"
  type        = string
}

# Utilisation de la ressource null pour exécuter une commande locale
resource "null_resource" "ping_ip" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Pinging ${var.target_ip}..."
      ping -c 4 ${var.target_ip}  # Effectue un ping 4 fois
    EOT
  }
}

# Sortie de l'IP pour vérification
output "ping_target_ip" {
  description = "The IP address that was pinged"
  value       = var.target_ip
}
