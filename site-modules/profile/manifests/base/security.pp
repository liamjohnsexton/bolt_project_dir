# Security classe for all servers should go in here
class profile::base::security {
  # OS-specific
  case $facts['kernel'] {
    'windows': {
      include profile::base::windows::firewall
    }
    'Linux': {
      include profile::base::linux::ssh_config
    }
    default: {
      fail('Unsupported operating system!')
    }
  }
}
