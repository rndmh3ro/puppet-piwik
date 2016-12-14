class piwik::params {
  $web_server = 'apache'
  $version    = 'latest'
  $download_baseurl = 'http://builds.piwik.org/'

  if $web_server {
    if $web_server == 'apache' {
      $path    = '/var/www/html'
      $user    = 'apache'
    } else {
      $path    = '/srv/piwik'
      $user    = 'root'
    }
  }
}
