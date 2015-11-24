class yuma_modules {

$filesource = "puppet:///modules/ims"
$script3 = "/usr/lib/yuma/libims.so"
$script4 = "/usr/share/yuma/modules/ims.yang"
$script3source = "$filesource/yumafiles/libims.so"
$script4source = "$filesource/yumafiles/ims.yang"
$config_source = "$filesource/config_files"

   file { '/home/tcs/configuration_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    } ->
   file { '/home/tcs/configuration_files/config_files':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $config_source

    } ->
   exec { '/home/tcs/configuration_files/config_files/config_pem.sh':
       #require => File[$config_file],
       #subscribe => File[$config_file]
   } ->
   file { '/usr/lib/yuma':
       ensure => directory,
       mode => "0777",
       owner => "root",
       group => "root",
    } ->
   file { $script3:
       mode =>"0777",
       owner => "tcs",
       group => "tcs",
       source => $script3source
    } ->
   file { '/usr/share/yuma/modules':
       ensure => directory,
       mode => "777",
       owner => "root",
       group => "root",
    } ->
   file { $script4:
       mode => "777",
       owner => "tcs",
       group => "tcs",
       source => $script4source
    } ->
   exec { '/home/tcs/configuration_files/config_files/config_new.sh':
       #require => File[$config_new],
       #subscribe => File[$config_new]
   }

}

class ims{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/bono_files/config.sh"
$script2 = "/home/tcs/bono_files/bono_ins.sh"
$script1source = "$filesource/bono"

   file { '/home/tcs/bono_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    }->
     
   file { '/home/tcs/bono_files/bono':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
    }->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file.erb'),
    }->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config.erb'),
    }->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
    }->
 
   exec { $script2:
       require => File[$script2],
       logoutput => true,
       refreshonly => true,
       timeout => 1000,
       subscribe => File[$script2]
    }

}


class homestead{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/homestead_files/config.sh"
$script2 = "/home/tcs/homestead_files/homestead_ins.sh"
$script1source = "$filesource/homestead"

   file { '/home/tcs/homestead_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    }->
     
   file { '/home/tcs/homestead_files/homestead':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
    }->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file.erb'),
    }->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_homestead.erb'),
    }->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
    }->
 
   exec { $script2:
       require => File[$script2],
       logoutput => true,
       refreshonly => true,
       timeout => 1000,
       subscribe => File[$script2]
    }
   

}


class homer{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/homer_files/config.sh"
$script2 = "/home/tcs/homer_files/homer_ins.sh"
$script1source = "$filesource/homer"

   file { '/home/tcs/homer_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    }->
     
   file { '/home/tcs/homer_files/homer':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
    }->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file.erb'),
    }->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_homer.erb'),
    }->
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
    }->
 
   exec { $script2:
       require => File[$script2],
       logoutput => true,
       refreshonly => true,
       timeout => 1000,
       subscribe => File[$script2]
    }
  
}

class sprout{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/sprout_files/config.sh"
$script2 = "/home/tcs/sprout_files/sprout_ins.sh"
$script1source = "$filesource/sprout"

   file { '/home/tcs/sprout_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    }->
     
   file { '/home/tcs/sprout_files/sprout':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
    }->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file.erb'),
    }->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_sprout.erb'),
    }->
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
    }->
 
   exec { $script2:
       require => File[$script2],
       logoutput => true,
       refreshonly => true,
       timeout => 1000,
       subscribe => File[$script2]
    }

}

class ellis{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/ellis_files/config.sh"
$script2 = "/home/tcs/ellis_files/ellis_ins.sh"
$script1source = "$filesource/ellis"

   file { '/home/tcs/ellis_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
    }->
     
   file { '/home/tcs/ellis_files/ellis':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
    }->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file.erb'),
    }->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_ellis.erb'),
    }->
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
    }->
   exec { $script2:
       require => File[$script2],
       logoutput => true,
       refreshonly => true,
       timeout => 1000,
       subscribe => File[$script2]
    }

}


class dns_new{

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

