topping <- factor(c(1,2,3,4), labels=c("Hawaiian", "Seafood", "Double Cheese Meat", "Chicken Spicy"))
size <- factor(c(1,2,3,4), labels=c("S", "M", "L", "XL"))
spaghetti <- factor(c(1,2,3,4), labels=c("Carbonara", "Pork Bolognese", "Keemao Sausage", "Seafood"))
drink <- factor(c(1,2,3), labels=c("Mineral Water", "Pepsi", "Lipton"))

order_topping <- c()
order_size <- c()
order_spaghetti <- c()
order_drink <- c()
price <- 0

print("Welcome to The Pizza")
print("Do you want to order? (Y/N)")
order <- toupper(readLines("stdin",n=1))
while(order == "Y"){
  print("Please select menu")
  print("Press 1.Pizza")
  print("Press 2.spaghetti")
  print("Press 3.Drinks")
  print("Press 4.Check Bill")
  print("Press any key to quit")
  orders <- readLines("stdin",n=1)
   # Dialogue: Choose topping of pizza
  if (orders == 1) {
    print("Choose your pizza") 
    print("Select Topping")
    print("Press 1.Hawaiian")
    print("Press 2.Seafood")
    print("Press 3.Double Cheese Meat")
    print("Press 4.Chicken Spicy")
    tp <- as.numeric(readLines("stdin", n=1))
    if(tp==1|tp==2|tp==3|tp==4){
      order_topping <- append(order_topping, topping[tp])
      print(paste("Your topping is :", topping[tp]))
      # Dialogue: Choose size of pizza
      print("Select Size")
      print("Press 1.S : 100 BAHT")
      print("Press 2.M : 250 BAHT")
      print("Press 3.L : 300 BAHT")
      print("Press 4.XL : 350 BAHT")
      sz <- as.numeric(readLines("stdin", n=1))
      if(sz==1){
        order_size <- append(order_size, size[sz])
        print(paste("Your topping is : ", topping[tp], "Size : ",size[sz]))
        price <- price + 100
      }else if(sz==2){
        order_size <- append(order_size, size[sz])
        print(paste("Your topping is : ", topping[tp], "Size : ",size[sz]))
        price <- price + 200
      }else if(sz==3){
        order_size <- append(order_size, size[sz])
        print(paste("Your topping is : ", topping[tp], "Size : ",size[sz]))
        price <- price + 300
      }else if(sz==4){
        order_size <- append(order_size, size[sz])
        print(paste("Your topping is : ", topping[tp], "Size : ",size[sz]))
        price <- price + 350
      }else{
        print("Invalid menu please try again")
      }
    }else{
      print("Invalid menu please try again")
    }
  # Dialogue: Choose spaghetti    
  }else if(orders == 2){
    print("Choose your spaghetti")
    print("Press 1.Carbonara")
    print("Press 2.Pork Bolognese")
    print("Press 3.Keemao Sausage")
    print("Press 4.Seafood")
    spgt <- as.numeric(readLines("stdin", n=1))
    if(spgt==1){
      order_spaghetti <- append(order_spaghetti, spaghetti[spgt])
      print(paste("Your spaghetti is : ", spaghetti[spgt]))
      price <- price + 80
    }else if(spgt==2){
      order_spaghetti <- append(order_spaghetti, spaghetti[spgt])
      print(paste("Your spaghetti is : ", spaghetti[spgt]))
      price <- price + 85
    }else if(spgt==3){
      order_spaghetti <- append(order_spaghetti, spaghetti[spgt])
      print(paste("Your spaghetti is : ", spaghetti[spgt]))
      price <- price + 75
    }else if(spgt==4){
      order_spaghetti <- append(order_spaghetti, spaghetti[spgt])
      print(paste("Your spaghetti is : ", spaghetti[spgt]))
      price <- price + 85
    }else{
      print("Invalid menu please try again")
    }
  # Dialogue Choose Drink
  }else if(orders == 3){
    print("Choose your drink")
    print("Press 1.Mineral Water")
    print("Press 2.Pepsi")
    print("Press 3.Lipton")
    dnk <- as.numeric(readLines("stdin", n=1))
    if(dnk==1|dnk==2|dnk==3){
      order_drink <- append(order_drink, drink[dnk])
      print(paste("Your drink is : ",drink[dnk]))
      price <- price + 15
    }else{
      print("Invalid menu please try again")
    }
  # Dialogue Check Bill      
  }else if(orders == 4){
    print("------------------------------")
    print("Summary your order")
    print(paste("Pizza : ", order_topping, "size : ", order_size, "\n"))
    print(paste("Spaghetti : ", order_spaghetti, "\n"))
    print(paste("Drink : ", order_drink, "\n"))
    print("------------------------------")
    print(paste("Total Price : ", price, "BAHT"))
    break
  }else{
    break
  }
  print("------------------------------")
  print("Your order now")
  print(paste("Pizza : ", order_topping, "size : ", order_size, "/"))
  print(paste("Spaghetti : ", order_spaghetti, "/"))
  print(paste("Drink : ", order_drink, "/"))
  print("------------------------------")
  print(paste("Total Price : ", price, "BAHT"))
}
