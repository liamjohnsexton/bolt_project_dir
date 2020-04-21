case $facts['kernel'] {
  'windows': {
    include role::server
  }
  'Linux': {
    include role::server
  }
  default: {
    fail('Unsupported operating system!')
  }
}
