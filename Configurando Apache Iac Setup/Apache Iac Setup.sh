#!/bin/bash

#-----------------------------------------------
# Script de Provisionamento Aprimorado
# Infraestrutura como Código (IaC)
# Provisionamento Apache Web Server
#-----------------------------------------------

LOG_FILE="/var/log/provisionamento_apache.log"

# Função para registro de logs
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Iniciando provisionamento do servidor Apache."

# Atualizar pacotes e sistema operacional
log "Atualizando pacotes..."
sudo apt update -y && sudo apt upgrade -y

# Instalar Apache com módulos extras úteis
log "Instalando Apache e módulos adicionais..."
sudo apt install -y apache2 apache2-utils libapache2-mod-security2

# Ativar firewall e permitir HTTP/HTTPS
log "Configurando firewall UFW..."
sudo ufw allow 'Apache Full'
sudo ufw --force enable

# Configurar Apache para iniciar automaticamente
log "Habilitando serviço do Apache na inicialização do sistema..."
sudo systemctl enable apache2
sudo systemctl restart apache2

# Configurar ModSecurity (segurança adicional)
log "Ativando ModSecurity para proteção contra ataques web..."
sudo cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
sudo sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/modsecurity/modsecurity.conf
sudo systemctl restart apache2

# Criar uma página padrão personalizada
log "Criando página HTML personalizada..."
sudo bash -c 'cat <<EOF >/var/www/html/index.html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Provisionado com IaC</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f8ff; }
        .container { max-width: 800px; margin: auto; text-align: center; padding-top: 50px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Servidor Apache configurado!</h1>
        <p>Provisionado automaticamente com Infraestrutura como Código.</p>
    </div>
</body>
</html>
EOF'

# Ajustar permissões da pasta web
log "Definindo permissões apropriadas para o diretório web..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Verificar status final do Apache
STATUS=$(systemctl is-active apache2)
if [ "$STATUS" = "active" ]; then
    log "Provisionamento concluído com sucesso. Apache está em execução."
else
    log "Falha ao iniciar o Apache. Verifique manualmente."
fi

exit 0
