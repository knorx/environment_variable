@test "test foo=foo" {
  grep 'foo=foo' /etc/profile.d/environment_variable__variable__foo.sh
}

@test "test bar=bar" {
  grep 'bar=bar' /etc/profile.d/environment_variable__variable__bar.sh
}

@test "test baz=baz" {
  grep 'baz=baz' /etc/profile.d/environment_variable__variable__baz.sh
}
