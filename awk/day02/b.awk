function score(rounds) {
  max["red"]=0; max["green"]=0; max["blue"]=0;
  for (r in rounds) {
    split(rounds[r], reveal, ", ")
    for (x in reveal) {
      split(reveal[x], color, " ")
      count=color[1]; shade=color[2]
      max[shade]=(max[shade]>count)?max[shade]:count
    }
  }
  return max["red"] * max["green"] * max["blue"]
}

{
  split($0, game, ": ")
  split(game[2], rounds, "; ")
  SUM += score(rounds)
}
END { print SUM }
