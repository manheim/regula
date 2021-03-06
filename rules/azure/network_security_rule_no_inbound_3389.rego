# Network security group rules should not permit ingress from '0.0.0.0/0' to port 3389 (RDP).
# Removing unfettered connectivity to remote console services, such as RDP, 
# reduces a server's exposure to risk.
package rules.network_security_rule_no_inbound_3389

import data.fugue.azure.network_security_group

resource_type = "azurerm_network_security_rule"
controls = {
  "CIS_Azure_1.1.0_6-2",
  "NIST‌-800-53_AC‌-4",
  "NIST‌-800-53_SC‌-7a",
  "NIST‌-800-53_SI‌-4a.2",
  "REGULA_R00020",
}

default deny = false

deny {
  network_security_group.rule_allows_anywhere_to_port(input, 3389)
}
