{
    "properties": {
      "displayName": "tag_pol",
      "policyType": "Custom",
      "mode": "Indexed",
     
      },
      "parameters": {},
      "policyRule": {
        "if": {
          "allof": [
            {
              "field": "tags",
              "exists": "false"
            }
          ]
        },
        "then": {
          "effect": "deny"
        }
      }
    },
    "id": "",
    "type": "Microsoft.Authorization/policyDefinitions",
    "name": "tag_policy"
  }