class piwik::install_piwik ($path, $user, $version) {

  if !defined(Package['unzip']) {
    package { 'unzip': }
  }

  if !defined(Package['wget']) {
    package { 'wget':
      ensure => installed,
    }
  }

  if !defined(Package['rsync']) {
    package { 'rsync':
      ensure => installed,
    }
  }


  if $version == 'latest' {
    $real_version = 'latest.zip'
  } else {
    $real_version = "piwik-${version}.zip"
  }

  file { $path:
    ensure => 'directory',
    owner  => $user,
  }

  exec { 'piwik-download':
    path    => '/bin:/usr/bin',
    creates => "${path}/index.php",
    command => "bash -c 'cd /tmp; wget http://builds.piwik.org/${real_version}'",
    require => [ Package['wget'], File[$path] ],
    user    => $user,
  }

  exec { 'piwik-unzip':
    path    => '/bin:/usr/bin',
    creates => "${path}/index.php",
    cwd     => '/tmp',
    command => "bash -c 'unzip -o /tmp/${real_version}'",
    require => [ Exec['piwik-download'], Package['unzip'] ],
    user    => $user,
  }

  exec { 'piwik-copy':
    path    => '/bin:/usr/bin',
    creates => "${path}/index.php",
    command => "bash -c 'rsync -r /tmp/piwik/ ${path}/'",
    require => [ Exec['piwik-unzip'], Package['rsync'] ],
    user    => $user,
  }

  file { "/tmp/${real_version}":
    ensure  => absent,
    require => Exec['piwik-copy'],
  }

  file { '/tmp/piwik':
    ensure  => absent,
    recurse => true,
    force   => true,
    require => Exec['piwik-copy'],
  }
}
