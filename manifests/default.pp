class { 'java':
  package => 'java-1.7.0-openjdk-devel.x86_64',
}

class { 'jenkins':
  install_java => false,
}
file { '/var/lib/jenkins/jobs/build_pipes/config.xml':
  source => 'puppet:///modules/config/build_pipes.xml',
  owner  => 'jenkins',
  group  => 'jenkins',
  notify => Service['jenkins'],
}

package { 'git': }
package { 'unzip': }
include gradle

jenkins::plugin {
    "git" : ;
}
jenkins::plugin {
    "credentials" : ;
}
jenkins::plugin {
    "git-client" : ;
}
jenkins::plugin {
    "git-parameter" : ;
}
jenkins::plugin {
    "scm-api" : ;
}
jenkins::plugin {
    "ssh-credentials" : ;
}
jenkins::plugin {
    "ssh-slaves" : ;
}
jenkins::plugin {
    "job-dsl" : ;
}

jenkins::plugin {
    "delivery-pipeline-plugin" : ;
}

jenkins::plugin {
    "build-pipeline-plugin" : ;
}
