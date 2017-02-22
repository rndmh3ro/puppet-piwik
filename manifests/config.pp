class piwik::config (
  $path,
  $piwik_db_host,
  $piwik_db_username,
  $piwik_db_password,
  $piwik_db_dbname,
  $piwik_db_port,
  $piwik_rec_mail_addr,
  $piwik_noreply_mail_addr,
  $piwik_tracker_cookie_expire,
  $piwik_mail_host,
  $piwik_trusted_hosts,
  $piwik_cronrun_hour,
  $piwik_cronrun_minute,
  $piwik_cronjob_command,
  $piwik_cronjob_user,
) {

  file { "$path/config/config.ini.php":
    ensure  => present,
    require => Class['::piwik::install_piwik'],
    content => template('piwik/config.ini.php.erb'),
  }

  cron { "Cronjob fuer Piwikverarbeitung":
    command => $piwik_cronjob_command,
    hour    => $piwik_cronrun_hour,
    minute  => $piwik_cronrun_minute,
    user    => $piwik_cronjob_user,
  }

}
