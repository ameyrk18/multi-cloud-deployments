# multi-cloud-deployments
This repo will allow users to manage multiple companies that have multiple environments (staging, production etc.) and can have environments in multiple cloud providers (some in gcp, some in etc.) plus facilitate application deployments. This repo will do the following
- Provision GKE auto pilot cluster
- Deploy vanilla `nginx` in `services` namespace and `prometheus` + `grafana` in `monitoring` namespace. 
- `Nginx` and `grafana` will be exposed over the internet

### Repo structure
`terraform-modules` - contains all base modules for different cloud providers

`helm-charts` - contains all the application deployments helm charts which will be deployed using terraform

`company-a` - terraform deployment logic for company-a

`company-b` - terraform deployment logic for company-b

# Pre-requirements 
Software requirements
- Access to GCP, AWS or Azure cloud with necessary privileges
- `Terraform v1.4.5` cli
- `jq` cli
- `gcloud` cli  

Install software (Mac users)
- `brew install terraform` 
- `brew install jq `
- `brew install --cask google-cloud-sdk`

# Export credentials 

`export GOOGLE_CREDENTIALS=./key.json`

# GCP GKE cluster and application deployments

- Navigate to appropriate directory 
  
  `cd company-a/dev/gcp`

- Define the variables accordingly 

  `vi company-a/dev/gcp/terraform.tfvars`

- Terraform init 

    ` terraform init`
- Terraform plan 

    `terraform plan`

- Terraform apply 

    `terraform apply`

- Deployments will take approximately 10 minutes 

- To interact with your GKE cluster using kubectl retrieve the credentials by doing below 

  `gcloud container clusters get-credentials <CLUSTER_NAME> --zone <LOCATION> --project <PROJECT_NAME>`
- Retrieve grafana password from kubernetes secret

  `kubectl get secret grafana -n monitoring -o json |  jq '.data' | jq 'map_values(@base64d)'`

- Apply or destroy specific applications from cluster 
   ```terraform destroy -target=helm_release.nginx
   terraform destroy -target=helm_release.prometheus
   terraform destroy -target=helm_release.grafana
  
   terraform apply -target=helm_release.nginx
   terraform apply -target=helm_release.prometheus
   terraform apply -target=helm_release.grafana

# Improvements 
- Terraform remote state management 
- Use DNS 
- Secure by adding TLS
- Terraform modules should be stored in separate repos so that we can version and tag them
- Helm charts should be stored in dedicated helm repository
- Vault for secret management 
- Use `terragrunt` for DRY code