import os
import subprocess

# Lista de usuários com grupos e diretórios
usuarios = [
    {"nome": "usuario1", "grupo": "grupo1", "diretorio": "/home/usuario1"},
    {"nome": "usuario2", "grupo": "grupo2", "diretorio": "/home/usuario2"},
    {"nome": "usuario3", "grupo": "grupo3", "diretorio": "/home/usuario3"},
]

def executar_comando(comando):
    """Executa um comando no shell e exibe erros, se houver."""
    try:
        subprocess.run(comando, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar comando: {comando}")
        print(e)

def criar_grupo(grupo):
    """Cria um grupo se ele não existir."""
    print(f"Criando grupo: {grupo}")
    executar_comando(f"groupadd -f {grupo}")

def criar_usuario(nome, grupo, diretorio):
    """Cria um usuário e adiciona ao grupo."""
    print(f"Criando usuário: {nome} no grupo {grupo}")
    executar_comando(f"useradd -m -g {grupo} -s /bin/bash {nome}")

def configurar_permissoes(nome, grupo, diretorio):
    """Define permissões no diretório do usuário."""
    print(f"Configurando permissões para {nome} em {diretorio}")
    executar_comando(f"mkdir -p {diretorio}")
    executar_comando(f"chown {nome}:{grupo} {diretorio}")
    executar_comando(f"chmod 750 {diretorio}")

def criar_arquivo_readme(nome, diretorio):
    """Cria um arquivo README no diretório do usuário."""
    caminho = f"{diretorio}/README.txt"
    print(f"Criando README para {nome} em {caminho}")
    with open(caminho, "w") as f:
        f.write(f"Diretório pessoal de {nome}\n")
    executar_comando(f"chown {nome}:{nome} {caminho}")
    executar_comando(f"chmod 644 {caminho}")

# Execução do script
if __name__ == "__main__":
    if os.geteuid() != 0:
        print("Este script precisa ser executado como root (sudo).")
        exit(1)

    for usuario in usuarios:
        criar_grupo(usuario["grupo"])
        criar_usuario(usuario["nome"], usuario["grupo"], usuario["diretorio"])
        configurar_permissoes(usuario["nome"], usuario["grupo"], usuario["diretorio"])
        criar_arquivo_readme(usuario["nome"], usuario["diretorio"])

    print("Configuração concluída!")
