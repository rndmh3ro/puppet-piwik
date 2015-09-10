class piwik::install_apache () {

  php::module { 'gd': }
  php::module { 'mbstring': }
  php::module { 'mysql': }
  php::module { 'xml': }

  class { 'apache': }

  class { '::apache::mod::php':  }

}
