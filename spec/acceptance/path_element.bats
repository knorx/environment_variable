# BATS test file to run after executing 'examples/init.pp' with puppet.
#
# For more info on BATS see https://github.com/sstephenson/bats

# Tests are really easy! just the exit status of running a command...
@test "usr/local/bin added" {
  grep PATH /etc/profile.d/environment_variable__path_element__usr_local_bin.sh
}

@test "/opt/oracle/bin added" {
  grep PATH /etc/profile.d/environment_variable__path_element__opt_oracle_bin.sh
}
