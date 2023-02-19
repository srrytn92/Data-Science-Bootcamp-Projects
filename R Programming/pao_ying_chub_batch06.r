start <- 0
win <- 0
draw <- 0
loss <- 0
round <- 0

print(" Hi! Welcome to Rock Paper Scissors")
print("Do you want to play games? 1(yes) or press any key(no)")
start <- readLines(con="stdin",n=1)

while (start == 1){
  bot <- sample(c(1:3),1)
  print ("Please select 1(rock), 2(paper), 3(scissors), press any key to quit")
  user <- readLines(con="stdin",n=1)
  
  # user choose 1 rock
  if(user == 1){
    if(bot == 1){
      print("you ='rock' bot = 'rock' you draw")
      draw <- draw + 1
      round <- round + 1
    }
    else if(bot == 2){
      print("you ='rock' bot = 'paper' you loss")
      loss <- loss + 1
      round <- round + 1
    }
    else if(bot == 3){
      print("you ='rock' bot = 'scissors' you win")
      win <- win + 1
      round <- round + 1
    }
    else {
      print("Please try again")
    }
  }

  # user choose 2 paper
  else if(user == 2){
    if(bot == 1){
      print("you ='paper' bot = 'rock' you win")
      win <- win + 1
      round <- round + 1
    }
    else if(bot == 2){
      print("you ='paper' bot = 'paper' you draw")
      draw <- draw + 1
      round <- round + 1
    }
    else if(bot == 3){
      print("you ='paper' bot = 'scissors' you loss")
      loss <- loss + 1
      round <- round + 1
    }
    else {
      print("Please try again")
    }
  }

  # user choose 3 scissors
  else if(user == 3){
    if(bot == 1){
      print("you ='scissors' bot = 'rock' you loss")
      loss <- loss + 1
      round <- round + 1
    }
    else if(bot == 2){
      print("you ='scissors' bot = 'paper' you win")
      win <- win + 1
      round <- round + 1
    }
    else if(bot == 3){
      print("you ='scissors' bot = 'scissors' you draw")
      draw <- draw + 1
      round <- round + 1
    }
    else {
      print("Please try again")
    }
  }
  else {
    print("Your result summary")
    result <- data.frame(round, win, draw, loss)
    print(result)
    break
  }
}

