:- dynamic(points_counter/1).
:- dynamic(inventory/1).
:- dynamic(world/1).

update_points(Inc) :-
    retract(points_counter(CurrentPoints)),
    P is CurrentPoints + Inc,
    assertz(points_counter(P)).

store_world(Key) :- retract(world(CurrentWorld)),
                    assertz(world(Key)).