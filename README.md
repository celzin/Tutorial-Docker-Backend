<div align="center" style="display: inline_block">
  <img align="center" alt="VS" src="https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white" />
  <img align="center" alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" />
  <img align="center" alt="Docker" src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white" />
  <img align="center" alt="MySQL" src="https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white" />
</div>

<br>
<h1 align="center">
    <a>
        <img alt="Banner" title="#Banner" style="object-fit: fill; height:200px;" src="imgs/github-header-image.png"/>
    </a>
</h1>

<div align="center" style="display: inline_block">
  <img align="center" alt="VS" src="https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white" />
  <img align="center" alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" />
  <img align="center" alt="Docker" src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white" />
  <img align="center" alt="MySQL" src="https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white" />
</div>

<br>
<h1 align="center">
    <a>
        <img alt="Banner" title="#Banner" style="object-fit: fill; height:200px;" src="imgs/github-header-image.png"/>
    </a>
</h1>

# **Configuração do Projeto Docker**

## 🐳 **1. Instalação do Docker no Linux**

- ### Atualize seus pacotes:
   ```bash
   sudo apt-get update
   ```

- ### Instale as dependências necessárias:
   ```bash
   sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
   ```

- ### Adicione a chave GPG oficial do Docker:
   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   ```

- ### Adicione o repositório do Docker:
   ```bash
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   ```

- ### Atualize novamente seus pacotes:
   ```bash
   sudo apt-get update
   ```

- ### Instale o Docker:
   ```bash
   sudo apt-get install docker-ce
   ```

- ### Inicie e habilite o serviço Docker:
   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

## 🛢 **2. Instalação da Imagem MySQL**

- ### Puxe a imagem oficial do MySQL para o Docker:
   ```bash
   docker pull mysql
   ```

## 🟢 **3. Instalação do NodeJS**

- ### Atualize seus pacotes:
   ```bash
   sudo apt-get update
   ```

- ### Baixe o script de instalação do Node.js:
   ```bash
   curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
   ```

- ### Instale o Node.js:
   ```bash
   sudo apt-get install -y nodejs
   ```

## 📦 **4. Instalação do NPM**

- ### Atualize o NPM:
   ```bash
   npm install npm@latest -g
   ```

- ### Instale Nodemon:
   ```bash
   npm install -g nodemon
   ```

## 📁 **5. Configuração do Projeto**

- ### Criar Pasta `atividade`:
   ```bash
   mkdir atividade && cd atividade
   ```

  - #### Criar Pasta `BD`:
    ```bash
    mkdir BD
    ```

  - #### Criar arquivo `base_cardapio.sql`:
    - Copie o conteúdo do arquivo `base_cardapio.sql` do repositório do GitHub para esse arquivo.

  - #### Criar `Dockerfile`:
    - Copie o conteúdo do `Dockerfile` do repositório do GitHub para este arquivo.

  - #### Criar `app.js`:
    - Copie o conteúdo do arquivo `app.js` do repositório do GitHub para este arquivo. 
    - Se o comando `npm start` não funcionar, substitua `mysql2` por `mysql` no código.

  - #### Criar `docker-compose.yml`:
    - Copie o conteúdo do arquivo `docker-compose.yml` do repositório do GitHub para este arquivo.

  - #### Criar `package-lock.json`:
    - Copie o conteúdo do arquivo `package-lock.json` do repositório do GitHub para este arquivo.

  - #### Criar `package.json`:
    - Copie o conteúdo do arquivo `package.json` do repositório do GitHub para este arquivo. Lembre-se de alterar `mysql2` para `mysql` se necessário.

## ▶️ **6. Execução**

- ### Inicie o banco de dados MySQL:
   ```bash
   sudo docker run --name mysql-container -d -v /var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=docker -e MYSQL_USER=docker -e MYSQL_PASSWORD=1234 mysql
   ```

- ### Carregue os dados no banco de dados:
   ```bash
   cat ./BD/base_cardapio.sql | docker exec -i mysql-container mysql -udocker -p1234 docker
   ```

- ### Construa a imagem Docker:
   ```bash
   sudo docker build -t api-image .
   ```

- ### Execute o contêiner Docker:
   ```bash
   sudo docker run -p 3000:3000 --link mysql-container -v $(pwd):/usr/app --name api-container api-image
   ```

---

Com isso, seu ambiente Docker com MySQL e Node.js estará configurado e em execução! Você pode acessar a API em `http://localhost:3000`.