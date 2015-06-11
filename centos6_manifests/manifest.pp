Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

package { 'python-pip':
	ensure => installed,
}

package { 'python-virtualenv':
	ensure => installed,
}

# Needed for Python module 'bz2'
package { 'bzip2-devel':
	ensure => installed,
}

# Needed for module 'psycopg2'
package { 'postgresql-devel':
	ensure => installed,
}

# Update 'setuptools' for Python
exec { "pip-upgrade-setuptools":
  command      => "/usr/bin/pip install --upgrade setuptools",
  onlyif       => "test -f /usr/bin/pip",
}

# Install Python 2.7 for Askbot (required)
exec { "install-python-2.7":
  command      => "/bin/bash /vagrant/install-python-2.7-from-src.sh",
  onlyif       => "test -f /usr/bin/pip",
  subscribe    => Package['bzip2-devel'],
}

class { 'postgresql::server':
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'test_pg_password'
}

# Create new DB for an app
postgresql::server::db { 'app_test_db':
  user                       => 'app_user',
  password                   => postgresql_password('app_user', 'app_user_test_pass'),
}

# Install nginx
package { 'nginx':
	ensure => installed,
}

# Copy basic nginx config
exec { "copy-nginx-basic-conf":
  command      => "/bin/cp /vagrant/nginx_basic.conf /etc/nginx/conf.d/",
  subscribe    => Package['nginx'],
}

# Run nginx process
#service { 'nginx':
#	ensure => running,
#}
