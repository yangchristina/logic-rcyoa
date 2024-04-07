% Author: Christina
:- use_module(library(random)).
:- include('utils.pl').
% -- Generate a random continuous number between 0 and 1
% randomContinuousZeroToOne :: IO Float
% randomContinuousZeroToOne = randomIO
% https://www.swi-prolog.org/pldoc/man?predicate=random/1

% Convert t
% return a list where each element is the sum of itself and all elements with a lower index than itself in the original input list
convert_to_cdf([],[]).
convert_to_cdf([X|[]],[X|[]]).
convert_to_cdf([H|[S|T]],[H|T2]) :- convert_to_cdf([H + S|T],T2).

% given a summed list, a list index, and a number, num, between 0 and 1, return
% the index of the first element in the summed list that is greater than or equal to num
choose_cdf_list_index([H|T],CI,N,RI) :-
    H >= N,
    RI is CI.
choose_cdf_list_index([H|T],CI,N,RI) :-
    H < N,
    choose_cdf_list_index(T,CI+1,N,RI)

choose_from_weighted_list(L,W,E) :-
    random(R),
    normalize(W,N)
    convert_to_cdf(N,C),
    choose_cdf_list_index(C,0,R,I),
    nth0(I,L,E).
