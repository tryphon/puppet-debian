# Class: debian
# ===========================
#
# Full description of class debian here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'debian':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class debian {
  if $operatingsystem == "Debian" {
    if $operatingsystemrelease =~ /^[0-9\.]+$/ {
      if versioncmp($operatingsystemrelease, "9.0") >=0 {
        $release = "stretch"
      } elsif versioncmp($operatingsystemrelease, "8.0") >=0 {
        $release = "jessie"
      } elsif versioncmp($operatingsystemrelease, "7.0") >= 0 {
        $release = "wheezy"
      } elsif versioncmp($operatingsystemrelease, "6.0") >= 0 {
          $release = "squeeze"
      } else {
          $release = "lenny"
      }
    } else {
      $release = $operatingsystemrelease ? {
        /^wheezy/ => "wheezy",
        default   => "unknown"
      }
    }
  }

  $jessie = $release ? {
    "jessie" => true,
    default  => false
  }

  $lenny = $release ? {
    "lenny" => true,
    default => false
  }

  $squeeze = $release ? {
    "squeeze" => true,
    default   => false
  }

  $wheezy = $release ? {
    "wheezy" => true,
    default  => false
  }

  $jessie = $release ? {
    "jessie" => true,
    default  => false
  }

  $stretch = $release ? {
    "stretch" => true,
    default   => false
  }
}
