-module(solution).
-export([two_sum/2]).

two_sum(Nums, Target) ->
    NumToIndex = two_sum_loop(Nums, Target, 1, dict:new()),
    case NumToIndex of
        {ok, Index1, Index2} ->
            [Index1, Index2];
        _ ->
            []
    end.

two_sum_loop([], _, _, _) ->
    {error, 0, 0};
two_sum_loop([Num | Rest], Target, Index, NumToIndex) ->
    Complement = Target - Num,
    case dict:find(Complement, NumToIndex) of
        {ok, Index2} ->
            {ok, Index2, Index};
        error ->
            two_sum_loop(Rest, Target, Index + 1, dict:update(Num, Index, NumToIndex))
    end.
