# -=-=-=-=-=-=-=-=config start=-=-=-=-=-=-=-=-
# snmpd config from puppet
# dev : zhangjie@117go.com
# last modifily : 2015-02-08
# travo .inc
# puppet master root: /etc/puppet/modules/snmpd/manifests/params.pp
# -=-=-=-=-=-=-=-=config start=-=-=-=-=-=-=-=-


class snmpd::params {

  case $::operatingsystem {

    "RedHat", "CentOS", "Aliyun": {
      $package_name        = "net-snmp"
      $service_config      = "/etc/snmp/snmpd.conf"
      $service_name        = "snmpd"
      $mounts_point        = split($::mounts, ',')
    }

    "Debian": {
      $package_name        = "snmpd"
      $service_config      = "/etc/snmp/snmpd.conf"
      $service_name        = "snmpd"
      $mounts_point        = split($::mounts, ',')
    }

    default: {
      fail("Module snmpsmart is not supported on ${::operatingsystem}")
    }
  }
}
