class ims{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/bono_files/config.sh"
$script2 = "/home/tcs/bono_files/bono_ins.sh"
$script1source= "$filesource/bono"

  file { '/home/tcs/bono_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
     } ->
     
   file { '/home/tcs/bono_files/bono':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
     } ->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file.erb'),
     } ->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config.erb'),
     } ->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
     } ->
 
   exec { $script2:
       require => File[$script2],
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
     } ->
     
   file { '/home/tcs/homestead_files/homestead':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
     } ->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file_homestead.erb'),
     } ->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_homestead.erb'),
     } ->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
     } ->
 
   exec { $script2:
       require => File[$script2],
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
     } ->
     
   file { '/home/tcs/homer_files/homer':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
     } ->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file_homer.erb'),
     } ->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_homer.erb'),
     } ->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
     } ->
 
   exec { $script2:
       require => File[$script2],
       subscribe => File[$script2]
    }
}
class ellis{

$filesource = "puppet:///modules/ims"
$script1 = "/home/tcs/ellis_files/config_ellis.sh"
$script2 = "/home/tcs/ellis_files/ellis_ins.sh"
$script1source= "$filesource/bono"

  file { '/home/tcs/ellis_files':
       ensure => directory,
       mode => '0777',
       owner => 'tcs',
       group => 'tcs'
     } ->
     
   file { '/home/tcs/ellis_files/ellis':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
     } ->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_ellis_file.erb'),
     } ->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_ellis.erb'),
     } ->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
     } ->
 
   exec { $script2:
       require => File[$script2],
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
     } ->
     
   file { '/home/tcs/sprout_files/sprout':
       ensure => directory,
       mode => '0777',
       recurse => "remote",
       owner => 'tcs',
       group => 'tcs',
       source => $script1source
     } ->
   file { $script1:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_file_sprout.erb'),
     } ->
   file { $script2:
       mode => '0777',
       owner => 'tcs',
       group => 'tcs',
       content => template('ims/config_sprout.erb'),
     } ->  
   exec { $script1:
       require => File[$script1],
       subscribe => File[$script1]
     } ->
 
   exec { $script2:
       require => File[$script2],
       subscribe => File[$script2]
    }
}
