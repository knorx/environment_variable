# Environment_variable::Path_element
#
# Add an element to the path.  Can be called multiple times to allow the path to
# be built progressively
#
# @param path The path element to add to $PATH
# @param ensure Whether to add or remove this element
define environment_variable::path_element(
  $path                             = $title,
  Enum['present','absent'] $ensure  = present,
) {
  case $facts['kernel'] {
    "windows": {
      # progressively build up the path with seperate resources.  if the provider
      # doesn't allow this will have to rewrite to be a concat


      #can only be done once presumably? - test this out...
      windows_env { "path_element_${path}":
        ensure    => $ensure,
        variable  => 'PATH',
        value     => $path,
        mergemode => insert,
      }
    }

    "Linux": {
      # drop each line into a file so elements can be managed individually
      $safe_name = regsubst($path, /\//, "_", "G")
      $file_ensure = $ensure ? {
        "present" => "file",
        default   => "absent",
      }

      # leading slash needs to be converted for safety which means we still get
      # 2x underscores between typename and safe name
      file { "/etc/profile.d/environment_variable__path_element_${safe_name}.sh":
        ensure  => $file_ensure,
        owner   => "root",
        group   => "root",
        mode    => "0644",
        content => "PATH=${path}:\$PATH",
      }
    }

    default: {
      fail("#{module_name} does not support ${facts['os']['family']}")
    }
  }
}
