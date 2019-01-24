count(0, []).
count(Count, [_|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/Count.

concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :- concatenate(Tail1, List, Tail2).

invert([],[]).
invert([El],[El]).
invert(List, [Head|Tail]) :- invert(Rest,Tail), append(Rest, [Head], List).

minElement([El], El).
minElement([Head|Tail], Result) :- minElement(Tail, RestMin), Result is min(Head,RestMin).