# -=-=-=-=-=-=-=-=config start=-=-=-=-=-=-=-=-
# snmpd config from puppet
# dev : zhangjie@117go.com
# last modifily : 2015-02-08
# travo .inc
# puppet master root: /etc/puppet/modules/snmpd/manifests/init.pp
# -=-=-=-=-=-=-=-=config start=-=-=-=-=-=-=-=-

class snmpd 
inherits snmpd::params
{


include conf


  service { $service_name:
        ensure  => "running",
        enable  => "true",
        require => Package["$package_name"],
}

  package { $package_name:
        ensure => installed,
        allow_virtual => false,
  }

}
