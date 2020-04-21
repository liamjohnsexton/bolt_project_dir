# Class: profile::base::windows
#
#
class profile::base::windows (
  Array $extra_packages = [],
) {
  include profile::base::windows::chocolatey

  $main_packages = [
    'googlechrome',
    'vscode',
    'notepadplusplus.install',
    '7zip.install',
    'putty.install',
  ]

  # Install both the main and extra packages
  package { ($main_packages + $extra_packages):
    ensure   => 'present',
    provider => 'chocolatey',
  }
}
