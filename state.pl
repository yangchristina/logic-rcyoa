:- dynamic(points_counter/1).
:- dynamic(inventory/1).
:- dynamic(world/1).
:- use_module(library(random)).
:- [utils].

points_counter(0).
inventory([]).
world(start(1)).

% total_points :-
%     points_counter(TotalPoints),


update_points(Inc) :-
    retract(points_counter(CurrentPoints)),
    P is CurrentPoints + Inc,
    assertz(points_counter(P)).

store_world(Key) :- retract(world(CurrentWorld)),
                    assertz(world(Key)).

item(sword, "a Sword", 5).
item(apple, "an Apple", 3).
item(frying_pan, "a Frying Pan", 10).
item(beetle, "a Beetle", 1).
item(brick, "a Brick", 2).
item(smelly_sock, "a Smelly Sock", -2).

all_item_keys(Items) :-
    findall(Key, item(Key, _, _), Items).

random_item(Item) :-
    all_item_keys(Items),
    random_member(Item, Items).

random_inventory_item(Item) :-
    inventory(Items),
    random_member(Item, Items).

total_item_points([], 0).
total_item_points([H|T], S) :- item(H, _, P),
                                    total_item_points(T, S1),
                                    S is P+S1.

inventory_points(Points) :-
    inventory(Items),
    total_item_points(Items, Points).

total_points(T) :-
    points_counter(P1),
    inventory_points(P2),
    T is P1 + P2.

add_to_inventory(Item):-
    inventory(CurrentInventory),
    append(CurrentInventory, [Item], NewInventory),
    retract(inventory(CurrentInventory)),
    assertz(inventory(NewInventory)),
    write("Congratulations, "),
    item(Item, Desc, _),
    write(Desc), write(" fell right from the sky and landed in your inventory! You feel all the more prepared to face the frogs with your extra supplies"), nl.

remove_from_inventory(Item) :-
    inventory(CurrentInventory),
    remove_first(Item, CurrentInventory, NewInventory),
    retract(inventory(CurrentInventory)),
    assertz(inventory(NewInventory)),
    (write("Oh no! You stumbled over a rock, and all the things in your inventory fell out. Even though you scrambled to collect them all again, it seems that you have missed some. "), nl,
    (write("Item lost: "), write(Item)); write('Oh no! You\'ve stumbled over a rock. Fortunately (or unfortunately) for you, you had no items to lose, only your dignity.')), nl.

reset_points :-
    retractall(points_counter(_)),
    assertz(points_counter(0)).

clear_inventory :-
    retractall(inventory(_)),
    assertz(inventory([])).

% print item name and points
print_items([]).
print_items([H|[]]) :- item(H, Desc, Points),
                        write(Desc), write(" ("), write(Points), write(")").
print_items([H|T]) :- item(H, Desc, Points),
                        write(Desc), write(" ("), write(Points), write("), "),
                        print_items(T).

% Print all items in inventory, along with how many points each item is worth.
print_inventory :-
    inventory(Items),
    length(Items, L),
    (L > 0,
    write("Inventory: "),
    print_items(Items); write("Your inventory is empty")), nl.

% options: Add random item to inventory, lose random item from inventory.
% 1: Add random item to inventory
% 2: Lose random item from inventory
% 3: Do nothing
inventory_random_change :-
    random(1,3,R),
    inventory(Items),
    ((R = 1,
    random_item(Item),
    add_to_inventory(Item)), print_inventory;
    (R = 2,
    length(Items, L),
    L > 0,
    random_inventory_item(Item),
    remove_from_inventory(Item),
    print_inventory); true).
