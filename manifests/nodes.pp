node 'confluence' {
  package { [ 'xauth', 'wget' ]:
    ensure => installed,
  }
  user { 'confluence':
    ensure      => present,
    comment     =>  'Service account for confluence',
    shell       =>  '/bin/bash',
    home        =>  '/opt/confluence',
    managehome  =>  true,
  }
  file { [ '/opt/confluence/app', '/opt/confluence/data' ]:
    ensure  =>  directory,
    owner   =>  'confluence',
    group   =>  'confluence',
  }

  exec { 'downloading-confluence':
    cwd     =>  '/tmp',
    command =>  '/usr/bin/wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.9.10-x64.bin',
    creates => '/tmp/atlassian-confluence-5.9.10-x64.bin',
  }
}
