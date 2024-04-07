:- include('utils.pl').
:- include('random.pl').
:- include('story.pl').
:- include('types.pl').
% :- [utils].

% scenario_outcome(KEY, DESC, CHOICES)

% -- given a list of scenario keys, create a list of weights for each scenario in allScenarioKeys, where the weight of scenarios in the given list is larger
% createScenarioWeights :: [[Char]] -> [Rational]
% createScenarioWeights [] = []
% createScenarioWeights lst = normalize [if h `elem` lst then (2 * fromIntegral (length allScenarioKeys) / fromIntegral (length lst)) else 1 | h <- allScenarioKeys]

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

ask_scenario(K) :-
    scenario_outcome(K, D, C),
    write(D),
    nl,
    display_choices(C),
    length(C, L),
    ask_int_in_range(1, L, I),
    nth0(I,C,E).
% putStrLn ("You choose: " ++ desc2 ++ "\n")
% return idx
% Not sure how to expand player choice to get the description

% go(K,P) :-
%     scenario_outcome(K, D, C),
