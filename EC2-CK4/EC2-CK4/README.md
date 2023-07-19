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

$ export AWS_ACCESS_KEY_ID="AKIASQBWOYQMJ5HOZS7P"
$ export AWS_SECRET_ACCESS_KEY="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"
$ export AWS_REGION="us-east-1"
$ terraform plan