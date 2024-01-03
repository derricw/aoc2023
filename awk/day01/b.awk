BEGIN {
  n["one"]=1; n["two"]=2; n["three"]=3; n["four"]=4; n["five"]=5; n["six"]=6; n["seven"]=7; n["eight"]=8; n["nine"]=9
  nums = "(one|two|three|four|five|six|seven|eight|nine)"
}
{
  more = 1
  while (more) {
    more = match($0, nums, arr)
    if (more) {
      found = arr[1]
      sub(found, n[found] substr(found, 2, length(found)-1), $0)
    }
  }
  gsub("[a-zA-Z]", "");
  SUM+=(substr($0, 0, 1) substr($0, length($0), 1))
}
END { print SUM }
