# Introduction 
Local development commands:

```
az login
terraform init -reconfigure -backend-config="dev.config"
terraform plan -var-file="tfvars/dev.json"
```
