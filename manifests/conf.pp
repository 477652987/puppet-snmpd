# -=-=-=-=-=-=-=-=config start=-=-=-=-=-=-=-=-
# snmpd config from puppet
# dev : zhangjie@117go.com
# last modifily : 2015-02-08
# travo .inc
# puppet master root: /etc/puppet/modules/snmpd/manifests/conf.pp
# -=-=-=-=-=-=-=-=config start=-=-=-=-=-=-=-=-

class snmpd::conf 
(
    $file      = file
)
inherits snmpd::params 
{
    File {
        ensure  => $file,
        owner   => "root",
        group   => "root",
        mode    => "0644",
        require => Package[$package_name]
    }
    
    file { "$service_config":
        content => template("snmpd/snmpd.erb")
    }

}
