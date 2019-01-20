RandomGame := Object clone
RandomGame create := method(
    "game created" println
    game := self clone
    game number := Random value(0, 100) floor
    game
)
RandomGame guess := method(value, 
  result := if(value > self number, "greater", if(value < self number, "less", "Exactly!"))
  result println
  self number == value
)

tries := 10

game := RandomGame create
isGuessedRight := false
while(tries > 0 and isGuessedRight != true, 
  "Try to guess" println
  tries := tries - 1
  input := File standardInput readLine asNumber
  isGuessedRight := game guess(input) 
)