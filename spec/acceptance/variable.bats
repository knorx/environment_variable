@test "usr/local/bin added" {
  grep 'foo=foo' /etc/profile.d/environment_variable__variable__foo.sh
}

@test "/opt/oracle/bin added" {
  grep 'bar=bar' /etc/profile.d/environment_variable__variable__bar.sh
}
