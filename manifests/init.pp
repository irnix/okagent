# Class: okagent
#
# Use:
# class { 'okagent':
#   token => '########-####-####-####-############'
# }
#
#
class okagent (
  $token = false,
) {
  # resources
  if $token {
    exec { 'install-okagent':
      command => "wget -O - https://okmeter.io/agent/install_supervisor.sh | sh -s - ${token}",
      creates => '/usr/local/okagent/supervisor',
      path    => '/sbin:/bin:/usr/sbin:/usr/bin',
    }

    file { '/usr/local/okagent/agent.token':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "${token}
",
      require => Exec['install-okagent'],
      notify  => Service['okagent'],
    }

    file { '/etc/init.d/okagent-status':
      source => 'puppet:///modules/okagent/init.d/okagent-status',
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
    }

    service { 'okagent':
      enable  => true,
      ensure  => true,
      status  => '/etc/init.d/okagent-status',
      require => [
        Exec['install-okagent'],
        File['/etc/init.d/okagent-status'],
      ]
    }

  }

}
