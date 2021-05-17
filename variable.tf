variable "prefix" {description = "The prefix which should be used for the  resources "}

variable "location" {description=  "please enter the reagion wher you want to create the resourec , avaibale locations are westus,westus2,eastus,centralus,centraluseuap,southcentralus,northcentralus,westcentralus,eastus2,eastus2euap,brazilsouth,brazilus,northeurope,westeurope,eastasia,southeastasia,japanwest,japaneast,koreacentral,koreasouth,southindia,westindia,centralindia,australiaeast,australiasoutheast,canadacentral,canadaeast,uksouth,ukwest,francecentral,francesouth,australiacentral,australiacentral2,uaecentral,uaenorth,southafricanorth,southafricawest,switzerlandnorth,switzerlandwest,germanynorth,germanywestcentral,norwayeast,norwaywest,brazilsoutheast,westus3,eastusslv,swedencentral,swedensouth"}

variable "username" {description = "Enter username for the machine"}

variable "vmcount" {description = "Enter no of vm you need "}

variable "password" {description = "please select password ,password must be between 6-72 characters long and must satisfy at least 3 of password complexity requirements from the following: 1) Contains an uppercase character 2) Contains a lowercase character 3) Contains a numeric digit4) Contains a special character5) Control characters are not allowed"}

variable "image_id"  {default = "/subscriptions/f185831c-4d10-44a2-99fe-3f3d3a41de40/resourceGroups/NetworkWatcherRG/providers/Microsoft.Compute/images/myPackerImage"}