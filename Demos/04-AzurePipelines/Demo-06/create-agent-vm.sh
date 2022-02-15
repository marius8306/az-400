env=vm-agent
loc=westeurope
grp=az400-m04-$env
vmname=devops-$env
user=az400admin
pwd=TiTp4@dmin12334!

az group create -n $grp -l $loc

az vm create -g $grp -n $vmname --admin-username $user --admin-password $pwd --image  MicrosoftWindowsServer:WindowsServer:2022-datacenter-g2:latest --size Standard_E2s_v3 --public-ip-sku Standard

# az vm list-sizes -l $loc -o table
