class debian {
  if $operatingsystem == "Debian" and $operatingsystemrelease == "6.0" {
    $release = "squeeze"
  } else {
    $release = "lenny"
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
