
# 🚀 Desafio Técnico - DreamSquad

Este repositório contém a entrega das etapas 1 e 2 do desafio técnico da DreamSquad para a vaga de estágio em Cloud e DevOps, com foco em infraestrutura como código (IaC), AWS, Docker e CI/CD.

---

## ✅ Etapa 1 - Hospedagem de Site Estático com S3 + Terraform

### 🎯 Objetivo
Provisionar a infraestrutura necessária para hospedar um site estático na AWS utilizando **Amazon S3**, de forma totalmente automatizada com o **Terraform**.

---

### 📁 Estrutura
- Aplicação frontend: `frontend/`
- Terraform: arquivos soltos na raiz (`main.tf`, `variables.tf`, `outputs.tf`)

---

### ⚙️ O que foi feito
1. Criado bucket S3 para hospedagem do site
2. Habilitada hospedagem estática no S3
3. Aplicada política pública para leitura dos arquivos
4. Upload automático do `index.html` pelo Terraform
5. DNS do site exposto nos outputs após o `terraform apply`

---

### ▶️ Como rodar a Etapa 1

#### 1. Pré-requisitos
- AWS CLI configurado com perfil `dreamsquad-test`
- Terraform instalado (>= 1.0)
- Permissão para criar recursos S3

#### 2. Comandos
```bash
# Vá para a raiz do projeto (onde está o main.tf do S3)
cd desafio-dreamsquad

# Inicialize o Terraform
terraform init

# (opcional) Valide o código
terraform validate

# Verifique o plano
terraform plan

# Aplique a infraestrutura
terraform apply
```

#### 3. Acessar o site
Após o `terraform apply`, copie a URL exibida no output. Acesse no navegador para ver o site funcionando via S3.

---

## ✅ Etapa 2 - Backend em Contêiner com ECS Fargate + ALB + ECR

### 🎯 Objetivo
Publicar uma aplicação backend containerizada na AWS usando **Docker**, **ECR**, **ECS com Fargate** e **Application Load Balancer**, tudo provisionado com Terraform.

---

### 📁 Estrutura
- Aplicação backend: `backend/`
- Infraestrutura Terraform: `infraestrutura/servico2-backend/`

---

### ⚙️ O que foi feito

#### 🔧 Docker
- Criado `Dockerfile` na raiz de `backend/`
- Imagem buildada localmente
- Testada em ambiente local com sucesso

#### 📦 ECR
- Repositório provisionado via Terraform
- Login via `aws ecr get-login-password`
- Imagem enviada com `docker push`

#### 🚀 ECS + Fargate
- Criado cluster ECS
- Task Definition com container
- Serviço Fargate executando 1 instância

#### 🌐 ALB
- ALB configurado com target group e listener
- Porta 80 redirecionando requisições
- DNS de saída exposto

---

### ▶️ Como rodar a Etapa 2

#### 1. Pré-requisitos
- Docker Desktop ativo
- AWS CLI configurado
- Permissões: ECR, ECS, IAM, VPC, ALB
- Imagem Docker criada localmente

#### 2. Comandos
```bash
# Entre na pasta da infraestrutura
cd desafio-dreamsquad/infraestrutura/servico2-backend

# Inicialize Terraform
terraform init

# (opcional) Verifique o plano
terraform plan

# Aplique a infraestrutura
terraform apply
```

#### 3. Docker: build e push
```bash
# Volte para a pasta backend
cd desafio-dreamsquad/backend

# Build da imagem
docker build -t backend-api .

# Tag da imagem
docker tag backend-api:latest <url-do-ecr>:latest

# Login no ECR
aws ecr get-login-password --region us-east-1 --profile dreamsquad-test | docker login --username AWS --password-stdin <url-do-ecr>

# Push da imagem
docker push <url-do-ecr>:latest
```

#### 4. Acessar backend
Após subir a infraestrutura e fazer o push da imagem:
- Copie o DNS de saída do `terraform apply`
- Acesse no navegador: `http://<dns-do-alb>`
- Teste com `curl` ou Postman

---

## 🧪 Pré-requisitos gerais

- [x] Conta AWS com permissões nos serviços usados
- [x] AWS CLI configurado (perfil `dreamsquad-test`)
- [x] Terraform instalado
- [x] Docker instalado
- [x] Internet ativa para baixar imagens e interagir com AWS

---

## 📁 Estrutura de Pastas

```bash
desafio-dreamsquad/
├── README.md
├── main.tf              # Etapa 1 - S3 + Terraform
├── outputs.tf
├── variables.tf
│
├── backend/             # Etapa 2 - Backend containerizado
│   ├── app/
│   │   └── main.py
│   └── Dockerfile
│
├── frontend/            # Etapa 1 - HTML estático
│   └── index.html
│
└── infraestrutura/
    └── servico2-backend/   # Etapa 2 - Infraestrutura ECS, ECR, ALB
        ├── alb.tf
        ├── ecr.tf
        ├── ecs-cluster.tf
        ├── ecs-service.tf
        ├── ecs-task-definition.tf
        ├── iam-roles.tf
        ├── logs.tf
        ├── main.tf
        ├── networking.tf
        ├── outputs.tf
        ├── security-groups.tf
        ├── terraform.tfvars
        └── variables.tf
```

---

## 💬 Contato
Entrega feita por **Bruno Cesar** para o processo seletivo da **DreamSquad**.
