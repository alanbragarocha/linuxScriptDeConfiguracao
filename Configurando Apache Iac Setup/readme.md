# Script de Provisionamento Apache (IaC)

## 📝 Descrição
Script automatizado para provisionamento de servidor web Apache utilizando práticas de Infraestrutura como Código (IaC). Implementa configurações de segurança básicas e uma página web inicial personalizada.

## 🚀 Funcionalidades
- Atualização automática do sistema
- Instalação e configuração do Apache
- Implementação de firewall (UFW)
- Configuração do ModSecurity (WAF)
- Sistema de logs detalhados
- Página web responsiva padrão
- Configurações de segurança básicas

## 📋 Pré-requisitos
- Sistema operacional: Ubuntu/Debian
- Privilégios de superusuário (sudo)
- Conexão com internet

## 🔧 Instalação

1. Clone o repositório ou faça o download do script:
```bash
git clone [URL_DO_REPOSITÓRIO]
```

2. Navegue até o diretório do script:
```bash
cd [DIRETÓRIO_DO_SCRIPT]
```

3. Dê permissão de execução:
```bash
chmod +x Apache_Iac_Setup.sh
```

4. Execute o script:
```bash
sudo ./Apache_Iac_Setup.sh
```

## 📊 Estrutura do Script

### Sistema de Logs
```bash
LOG_FILE="/var/log/provisionamento_apache.log"
```

### Componentes Instalados
- Apache2
- Apache2-utils
- libapache2-mod-security2

### Configurações de Segurança
- Firewall UFW ativado
- ModSecurity configurado
- Permissões de diretório otimizadas

## 📝 Logs
Os logs são armazenados em:
```bash
/var/log/provisionamento_apache.log
```

## 🔒 Segurança
- Firewall configurado para HTTP/HTTPS
- ModSecurity ativado para proteção contra ataques web
- Permissões de diretório seguras
- Configurações padrão do Apache otimizadas

## ✅ Verificação
Para verificar se a instalação foi bem-sucedida:
1. Verifique o status do Apache:
```bash
systemctl status apache2
```

2. Acesse no navegador:
```
http://[SEU_IP_OU_DOMINIO]
```

## 🤝 Contribuições
Contribuições são bem-vindas! Para contribuir:
1. Faça um Fork do projeto
2. Crie uma Branch para sua Feature
3. Adicione suas mudanças
4. Faça um Push
5. Abra um Pull Request

## ⚠️ Notas
- Execute apenas em ambientes controlados
- Mantenha o sistema atualizado
- Faça backup antes da execução
- Verifique os logs em caso de falha

## 📄 Licença
Este projeto está sob a licença [INSERIR_TIPO_DE_LICENÇA]

## ✒️ Autor
[SEU_NOME] - [SEU_CONTATO]

---
**Nota**: Personalize o README conforme necessário, adicionando informações específicas do seu projeto.