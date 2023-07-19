* Deploy resources:

```bash
terraform init -backend-config=./env/dev/backend.hcl
Windows - terraform init -backend-config='./env/dev/backend.hcl'
terraform workspace select dev
terraform plan -target=module.servicePrincipal
Windows - terraform plan -target='module.servicePrincipal'
terraform apply --target=module.servicePrincipal
Windows - terraform apply --target='module.servicePrincipal'
terraform plan
terraform apply -auto-approve
```

