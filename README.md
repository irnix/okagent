# okagent
Puppet module for okagent.
Tested on RHEL6.

## Usage:

	class { 'okagent':
		token => '########-####-####-####-############'
	}

or in hiera:

	---
	classes:
	 - 'okagent'
	
	okagent::token: ########-####-####-####-############
