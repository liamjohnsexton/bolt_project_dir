# Manages SSH on Linux nodes
class profile::base::linux::ssh_config (
  Boolean $root_login = true,
) {
  # Convert the boolean value to the wordy format that the module expects
  $root_login_value = $root_login ? {
    true  => 'yes',
    false => 'no',
  }

  class { '::ssh':
    permit_root_login           => $root_login_value,
    sshd_client_alive_interval  => '7200',
    sshd_client_alive_count_max => '0',
  }
}
