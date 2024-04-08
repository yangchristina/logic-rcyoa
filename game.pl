:- include('utils.pl').
:- include('random.pl').
:- include('story.pl').
:- include('types.pl').
:- [state].

% suprress discontigous warnings.


% scenario_outcome(KEY, DESC, CHOICES)

% -- given a list of scenario keys, create a list of weights for each scenario in allScenarioKeys, where the weight of scenarios in the given list is larger
% createScenarioWeights :: [[Char]] -> [Rational]
% createScenarioWeights lst = normalize [if h `elem` lst then (2 * fromIntegral (length allScenarioKeys) / fromIntegral (length lst)) else 1 | h <- allScenarioKeys]
create_scenario_weights_helper(Lst, [KH|KT], N, R) :-
    member(KH,Lst),
    length(Lst, NL),
    R = [2 * N / NL | RT],
    create_scenario_weights_helper(Lst, KT, N, RT).

create_scenario_weights_helper(Lst, [KH|KT], N, R) :-
    \+ member(KH,Lst),
    R = [1 | RT],
    create_scenario_weights_helper(Lst, KT, N, RT).

create_scenario_weights(Lst,NR) :-
    all_scenario_keys(Keys),
    length(Keys, N),
    create_scenario_weights_helper(Lst, Keys, N, R),
    normalize(R,NR).

% -- given a list of scenario keys, create a list of weights for each scenario in allScenarioKeys, where the weight of scenarios in the given list is larger
% createScenarioWeights :: [[Char]] -> [Rational]
% store_world(Key)
% createScenarioWeights lst = normalize [if h `elem` lst then (2 * fromIntegral (length allScenarioKeys) / fromIntegral (length lst)) else 1 | h <- allScenarioKeys]

% -- given a PlayerChoice, choose the next scenario
% chooseNext :: PlayerChoice -> IO String
% chooseNext (PlayerChoice _ logicalNexts _) = chooseFromWeightedList allScenarioKeys (createScenarioWeights logicalNexts)
choose_next(Scene, PlayerChoice, NextScenario) :-
    choice(Scene, PlayerChoice,_,LogicalNexts,_),
    create_scenario_weights(LogicalNexts, Weights),
    all_scenario_keys(Keys),
    choose_from_weighted_list(Keys, Weights, NextScenario).

print_choices(_,[],_).
print_choices(Scene,[H|T],I) :-
    choice(Scene,H,D,_,_),
    format(atom(A), '(~w) ~w', [I+1,D]),
    write(A),
    nl,
    print_choices(Scene,T,I+1).

display_choices(Scene) :-
    choices_in_scene(Scenario,C),
    write('Choices: '),
    nl,
    print_choices(Scene,C,0).

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
    choice(Scenario,E,Desc2,_,_),
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


go(scene(end), end).
go(scene(end(*)), end(*)).
go(Scenario,EndKey) :-
    choices_in_scene(Scenario,C),
    ask_scenario(Scenario, I),
    nth0(I,C,PlayerChoice),
    choice(Scenario,PlayerChoice,_,_,Points),
    choose_next(Scenario,PlayerChoice,NextScenario),
    update_points(Points),
    go(NextScenario,EndKey).

% Edit later to include world type? (for initial inventory)
choose_start_world :-
    random(1,8,R),
    store_world(start(R)),
    start_desc(start(R), T),
    write(T).

% given the number points, the key of the startWorld, and the key of the ending, end the game, show the ending corresponding to number of points and startWorld of the player
% showEnd :: Int -> String -> String -> IO ()
show_end(end(*)) :-
    points_counter(Points),
    world(CurrentWorld),
    scene(end(*), Message),
    write(Message).

show_end(EndKey) :-
    points_counter(Points),
    world(CurrentWorld),
    dif(EndKey, end(*)),
    Points >= 70,
    write('With this valiant effort, your story in the land of butterflies has come to an end, and as a reward the butterflies have decided to send you back to your own world. \nDisoriented and bewildered, you wake up in your own bed, wondering if what you experienced was just a dream. However, the butterflies\' last words ring in your ears, \"Depending on your effort, we will bestow upon you an equivalent reward.\" \nWith a mix of anticipation and fear, you find that...'),
    nl,
    good_end(CurrentWorld, Message),
    write(Message).

show_end(EndKey) :-
    points_counter(Points),
    world(CurrentWorld),
    dif(EndKey, end(*)),
    Points < 25,
    write('What happened? The butterflies have begun to doubt your loyalty. From the corner of your eye, you see the frog monarch begin to move. All of a sudden, you are swept up and blown away by a strong gust of wind. When you open your eyes, you find yourself sitting in the real world, with an uneasy feeling...'),
    nl,
    bad_end(CurrentWorld, Message),
    write(Message).

show_end(EndKey) :-
    points_counter(Points),
    world(CurrentWorld),
    dif(EndKey, end(*)),
    Points >= 25,
    Points < 70,
    write('With this valiant effort, your story in the land of butterflies has come to an end, and as a reward the butterflies have decided to send you back to your own world. \nDisoriented and bewildered, you wake up in your own bed, wondering if what you experienced was just a dream. However, the butterflies\' last words ring in your ears, \"Depending on your effort, we will bestow upon you an equivalent reward.\" \nWith a mix of anticipation and fear, you find that...'),
    nl,
    neutral_end(CurrentWorld, Message),
    write(Message).

%   do
%     let (StartWorld _ results _) = getStartWorld startWorldKey
%     if (endKey == "*")
%       then do
%         showStayEnd
%     else if (points >= 70)
%       then do
%         putStrLn("With this valient effort, your story in the land of butterflies has come to an end, and as a reward the butterflies have decided to send you back to your own world. \nDisoriented and bewildered, you wake up in your own bed, wondering if what you experienced was just a dream. However, the butterflies' last words ring in your ears, \"Depending on your effort, we will bestow upon you an equivalent reward.\" \nWith a mix of anticipation and fear, you find that...")
%         putStrLn (results !! 0)
%     else if (points < 25)
%       then do
%         putStrLn("What happened? The butterflies have begun to doubt your loyalty. From the corner of your eye, you see the frog monarch begin to move. All of a sudden, you are swept up and blown away by a strong gust of wind. When you open your eyes, you find yourself sitting in the real world, with an uneasy feeling...")
%         putStrLn (results !! 2)
%     else
%       do
%         putStrLn("With this valient effort, your story in the land of butterflies has come to an end, and as a reward the butterflies have decided to send you back to your own world. \nDisoriented and bewildered, you wake up in your own bed, wondering if what you experienced was just a dream. However, the butterflies' last words ring in your ears, \"Depending on your effort, we will bestow upon you an equivalent reward.\" \nWith a mix of anticipation and fear, you find that...")
%         putStrLn (results !! 1)
%     return ()


start_game :-
    ask_with_wait_next("Welcome to Randomized Choose your Own Adventure.\nPress enter to continue whenever there is a pause (like now)."),
    ask_with_wait_next("Disclaimer: story might not make sense. Welcome to the world of randomness!"),
    choose_start_world,
    go("1",R),
    show_end(R),
    points_counter(Points),
    format(atom(S), 'Points: ~w', [Points]),
    write(S),
    nl,
    write('Thanks for playing!').
