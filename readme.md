# Terraform Azure VM Setup

Dieses Repository erstellt eine virtuelle Maschine (VM) in Microsoft Azure mit Terraform und richtet automatisch eine passende Ansible-Inventory-Datei ein.

## Voraussetzungen

- [Terraform](https://www.terraform.io/downloads)
- Ein aktives Azure-Konto
- `az login` wurde bereits ausgeführt
- SSH ist auf deinem Rechner installiert (`ssh-keygen`)

## Vorbereitungsschritte

### 1. SSH-Key erstellen

Wichtig:  
Bei der Erstellung des SSH-Keys **kein Passwort setzen**, da der Schlüssel später automatisiert für Ansible verwendet wird!

Falls du noch keinen SSH-Schlüssel hast, erstelle einen mit:

    ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure.key

- `~/.ssh/azure.key` ist der private Schlüssel (niemals veröffentlichen!)  
- `~/.ssh/azure.key.pub` ist der öffentliche Schlüssel, den Terraform verwendet

### 2. Konfiguration anpassen

Bearbeite die Datei `config-vars.tf` und trage dort deine individuellen Einstellungen ein:

    variable "config" {
      default = {
        vm_name     = "mein-vm-name"
        location    = "westeurope"
        vm_size     = "Standard_B1s"
        ssh_key_pub = "~/.ssh/azure.key.pub"
        ssh_key     = "~/.ssh/azure.key"
      }
    }

Achte darauf, dass die Pfade zu deinem SSH-Schlüssel korrekt gesetzt sind.

## Deployment starten

    terraform init
    terraform apply

## Nach dem Deployment

Terraform erstellt automatisch:

- die virtuelle Maschine in Azure  
- eine Datei `inventory.yml`, die direkt mit Ansible genutzt werden kann

    ansible-playbook -i inventory.yml playbook.yml

## Projektstruktur

    .
    ├── config-var.tf
    ├── inventory.tpl
    ├── network.tf
    ├── output.tf
    ├── provider.tf
    ├── readme.md
    ├── resourcegroup.tf
    ├── security-group.tf
    ├── vars.tf
    └── vm.tf

## Hinweise

- Die SSH-Keys niemals ins Repository einchecken!  
- Bei mehreren VMs kannst du später auf `count` oder `for_each` erweitern.  
- Dieses Setup ist ideal für Test-VMs, Lab-Umgebungen oder DevOps-Schulungen.

Viel Spaß beim Bauen!  
Fragen oder Anregungen? Eröffne einfach ein Issue.
