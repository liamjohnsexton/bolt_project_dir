# Class: profile::base::linux::backups
#
#
class profile::base::linux::backups {
  # This simulates backups for the purposes of a demo

  $files = [
    '/tmp/backup_2019_04_01.dat',
    '/tmp/backup_2019_04_02.dat',
    '/tmp/backup_2019_04_03.dat',
    '/tmp/backup_2019_04_04.dat',
    '/tmp/backup_2019_04_05.dat',
    '/tmp/backup_2019_04_06.dat',
  ]

  $files.each |$file| {
    exec { "Create backup ${file}":
      command => "dd if=/dev/zero of=${file} count=10240 bs=10240",
      path    => $facts['path'],
      creates => $file,
    }
  }
}
