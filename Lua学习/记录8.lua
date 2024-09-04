--#region 设置元表

--首先声明两张表
table1 = {age = 1}
metaTable1 = {}
setmetatable(table1,metaTable1)--函数setmetatable(表,元表)为一个表设置元表

--#endregion 

--#region 特定操作

--首先声明两张表
table2 = {
    name = "ceshi",
    age = 2
}

metaTable2 = {
    --特定操作1-__tostring；需要使用装载函数
    __tostring = function (a)
        return a.name
    end,--这里记得加上,因为是表中的一个数据
    --特定操作2-__call
    __call = function (q,w)
        print(q)--第一个传入的参数默认是表本身，所以会打印出tostring的内容
        print(w)--第二个参数才会打印出1
        print("diaoyong chenggong")
    end,
    --特定操作3-运算符重载
    __add = function (t1,t2)
        return t1.age + t2.age
    end,
    __sub = function (t1,t2)
        return t1.age - t2.age
    end
    --加减乘除、取余、幂分别对应__add __sub __mul __div __mod __pow  
    --条件运算符相等、小于、小于等于__eq __lt __le 没有大于、大于等于——直接取反就行，其中如果需要使用条件运算符进行真假判断，两个表之间的元表必须相同，才能准确调用方法
    --拼接.. 对应__concat
}
setmetatable(table2,metaTable2)

print(table2)--当一个表被作为字符串使用时，会默认调用元表中的tostring函数，类似于属性，能够通过元表访问表的对应参数
table2(1)--当一个表作为函数被调用的时候，会调用元表中的__call函数
print(table1 + table2)--当表使用运算符运算时就会调用元表中的对应的运算符函数
print(table2 - table1)
--#endregion

--#region 特定操作__index
print("**********************************")

table3 = {}
metaTable3 = {
    age = 10,
    __index = metaTable3--当一个表访问没有的属性时，会去往元表__index所指向的表中索引
}
setmetatable(table3,metaTable3)

print(table3.age)--这里由于metatable没初始化完，所以为nil
--最好还是将index写到表外,因为如果指向的是元表自己，那么表还没初始化完成就只能赋值为nil
metaTable3.__index = table2

print(table3.age)--这里就会去到table2中寻找对应的属性

--endregion

--#region 特定操作newIndex

print("**********************************")

table4 = {}
table5 = {}
metaTable4 = {
    __newindex = table5
}
setmetatable(table4,metaTable4)

table4.age = 20--一个表赋值不存在的变量时会赋值到元表newindex所指向的表中
print(table4.age)
print(table5.age)--这里才会打印出赋值的数据

--#endregion