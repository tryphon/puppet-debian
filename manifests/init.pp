class debian {
  if $operatingsystem == "Debian" {
    if $operatingsystemrelease =~ /^[0-9\.]+$/ {
      if versioncmp($operatingsystemrelease, "6.0") >= 0 {
        $release = "squeeze"
      } else {
        $release = "lenny"
      }
    } else {
      $release = $operatingsystemrelease ? {
        /^wheezy/ => "wheezy",
        default => "unknown"
      }
    }
  }
  
  $lenny = $release ? {
    "lenny" => true,
    default => false
  }
  
  $squeeze = $release ? {
    "squeeze" => true,
    default => false
  }
}
