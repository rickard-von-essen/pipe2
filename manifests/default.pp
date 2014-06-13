class { 'java':
  package => 'java-1.7.0-openjdk-devel.x86_64',
}

class { 'jenkins':
  install_java => false,
}

package { 'unzip': }
include gradle

jenkins::plugin {
    "git" : ;
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
