# Class: profile::base::linux
#
#
class profile::base::linux (
  Array $extra_packages = [],
) {
  # All Linux nodes should have epel
  include epel
  include profile::base::linux::backups

  $main_packages = [
    'vim',
    'tree',
    'htop',
    'wget',
  ]

  # Install both the main and extra packages
  package { ($main_packages + $extra_packages):
    ensure => 'present',
  }
}
