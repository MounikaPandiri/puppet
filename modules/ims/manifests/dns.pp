class ims::dns{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/dns_files/config.sh"
$script2 = "/home/tcs/dns_files/dns_ins.sh"
#$script3 = "/usr/lib/yuma/libims.so"
#$script4 = "/usr/share/yuma/modules/ims.yang"
$script1source = "$filesource/dns"
#$script3source = "$filesource/yumafiles/libims.so"
#$script4source = "$filesource/yumafiles/ims.yang"

   file { '/home/tcs/dns_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    }->

   file { '/home/tcs/dns_files/dns':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
    }->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_dns.erb'),

    }->
   exec { $script2:
       require => File[$script2],
       logoutput => true,
       refreshonly => true,
       timeout => 1000,
       subscribe => File[$script2]
    }

}

