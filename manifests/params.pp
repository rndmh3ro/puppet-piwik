class piwik::params {
  $web_server                     = 'apache'
  $version                        = 'latest'
  $download_baseurl               = 'http://builds.piwik.org/'
  $piwik_db_host                  = undef
  $piwpiwik_db_username           = undef
  $piwpiwik_db_password           = undef
  $piwpiwik_db_dbname             = undef
  $piwpiwik_db_port               = undef
  $piwpiwik_rec_mail_addr         = undef
  $piwpiwik_noreply_mail_addr     = undef
  $piwpiwik_tracker_cookie_expire = undef
  $piwpiwik_mail_host             = undef
  $piwik_trusted_hosts            = []

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
