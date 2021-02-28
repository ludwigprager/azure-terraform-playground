# Azure Terraform Playground

## TL;DR
1. Change 
[`TF_VAR_keyvault_name`](./set-env.sh#L5)
and
[`TF_VAR_sta_name`](./set-env.sh#L9)
in
[`set-env.sh`](./set-env.sh)
to globally unique names.
2. Create a service principal by running  
        ```
        ./00-service-principal.sh <subscription name>
        ```
3. Now, give it a few seconds to make its way from AAD to Azure and then run
        ```
        ./10-deploy.sh
        ```

## Overview
This is a compact project that lets you test an Azure setup with terraform.
It essentially consists of a one-button process.
Also
- the terraform state will be stored in a storage account
- all steps are idempotent
- provides a script to clean up
- serves as an ideal starting point for a production project

## Description
The setup consists of three steps:
1. Creation of the service principle: [00-service-principal.sh](./00-service-principal.sh)  
  Oddly, it is not possible to run the subsequent steps in an automatic way because you cannot tell when the SP will be readily available in Azure.
  It is usually enough to wait a few seconds, like e.g. 5 seconds. It is close to always enough to wait 60 seconds. But in rare cases, even then the SP is not ready to use in Azure.
2. Creation of the backend storage and a keyvault for secure access: [20-backend/apply.sh](./20-backend/apply.sh)  
  This step prepares the remote state. It creates a storage account and stores the access key in a vault that is also created. This could be done with the Azure CLI just as well but we use terraform. There is a 'statefile' created in the directory, too. But it will not make its way to a remote location.
  In a production use case, when several people work with the same remote statefile, it would be enough to know the storage account and the vault with the access secret. This is what happens in the next step:
3. Application of your IaC: [30-main/apply.sh](./30-main/apply.sh)  
  After supplying credentials for the storage account to backend.tf the terraform step that is then called will work in any of the following cases:
    - terraform is called for the first time, i.e. the remote state file is empty, no Azure objects are created.
    - terraform has run before, the remote state file reflects the state of the Azure objects. But we modified the tf-files in order to modify the infrastructure.  

    In any case, after the step is (sucessfully) executed the remote state file and the Azure objects will be in sync with the tf-files in [this directory](./30-main).  
    The file [vnet.tf](./30-main/vnet.tf) serves as an example for the infrastructure to be created. Replace it and add your own tf-files to the [30-main](./30-main) directory to accomplish your project.


## Objectives
- for a first test no editing of scripts is necessary. Except for unique names for storage account + vault all should run out of the box. This is the main advantage over other, similar publications.
- ready-to-use test environment for arbitrary azure deployments. Especially for a level of complexity that makes it hard to be created with the portal, only.
- possibility to address issues that appeared in more complex installations. You sometimes want to test things in an isolated environment.

<!--
- idempotent
## Usage
1. create the service principal
    ```
    ./00-service-principal.sh
    ```
   Wait a few seconds until Azure is able to us
2.
-->

<!--
## Use Cases
- repeatedly apply and destroy your IaC (infrastructure as code) including the storage account
- repeatedly apply and destroy your IaC (infrastructure as code) but keep the storage account
- modify your IaC and test the roll-out
-->

## Disclaimer
Since this is a test project 
- both storage account and vault will be deleted when running the 'tear down' script. Take precautions in a productive environment.
- you are not shown a 'terraform plan', the plan is applied immediately without approval.
