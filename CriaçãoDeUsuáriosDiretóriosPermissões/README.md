# 🔧 Infraestrutura como Código - Criação de Usuários e Diretórios

Script Python que automatiza a gestão de usuários e diretórios em sistemas Linux, implementando o conceito de **Infraestrutura como Código (IaC)**.

## ✨ Principais Recursos

- 👥 Gerenciamento automatizado de usuários e grupos
- 📁 Criação e configuração de diretórios
- 🔐 Configuração de permissões seguindo boas práticas
- 📝 Geração automática de arquivos de boas-vindas
- ⚡ Execução rápida e consistente

## 🔍 Detalhes Técnicos

### Permissões Configuradas
- **Diretórios**: 750 (rwxr-x---)
- **Arquivos**: 644 (rw-r--r--)

### Estrutura Gerada
```
/home/
├── usuario1/
│   └── README.txt
├── usuario2/
│   └── README.txt
└── usuario3/
    └── README.txt
```

## ⚙️ Requisitos do Sistema

- Sistema operacional Linux
  - Ubuntu
  - Debian
  - CentOS
  - Outras distribuições compatíveis
- Python 3.x
- Privilégios de superusuário (root)

## 📦 Instalação

1. Clone o repositório:

git clone https://github.com/seu-usuario/nome-do-repo.git
cd nome-do-repo
```

2. Configure as permissões:

chmod +x script.py
```

## 🚀 Como Usar

1. **Configure os Usuários**

```python
usuarios = [
    {
        "nome": "usuario1",
        "grupo": "grupo1",
        "diretorio": "/home/usuario1"
    },
    # Adicione mais usuários conforme necessário
]
```

2. **Execute o Script**

sudo python3 script.py
```

## 🔍 Monitoramento

O script fornece logs detalhados de:
- ✅ Criação de usuários
- ✅ Criação de grupos
- ✅ Configuração de diretórios
- ✅ Definição de permissões
