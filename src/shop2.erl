%%%-------------------------------------------------------------------
%%% @author Air-Smile
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2014 17:26
%%%-------------------------------------------------------------------
-module(shop2).
-author("Air-Smile").

%% API
-export([total/1]).
-import(mylists, [map/2, sum/1]).

total(L) ->
  sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).