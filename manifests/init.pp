class debian {
  if $operatingsystem == "Debian" {
    if $operatingsystemrelease =~ /^[0-9\.]+$/ {
      if versioncmp($operatingsystemrelease, "8.0") >=0 {
        $release = "jessie"
      } else {
        if versioncmp($operatingsystemrelease, "7.0") >= 0 {
          $release = "wheezy"
        } else {
          if versioncmp($operatingsystemrelease, "6.0") >= 0 {
            $release = "squeeze"
          } else {
            $release = "lenny"
          } 
        }
      }
    } else {
      $release = $operatingsystemrelease ? {
        /^wheezy/ => "wheezy",
        default => "unknown"
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
    default => false
  }

  $wheezy = $release ? {
    "wheezy" => true,
    default => false
  }
}
