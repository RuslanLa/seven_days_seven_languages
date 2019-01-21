#actors experiment
#checked whether or not state of another actor can be changed
first := Object clone
first state := 1
first start := method(
    wait(1)
    self state = 2
    writeln("first")
)

second := Object clone
second changeFirst := method(
    wait(2)
    first state = 3
    writeln("second")
)

first @@start; second @@changeFirst; wait(3)
first state println