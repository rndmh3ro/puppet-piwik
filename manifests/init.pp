# == Class: piwik
#
# === Parameters
#
# [path] The path were piwik should be installed to (default: /srv/piwik)
# [user] The piwik user (default: www-data)
#
# === Examples
#
#  class { 'piwik':
#    path    => '/srv/piwik',
#    user    => 'www-data',
#    version => '2.9.0'
#  }
#
# === Authors
#
# Arthur Leonard Andersen <leoc.git@gmail.com>
#
# === Copyright
#
# See LICENSE file, Arthur Leonard Andersen (c) 2013
#
# Class:: piwik
#
class piwik (
  $web_server        = $::piwik::params::web_server,
  $path              = $::piwik::params::path,
  $user              = $::piwik::params::user,
  $version           = $::piwik::params::version,
  $download_baseurl  = $::piwik::params::download_baseurl,
) inherits ::piwik::params {

  if $web_server {
    class { "::piwik::install_${web_server}":
      before => Class['::piwik::install_piwik'],
    }
  }

  class { '::piwik::install_piwik':
    path             => $path,
    user             => $user,
    version          => $version,
    download_baseurl => $download_baseurl,
  }
}
