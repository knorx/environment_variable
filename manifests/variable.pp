# Environment_variable::Variable
#
# Manage an environment variable with Puppet.
#
# @param variable The name of the variable to manage
# @param value The value to set the variable to
# @param ensure Whether to add or remove the variable
define environment_variable::variable (
  $value                            = undef,
  $variable                         = $title,
  Enum['present','absent'] $ensure  = present,
) {

  # Attempt to parse variable name and value from title if it is in the form X=x
  if $title =~ /.+=.+/ {
    $split      = split($title, '=')
    $_variable  = $split[0]
    $_value     = $split[1]
  } else {
    $_variable  = $variable
    $_value     = $value
  }

  case $facts['kernel'] {
    "windows": {
      # progressively build up the path with seperate resources.  if the provider
      # doesn't allow this will have to rewrite to be a concat
      windows_env { "${_variable}=${_value}":
        ensure    => present,
        mergemode => clobber,
      }
    }

    "Linux": {
      $file_ensure = $ensure ? {
        "present" => "file",
        default   => "absent",
      }

      file { "/etc/profile.d/environment_variable__variable__${_variable}.sh":
        ensure  => $file_ensure,
        owner   => "root",
        group   => "root",
        mode    => "0644",
        content => "export ${_variable}=${_value}",
      }
    }

    default: {
      fail("#{module_name} does not support ${facts['os']['family']}")
    }
  }
}
