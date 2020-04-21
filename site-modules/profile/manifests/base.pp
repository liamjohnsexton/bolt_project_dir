# This profile is included on all servers
class profile::base {
  include profile::base::security

  class { 'os_patching':
    fact_upload => false,
  }

  # OS specific base things
  case $facts['kernel'] {
    'windows': {
      include profile::base::windows
    }
    'linux': {
      include profile::base::linux
    }
    default: { fail('OS not supported') }
  }
}
