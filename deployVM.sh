#!/bin/bash

# Create resource group
az group create --location uksouth --name resource-grp-app

# Create VM
az vm create --name vm1 --resource-group resource-grp-app --size Standard_B1ms --image UbuntuLTS --admin-username nas

# Open Port
az vm open-port --name vm1 --resource-group resource-grp-app --port 80

# Add custom extension
az vm extension set \
    --vm-name vm1 \
    --resource-group resource-grp-app \
    --name customScript \
    --publish Microsoft.Azure.Extensions \
    --protected-settings '{ "script": "IyEvYmluL2Jhc2gKCiMgSW5zdGFsbCBEb2NrZXIgYW5kIENvbXBvc2UKYXB0IHVwZGF0ZSAmJiBhcHQgaW5zdGFsbCBnaXQgY3VybCAteQpjdXJsIGh0dHBzOi8vZ2V0LmRvY2tlci5jb20gfCBiYXNoCmN1cmwgLUwgImh0dHBzOi8vZ2l0aHViLmNvbS9kb2NrZXIvY29tcG9zZS9yZWxlYXNlcy9kb3dubG9hZC8xLjI3LjQvZG9ja2VyLWNvbXBvc2UtJCh1bmFtZSAtcyktJCh1bmFtZSAtbSkiIC1vIC91c3IvbG9jYWwvYmluL2RvY2tlci1jb21wb3NlCmNobW9kICt4IC91c3IvbG9jYWwvYmluL2RvY2tlci1jb21wb3NlCm5ld2dycCBkb2NrZXIKCiMgSW5zdGFsbCBDaGFwZXJvb3RvZG8KZ2l0IGNsb25lIGh0dHBzOi8vZ2l0bGFiLmNvbS9xYWNkZXZvcHMvY2hhcGVyb290b2RvX2NsaWVudC5naXQKY2QgY2hhcGVyb290b2RvX2NsaWVudApleHBvcnQgREJfUEFTU1dPUkQ9cGFzc3dvcmQKZG9ja2VyLWNvbXBvc2UgcHVsbCAmJiBkb2NrZXItY29tcG9zZSB1cCAtZA==" }'
# Show IP Address
az vm show -d -g resource-grp-app -n vm1 --query publicIps -o tsv