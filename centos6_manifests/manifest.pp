Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

package { 'nginx':
	ensure => installed,
}

service { 'nginx':
	ensure => running,
}
