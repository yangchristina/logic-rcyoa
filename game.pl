:- include('utils.pl').
:- include('random.pl').
:- include('story.pl').
:- include('types.pl').
:- [state].

% scenario_outcome(KEY, DESC, CHOICES)

% -- given a list of scenario keys, create a list of weights for each scenario in allScenarioKeys, where the weight of scenarios in the given list is larger
% createScenarioWeights :: [[Char]] -> [Rational]
% createScenarioWeights lst = normalize [if h `elem` lst then (2 * fromIntegral (length allScenarioKeys) / fromIntegral (length lst)) else 1 | h <- allScenarioKeys]
create_scenario_weights_helper(Lst, [KH|KT], N, R) :-
    member(KH,Lst),
    length(Lst, NL),
    R = [2 * N / NL | RT],
    create_scenario_weights_helper(Lst, KT, RT).

create_scenario_weights_helper(Lst, [KH|KT], N, R) :-
    \+ member(KH,Lst),
    R = [1 | RT],
    create_scenario_weights_helper(Lst, KT, RT).

create_scenario_weights(Lst,NR) :-
    all_scenario_keys(Keys),
    length(Keys, N),
    create_scenario_weights_helper(Lst, Keys, N, R),
    normalize(R,NR).

% -- given a list of scenario keys, create a list of weights for each scenario in allScenarioKeys, where the weight of scenarios in the given list is larger
% createScenarioWeights :: [[Char]] -> [Rational]
store_world(Key) createScenarioWeights [] = []
% createScenarioWeights lst = normalize [if h `elem` lst then (2 * fromIntegral (length allScenarioKeys) / fromIntegral (length lst)) else 1 | h <- allScenarioKeys]

% -- given a PlayerChoice, choose the next scenario
% chooseNext :: PlayerChoice -> IO String
% chooseNext (PlayerChoice _ logicalNexts _) = chooseFromWeightedList allScenarioKeys (createScenarioWeights logicalNexts)
choose_next(PlayerChoice, NextScenario) :-
    player_choice(PlayerChoice,_,LogicalNexts,_),
    create_scenario_weights(LogicalNexts, Weights),
    choose_from_weighted_list(all_scenario_keys, Weights, NextScenario).


print_choices([]).
print_choices([H|T],I) :-
    player_choice(D,_,_),
    format(atom(A), '(~w) ~w', [I+1,D]),
    write(A),
    nl,
    print_lst(T,I+1).

display_choices([]).
display_choices(C) :-
    write('Choices: '),
    nl,
    print_choices(C).

% askScenario :: ScenarioOutcome -> IO Int
% askScenario (ScenarioOutcome desc choices) =
%     do
%     -- askWithWaitNext desc
%     putStrLn desc
%     displayChoices choices
%     ans <- askIntInRange (1, length choices)
%     let idx = ans - 1
%     let (PlayerChoice desc2 _ _) = choices !! idx
%     putStrLn ("You choose: " ++ desc2 ++ "\n")
%     return idx

% chooseNext :: PlayerChoice -> IO String
% chooseNext (PlayerChoice _ logicalNexts _) = chooseFromWeightedList allScenarioKeys (createScenarioWeights logicalNexts)

ask_scenario(K,I) :-
    scenario_outcome(K, D, C),
    write(D),
    nl,
    display_choices(C),
    length(C, L),
    ask_int_in_range(1, L, A),
    I is A-1,
    nth0(I,C,E),
    player_choice(E,Desc2,_,_),
    format(atom(S), 'You chose: ~w', [Desc2]),
    write(S),
    nl.
% putStrLn ("You choose: " ++ desc2 ++ "\n")
% return idx
% Not sure how to expand player choice to get the description

% go(K,P) :-
%     scenario_outcome(K, D, C),

% askWithWaitNext "Disclaimer: story might not make sense. Welcome to the world of randomness!"
% player <- chooseStartWorld
% let (Player startWorldKey _ _) = player
% (Results points endKey) <- go "1" player
% showEnd points startWorldKey endKey
% putStrLn $ "Points: " ++ show points
% putStrLn ("Thanks for playing!")

should_end(Scenario,Points,EndKey) :-
    scenario_outcome(Scenario,_,_),
    EndKey = "end",

go(Scenario,P,R) :-
    scenario_outcome(Scenario, D, C),
    ask_scenario(Scenario, I),
    nth0(I,C,PlayerChoice),
    go(NextScenario,P,R).
% TODO: dunno how to do points recursion

start_game :-
    ask_with_wait_next "Welcome to Randomized Choose your Own Adventure.\nPress enter to continue whenever there is a pause (like now).",
    ask_with_wait_next "Disclaimer: story might not make sense. Welcome to the world of randomness!",
    choose_start_world(P),
    go("1",P,R),
    show_end(P,R),
    results(R,Points,EndKey)
    format(atom(S), 'Points: ~w', [Points]),
    write(S),
    nl,
    write('Thanks for playing!').

choose_start_world :-
    rand
    write()