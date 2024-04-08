% Author: Michelle
% Modify list at given index (zero based), N = New item, [H|T] = list to be modified, I = index of entry to be modified
modify_list_at_index([], _, _, []).
modify_list_at_index([_|T], 0, N, R) :- R = [N|T].
modify_list_at_index([H|T], I, N, R) :- I1 is I - 1,
                                        modify_list_at_index(T, I1, N, R1),
                                        R = [H|R1].

multiply_at_index([], _, _, []).
multiply_at_index([H|T], 0, M, R) :- R = [(M*H)|T].
multiply_at_index([H|T], I, M, R) :- I1 is I - 1,
                                        modify_list_at_index(T, I1, M, R1),
                                        R = [H|R1].

% Remove first element of list
remove_first([],[]).
remove_first([_|T], T).

% sums a list, adapted from  lecture 22.
total([], 0).
total([H|T], S) :- total(T, S1),
                   S is H+S1.

% normalize list of numbers, call initially with total
normalize_by([],_,[]).
normalize_by([H|T],C,[H1|T1]) :- H1 = H/C,
                              normalize_by(T, C, T2),
                              T1 = T2.

normalize([],[]).
normalize(L1,L2) :-
    normalize_by(L1, C, L2),
    total(L1, C).

% prolog does not need fixdel unlike haskell
 %Ask for an integer input, and repeat until a valid integer is given
 % This works but its really slow prolly needs fixing but i too tired rn
 ask_int_in_range(Min, Max, X) :- read(X),
                               is_of_type(integer, X),
                               X > Min,
                               X < Max.
ask_int_in_range(Min, Max, Y) :- read(X),
                            is_of_type(integer, X),
                            X < Min,
                            write("Invalid input, try again"),
                            ask_int_in_range(Min, Max, Y).
ask_int_in_range(Min, Max, Y) :- read(X),
                        is_of_type(integer, X),
                        X > Max,
                        write("Invalid input, try again"),
                        ask_int_in_range(Min, Max, Y).
ask_int_in_range(Min, Max, Y) :- read(X),
                     \+ is_of_type(integer, X),
                     write("Invalid input, try again"),
                     ask_int_in_range(Min, Max, Y).

ask :- write("Please input an int"),
       nl,
       ask_int_in_range(1, 5, T),
       write(T).


% ask_with_wait_next :: String -> IO ()
ask_with_wait_next(Desc) :-
    write(Desc),
    nl,
    read(_).

% do
%        putStrLn desc
%        _ <- getLine
%        -- line <- getLine
%        -- let cont' = fixdel line
%        return ()


% -- given a list of probabilities and an index, increase the probability at the given index, then normalize so it still sums to 1
% increaseProbOfIndex :: [Float] -> Int -> [Float]
% increaseProbOfIndex probs idx = normalize (modifyListAtIndex probs idx (* 2))

% given a list of probabilities and an index, increase the probability at the given index, then normalize so it still sums to 1
increase_prob_of_index(P1, I, R) :- multiply_at_index(P1, I, 2, PM),
                                  normalize(PM, R).