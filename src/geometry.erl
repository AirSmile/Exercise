%%%-------------------------------------------------------------------
%%% @author Air-Smile
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 四月 2014 下午9:41
%%%-------------------------------------------------------------------
%% 模块名与文件名相同
-module(geometry).
%% 编写程序的作者
-author("Air-Smile").

%% API 函数定义 名称及参数
-export([area/1]).
%% area 函数里面有一个参数,这参数是一个原子,这原子里面有3个变量.
area({rectangle, Width, Ht}) -> Width * Ht;   %% 将Width * Ht = 长 * 高 =面积
area({circle, R}) -> 3.141592 * R * R.        %% 计算圆形的面积测试