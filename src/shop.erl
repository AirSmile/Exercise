%%%-------------------------------------------------------------------
%%% @author Air-Smile
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 五月 2014 14:57
%%%-------------------------------------------------------------------
-module(shop).
-author("Air-Smile").

%% API
%%
-export([cost/1]).
cost(orangers) -> 5;%%橘子的单价
cost(newspaper) -> 8;%%报纸的单价
cost(apples) -> 2;%%苹果的单价
cost(pears) -> 9;%%梨的单价
cost(milk) -> 7.%%牛奶的单价
