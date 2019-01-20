#Task1. Fibonacci numbers implementation with recursion
fib := method(n,
    if(n <= 2, 1, 
       fib(n-1)+fib(n-2)
    )
)
fib(1) println
fib(4) println

#Fibonacci numbers implementation with loop
fibLoop := method(n,
  number := 1
  numberBefore := 1
  for(i, 3, n, 
    numberCopy := number
    number := numberBefore + number
    numberBefore := numberCopy
  )
  number
)

fibLoop(1) println
fibLoop(4) println
fibLoop(20) println