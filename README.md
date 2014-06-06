Erlang 程序
=========
第一章 引言
---------

第二章 对Erlang快速起步
---------
### 1.1 路线图

第三章 顺序型编程初步
---------
### 3.1 模块
    模块文件以.erl为后缀名,编译后的文件后缀名为.beam。
    请看geometry模块的注释
### 3.2 购物系统-进阶篇
    请看shop模块的注释
### 3.3 同名不同目的函数
     请看shop1模块的注释
### 3.4 fun、匿名函数、lambda
    Erlang使用fun定义匿名函数，效果同python、lisp中的lambda
### 3.4.1 以fun为参数的函数
        1> L = [1, 2, 3, 4, 5, 6, 7, 8].
        [1,2,3,4,5,6,7,8]
        
        2> Even = fun(X)-> (X rem 2) =:= 0 end.   
        #Fun<erl_eval.6.106461118>
        
        3> lists:map(Even,L).
        [false,true,false,true,false,true,false,true]
        
        5> lists:filter(Even,L).
        [2,4,6,8]
    
### 3.4.2 返回fun的函数
        1> Fruit = [apple,pear,orange].
        [apple,pear,orange]
        
        #这里返回一个fun函数, 它可以判断某个元素是否在指定的列表中
        2> MakeTest = fun(L) -> (fun(X) -> lists:member(X,L) end) end.
        #Fun<erl_eval.6.106461118>
        
        #将MakeTest(Fruit) 赋值给IsFruit
        3> IsFruit = MakeTest(Fruit).
        
        #测试函数IsFruit
        4> IsFruit(apple).
        true
### 3.4.3 自定义抽象流程控制
        %% 自动义for 循环
        %% 从I循环到Max
        %% 首相匹配for(Max,Max,F)
        %% 前面两个参数不相同将匹配 for(I,Max,F)
        %% 然后将F(I)与后续元素的计算结果并接成列表
        %% 如果两个字句互换下顺序,for(I,Max,F) 匹配任意数字将导致死循环
        for(Max ,Max ,F) ->[F(Max)]; %%当Max相同时直接输出当前相同的值
        for(I,Max,F) ->[F(I) | for(I+1,Max,F)].
### 3.5 简单的列表处理
        #sum 和 map的实现
        请打开mylists模块
        #使用sum 和 map 改进total funtion
### 3.6 列表解析
        #列表解析使得程序更简洁
        #不需要再用map、fun或filter
        [2*X || X <- L]. %%表示[ F(X) || X <- L ]
        #map更为简洁的实现
        map(F,L)->[F(X)||X<-L].
### 3.6.1 快速排序
        %% 快速排序
        %% 首先获取列表头元素
        %% 然后使用列表解析将原列表的尾分成两个列表,其中一个列表比头元素小的集合,另一个为比头元素大的集合
        %% 最后递归排序子列表
        qsort([]) -> [];
        qsort([H | T]) ->
            qsort([X || X <- H]) %% 比H小的集合
            ++[H]++ %% H本身
            qsort([X || X <-T , X >= H]). %% 比H大的集合
### 3.6.1 快速排序    