{
  gsub("[a-zA-Z]", "");
  SUM+=(substr($0, 0, 1) substr($0, length($0), 1))
}
END { print SUM }
