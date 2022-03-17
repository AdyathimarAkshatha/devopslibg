# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Declare the Terraform Module for Cloud Adoption Framework
# Enterprise-scale and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "1.1.3"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name
  library_path   = "${path.root}/lib"


    custom_landing_zones = {
    "${var.root_id}-region-ce" = {
      display_name               = "CE"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-region-uki" = {
      display_name               = "UKI"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-apac" = {
      display_name               = "APAC"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
     "${var.root_id}-region-uki-sap" = {
      display_name               = "SAP"
      parent_management_group_id = "${var.root_id}-region-uki"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-uki-online" = {
      display_name               = "Online"
      parent_management_group_id = "${var.root_id}-region-uki"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-uki-corp" = {
      display_name               = "Corp"
      parent_management_group_id = "${var.root_id}-region-uki"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-ce-online" = {
      display_name               = "Online"
      parent_management_group_id = "${var.root_id}-region-ce"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-ce-corp" = {
      display_name               = "Corp"
      parent_management_group_id = "${var.root_id}-region-ce"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-ce-sap" = {
      display_name               = "SAP"
      parent_management_group_id = "${var.root_id}-region-ce"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-apac-online" = {
      display_name               = "Online"
      parent_management_group_id = "${var.root_id}-region-apac"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-apac-sap" = {
      display_name               = "SAP"
      parent_management_group_id = "${var.root_id}-region-apac"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-region-apac-corp" = {
      display_name               = "Corp"
      parent_management_group_id = "${var.root_id}-region-apac"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus","westus",]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus",]
          }
        }
        access_control = {}
      }
    }
    

  }

}

