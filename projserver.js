{
    "variables": {
     "client_id": "{{`90fad881-17e1-4fa0-91dd-8b489c9b0862`}}",
		"client_secret": "{{`k6Cc~~15_e49nzl~~lL6J.-0EYvj9FWr2F`}}",
		"subscription_id": "{{``}}"
    },

    "builders": [{
      "type": "azure-arm",
  
      "client_id": "{{user `client_id`}}",
      "client_secret": "{{user `client_secret`}}",
      "subscription_id": "{{user `subscription_id`}}",
  
      "os_type": "Linux",
      "image_publisher": "Canonical",
      "image_offer": "UbuntuServer",
      "image_sku": "18.04-LTS",
  
      "managed_image_resource_group_name": "rg-packer-img",
      "managed_image_name": "myPackerImage",
  
      "location": "East US",
      "vm_size": "Standard_A1_v2"
    }],
    "provisioners": [{
      "inline": [
          "apt-get update",
          "apt-get upgrade -y",
          "echo 'Hello,World!' >index.html",
          "nohup busybox httpd -f -p 80 &"
      ],
      "inline_shebang": "/bin/sh -x",
      "type": "shell",
      "execute_command": "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    }]
  } 
