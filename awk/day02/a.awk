
function is_possible(rounds) {
  for (r in rounds) {
    split(rounds[r], reveal, ", ")
    for (x in reveal) {
      split(reveal[x], color, " ")
      if (color[1] > limits[color[2]]) {
        return 0
      }
    }
  }
  return 1
}
BEGIN { limits["red"]=12; limits["green"]=13; limits["blue"]=14 }
{
  split($0, game, ": ")
  sub(/Game /, "", game[1])
  split(game[2], rounds, "; ")

  SUM += is_possible(rounds) * game[1]

}
END { print SUM }
