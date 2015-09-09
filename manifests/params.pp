class piwik::params {
  $web_server = 'apache'
  $version    = 'latest'

  if $web_server == 'apache' {
    $path    = '/var/www/html'
    $user    = 'apache'
  } else {
    $path    = '/srv/piwik'
    $user    = 'root'
  }
}
