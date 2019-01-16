# Evaluate 1+1 and 1+"one". Is Io strongly typed or weakly typed? Prove it with code

(1+1) println

result := try(1+"one")
result catch(Exception, "Io stricts types in implicit conversion" println)

# Is 0 true or false. And nil? And the empty string? Answer with code
("0 - "..(0 and true)) println
("nil - "..(nil and true)) println

# How can you tell how many slots a prototype supports?
Object slotNames size

Person := Object clone do(
    firstName ::= nil
    lastName ::= nil
)

FriendlyPerson := Person clone
FriendlyPerson sayHello :=  method (((call target firstName).." "..(call target lastName)..": Hello") println)

someone := FriendlyPerson clone setFirstName("Ivan") setLastName("Ivanov")

someone sayHello

