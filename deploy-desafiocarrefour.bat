@echo off
SETLOCAL

REM === CONFIGURAÇÕES ===
SET AWS_REGION=sa-east-1
SET ACCOUNT_ID=886819404756
SET REPOSITORY_NAME=desafiocarrefour
SET IMAGE_TAG=latest
SET CLUSTER_NAME=desafio-cluster
SET SERVICE_NAME=desafiocarrefour-service

REM === 1. Build da imagem local ===
echo.
echo [1/5] Buildando imagem Docker...
docker build -t %REPOSITORY_NAME% .

REM === 2. Login no Amazon ECR ===
echo.
echo [2/5] Fazendo login no ECR...
aws ecr get-login-password --region %AWS_REGION% | docker login --username AWS --password-stdin %ACCOUNT_ID%.dkr.ecr.%AWS_REGION%.amazonaws.com

REM === 3. Tag e push da imagem ===
echo.
echo [3/5] Enviando imagem para o ECR...
docker tag %REPOSITORY_NAME%:latest %ACCOUNT_ID%.dkr.ecr.%AWS_REGION%.amazonaws.com/%REPOSITORY_NAME%:%IMAGE_TAG%
docker push %ACCOUNT_ID%.dkr.ecr.%AWS_REGION%.amazonaws.com/%REPOSITORY_NAME%:%IMAGE_TAG%

REM === 4. Forçar redeploy no ECS ===
echo.
echo [4/5] Atualizando ECS para usar nova imagem...
aws ecs update-service --cluster %CLUSTER_NAME% --service %SERVICE_NAME% --force-new-deployment --region %AWS_REGION%

REM === 5. Exibir URL pública do Load Balancer ===
echo.
echo [5/5] URL do Load Balancer:
aws elbv2 describe-load-balancers --names %REPOSITORY_NAME%-alb --region %AWS_REGION% --query "LoadBalancers[0].DNSName" --output text

ENDLOCAL
pause