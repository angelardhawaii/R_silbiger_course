#Advanced R work from chapter 2
#By Angela Richards Donà
#September 20, 2024

#load packages
library(lobstr)

a <- 1:10
b <- a
c <- b
d <- 1:10

#verify if all are pointing to same object -- guess is that d and the rest are different but a, b, c same
lobstr::obj_addr(a)
lobstr::obj_addr(b)
lobstr::obj_addr(c)
lobstr::obj_addr(d)

#verify that all below point to the same function object
lobstr::obj_addr(mean) # mean in base R is a generic function to get the trimmed arithmetic mean
lobstr::obj_addr(base::mean) # currently unclear what this exactly does
lobstr::obj_addr(get("mean")) #get in base R returns the value of a named object
lobstr::obj_addr(evalq(mean)) #evalq evaluates an R expression in a specified environment
lobstr::obj_addr(match.fun(mean)) #match.fun extracts a function specified by name

#binding y to x and then modifying y without changing x - copy-on-modify
x <- c(1, 2, 3)
y <- x
y[[3]] <- 4
print(x)
print(y)

