%%%-------------------------------------------------------------------
%%% @author Air-Smile
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 五月 2014 17:03
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("Air-Smile").

%% API
-export([sum/1]).
-export([sum/2]).
-export([for/3]).
-export([perms/1]).
-export([pythag/1]).


%% 函数的目是指其参数数量
%% 同一模块中的同名不同目函数类似与java的重载
%% 但是这里的同名是为了便于理解
%% 比如对列表元素求和,实际是通过对列表的头和尾进行递归求和实现的
sum(L) -> sum(L, 0). %% L参数为列表时,将调用sum/2,如果穿入的参数是原组或原子的时是否会报错
sum([H | T], N) -> sum(T, H + N); %% H表示列表的头,T表示列表的尾 当T还是列表的时候,会递归调用
sum([], H) -> H. %% 当列表为空的时候 直接返回 H


%% 定义抽象流控制
for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

%% 毕达哥拉斯三元组 erlang 17版本無法輸出
%% 获取在1到N之间的所有满足A^2+B^2=C^2的整数集合{A,B,C}
%% 根据要求罗列出条件由Erlang自动完成匹配
pythag(N) ->
  [{A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

%% 变位词
%% 让输入的字符重现排列
perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L--[H])].
