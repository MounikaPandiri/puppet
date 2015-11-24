class myfile {

$filesource = "puppet:///modules/mymodule"
$script1 = "/home/tcs/Backup/ha_files/p.sh"
$script1source = "$filesource/ha_files"
$script2 = "/usr/lib/yuma/libhaproxy.so"
$script3 = "/home/tcs/modules/haproxy.yang"
$script2source = "$filesource/libhaproxy.so"
$script3source = "$filesource/haproxy.yang"
    file { '/home/tcs/Backup':
        ensure => directory,
        mode => '0777',
        owner => 'tcs',
        group => 'tcs',
    }

    file { '/home/tcs/Backup/ha_files':
        ensure => directory,
        source => $script1source,
        mode => '0777',
        recurse => "remote",
        owner => 'tcs',
        group => 'tcs',
    }

    file { '/home/tcs/modules':
        ensure => directory,
        mode => '0777',
        owner => 'tcs',
        group => 'tcs',
    }

    file { $script3:
        mode => '0777',
        owner => 'tcs',
        group => 'tcs',
        source => $script3source,
    }

    file { $script1:
        mode => "0777",
        owner => 'tcs',
        group => 'tcs',
        content => template('mymodule/config.erb'),
    }

    exec { $script1:
        require => File[$script1],
        timeout => 3000,
        subscribe => File[$script1],
    } ->
    file { '/usr/lib/yuma':
        ensure => directory,
        mode => '0777',
        owner => 'root',
        group => 'root',
    } ->
    file { $script2:
        mode => "0777",
        owner => 'tcs',
        group => 'tcs',
        source => $script2source,
    }

}

