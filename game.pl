:- [utils].
:- [random].
:- [story].
:- [state].
:- use_module(library(random)).

% suppress discontigous warnings.

% given a list of scenario keys, create a list of weights for each scenario in allScenarioKeys, where the weight of scenarios in the given list is larger
create_scenario_weights_helper(_, _, [], []).
create_scenario_weights_helper(Lst, LRest, [KH|KT], R) :-
    (member(KH,Lst),R=[2|RT];member(KH,LRest),R=[1|RT];R=[0|RT]),
    create_scenario_weights_helper(Lst, LRest, KT, RT).

create_scenario_weights(Scene, PlayerChoice,NR) :-
    choice(Scene, PlayerChoice,_, LstBest, LstRest,_),
    all_scenario_keys(Keys),
    length(Keys, N),
    create_scenario_weights_helper(LstBest, LstRest, Keys, R),
    normalize(R,NR).

% given a PlayerChoice, choose the next scenario
choose_next(Scene, PlayerChoice, NextScenario) :-
    choice(Scene, PlayerChoice,_,LogicalNexts,_,_),
    create_scenario_weights(Scene, PlayerChoice, Weights),
    all_scenario_keys(Keys),
    choose_from_weighted_list(Keys, Weights, NextScenario).


print_choices(_,[],_).
print_choices(Scene,[H|T],I) :-
    choice(Scene,H,D,_,_,_),
    N is I + 1,
    format(atom(A), '(~w) ~w', [N,D]),
    write(A),
    nl,
    print_choices(Scene,T,I+1).

display_choices(Scene) :-
    choices_in_scene(Scene,C),
    write('Choices: '),
    nl,
    print_choices(Scene,C,0).

ask_scenario(Scenario,I) :-
    scene_desc(Scenario, D),
    choices_in_scene(Scenario,C),
    write(D),
    nl,
    display_choices(Scenario),
    length(C, L),
    ask_int_in_range(1, L, A),
    I is A-1,
    nth0(I,C,E),
    choice(Scenario,E,Desc2,_,_,_),
    format(atom(S), 'You chose: ~w', [Desc2]),
    write(S),
    nl,nl.

go(scene(end)) :- show_end(scene(end)).
go(scene(scene(end(*)))) :- show_end(scene(end(*))).
go(Scenario) :-
    choices_in_scene(Scenario,C),
    ask_scenario(Scenario, I),
    inventory_random_change,
    nl,
    nth0(I,C,PlayerChoice),
    choice(Scenario,PlayerChoice,_,_,_,Points),
    choose_next(Scenario,PlayerChoice,NextScenario),
    update_points(Points),
    go(NextScenario).

% Edit later to include world type? (for initial inventory)
choose_start_world :-
    random(1,8,R),
    store_world(start(R)),
    start_desc(start(R), T),
    ask_with_wait_next(T).

% given the number points, the key of the startWorld, and the key of the ending, end the game, show the ending corresponding to number of points and startWorld of the player
show_end(scene(end(*))) :-
    total_points(Points),
    world(CurrentWorld),
    scene_desc(scene(end(*)), Message),
    write(Message), nl.

show_end(EndKey) :-
    total_points(Points),
    world(CurrentWorld),
    dif(EndKey, scene(end(*))),
    Points >= 70,
    write('With this valiant effort, your story in the land of butterflies has come to an end, and as a reward the butterflies have decided to send you back to your own world. \nDisoriented and bewildered, you wake up in your own bed, wondering if what you experienced was just a dream. However, the butterflies\' last words ring in your ears, \"Depending on your effort, we will bestow upon you an equivalent reward.\" \nWith a mix of anticipation and fear, you find that...'),
    nl,
    good_end(CurrentWorld, Message),
    write(Message), nl.

show_end(EndKey) :-
    total_points(Points),
    world(CurrentWorld),
    dif(EndKey, scene(end(*))),
    Points < 25,
    write('What happened? The butterflies have begun to doubt your loyalty. From the corner of your eye, you see the frog monarch begin to move. All of a sudden, you are swept up and blown away by a strong gust of wind. When you open your eyes, you find yourself sitting in the real world, with an uneasy feeling...'),
    nl,
    bad_end(CurrentWorld, Message),
    write(Message), nl.

show_end(EndKey) :-
    total_points(Points),
    world(CurrentWorld),
    dif(EndKey, scene(end(*))),
    Points >= 25,
    Points < 70,
    write('With this valiant effort, your story in the land of butterflies has come to an end, and as a reward the butterflies have decided to send you back to your own world. \nDisoriented and bewildered, you wake up in your own bed, wondering if what you experienced was just a dream. However, the butterflies\' last words ring in your ears, \"Depending on your effort, we will bestow upon you an equivalent reward.\" \nWith a mix of anticipation and fear, you find that...'),
    nl,
    neutral_end(CurrentWorld, Message),
    write(Message), nl.

start_game :-
    reset_points,
    clear_inventory,
    ask_with_wait_next("Welcome to Randomized Choose your Own Adventure."),
    ask_with_wait_next("Disclaimer: story might not make sense. Welcome to the world of randomness!"),
    choose_start_world,
    go(scene(1)),
    points_counter(Points),
    format(atom(S), 'Points: ~w', [Points]),
    write(S),
    nl,
    write('Thanks for playing!').
