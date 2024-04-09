% Author: Michelle
% Modify list at given index (zero based), N = New item, [H|T] = list to be modified, I = index of entry to be modified
% modify_list_at_index([], _, _, []).
% modify_list_at_index([_|T], 0, N, R) :- R = [N|T].
% modify_list_at_index([H|T], I, N, R) :- I1 is I - 1,
%                                         modify_list_at_index(T, I1, N, R1),
%                                         R = [H|R1].
% :- use_module(library(read_line_to_stringutil)).
:- use_module(library(readutil)).

% Multiply the item at index I by M in the list [H|T]
multiply_at_index([], _, _, []).
multiply_at_index([H|T], 0, M, R) :- R = [(M*H)|T].
multiply_at_index([H|T], I, M, R) :- I1 is I - 1,
                                        multiply_at_index(T, I1, M, R1),
                                        R = [H|R1].

% Remove first occurrence element of list
% remove_first([],_,[]).
% remove_first([])
% remove_first([H|T], H, T).
% remove_first([_|T1], H, T) :- remove_first(T1, H, N),
%                                T is append(H, N).

% sums a list, adapted from  lecture 22.
total([], 0).
total([H|T], S) :- total(T, S1),
                   S is H+S1.

% divide each element in list by C
normalize_by([],_,[]).
normalize_by([H|T],C,[H1|T1]) :- H1 = H/C,
                              normalize_by(T, C, T2),
                              T1 = T2.
% normalize list of numbers, so that it sums to 1
normalize([],[]).
normalize(L1,L2) :-
    normalize_by(L1, C, L2),
    total(L1, C).

% returns true is N is between Min and Max  (inclusive)
is_in_range(N, Min, Max) :-
    N >= Min,
    N =< Max.


% Check if user input fulfills conditions (is an integer, is in range), if not recurse until user input fulfills conditions
ask_int_in_range(Min, Max, N) :- read_line_to_string(user_input, X),
    atom_number(X,N), is_of_type(integer, N), is_in_range(N, Min, Max);
    write("Invalid input, try again"),nl, ask_int_in_range(Min, Max, N).


% ask_with_wait_next :: String -> IO ()
ask_with_wait_next(Desc) :-
    write(Desc),
    nl,
    sleep(1).
    % flush_output(user),
    % read_line_to_string_line_to_string(user_input, _).

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


% Remove first occurence of Item in List
remove_first(_, [], []).
remove_first(Item, [Item|T], T).
remove_first(Item, [H|T], [H|RT]) :-
    remove_first(Item, T, RT).