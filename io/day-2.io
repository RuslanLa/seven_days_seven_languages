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

#Redefine / operator  to return 0 if the denominator is 0
prevDivision := Number getSlot("/")
Number / := method(i, if(i==0, 0, prevDivision(i)))

(100 / 10) println
(48 / 6) println
(48 / 0) println

#calculate twi dimensional array sum
sumTwoDimensional := method(arr, arr reduce(sum, row, sum + row reduce(rowSum, next, rowSum + next, 0), 0))
sumTwoDimensional(list(
  list(1, 2, 3), 
  list(4, 5, 6),
  list(7, 8, 9)
)) println

# Add a slot called myAverage to a list that computes the average of all the numbers in that list.
# What happens if there are no numbers on that list
# Bonus: raise an Io exception if any item on the list is not a number# Bonus: raise an Io exception if any item on the list is not a number
List myAverage := method(
    if(self size == 0, 0, 
      sum := self reduce(sum, next,
        if(next isKindOf(Number) == false, 
          Exception raise("average method requires list to contain only numbers"), 
          sum + next), 
       0)
      sum / (self size)
    )
)
list(1, 2, 3) myAverage println
e := try(list(1, 2, "3") myAverage)
e catch(Exception, e println)

# Write a prototype for a two-dimensional list.
TwoDimensionalList := List clone
# The dim(x,y) method should allocate a list of y lists of x elements long
TwoDimensionalList dim := method(x, y, TwoDimensionalList clone setSize(x) map(_, List clone setSize(y)))
# set(x,y,value) should set a value, and get(x,y) should retrieve it
TwoDimensionalList set := method(x, y, value, at(x) atPut(y, value))
TwoDimensionalList get := method(x, y, at(x) at(y))

# bonus: write a transpose method
TwoDimensionalList transpose := method(
    transposed := dim(at(0) size, size)
    transposed map(i, row, row map(j, _, get(j, i)))
)

twodList := TwoDimensionalList dim(5, 10)
twodList set(4, 3, 5)
twodList get(4, 3) println
twodList println
"transpose" println
twodList transpose println

#f := File with("two2List.txt")