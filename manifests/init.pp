# This class can be used to install DNS.
#
# @example when declaring the dns class
#  class { 'r_studio': }
#
# @param powerdns Manage powerdns on this node.
class r_studio (
  Boolean $ensure = true,
) {
  file { "/tmp/rstudio-server-1.1.463-amd64.deb":
    owner   => root,
    group   => root,
    mode    => 644,
    ensure  => present,
    source  => "https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb"
  }

  package { 'r_studio':
    ensure   => latest,
    provider => dpkg,
    source   => "/tmp/rstudio-server-1.1.463-amd64.deb"
  }
}
