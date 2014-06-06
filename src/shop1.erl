%%%-------------------------------------------------------------------
%%% @author Air-Smile
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 五月 2014 14:51
%%%-------------------------------------------------------------------
-module(shop1).
-author("Air-Smile").

%% API
-export([total/1]).

%% 采用递归的方式将列表中的各项商品金额相加得到总金额
total([{What, N} | T]) ->
  shop:cost(What) * N + total(T);%%商品的单价*N数量 加上 下一个商品的单价和数量的乘积

total([]) -> 0.%%列表为空的时候返回0
