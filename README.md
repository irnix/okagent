# okagent
Puppet module for okagent 

## Usage:

	class { 'okagent':
		token => '########-####-####-####-############'
	}

or in hiera:

	---
	classes:
	 - 'okagent'
	
	okagent::token: ########-####-####-####-############
