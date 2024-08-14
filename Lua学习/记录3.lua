-- 函数

--#region 基础写法（无参无返回值）
--写法1
function Test()--function后面接上函数名称与()
    print("test")--函数体
end
--写法2
Test1 = function()
print("test1")
end
--调用函数
Test()
Test1()
--#endregion

--#region 有参函数
--有参
function Test2(a)
    print(a)
end

Test2(1)--这里就会打印传进去的1
--#endregion

--#region 有返回值函数
--返回单个值
function Test3()
    return 2
end

function Test4(a)
    return a+1
end

print(Test3())
print(Test4(1))
--返回多个值
function Test5(a)
    return a+1,2,3
end
--如果容纳返回值的函数数量小于返回值的数量，多余的返回值会被抛弃
temp = Test5(1)
print(temp)

--使用多个变量装载函数的多个返回值
temp1,temp2,temp3 = Test5(1)
print(temp1,temp2,temp3)
--#endregion

--#region 变长函数
--变长函数
function Test6(...)
    b = {...}--使用一个表装载参数
    for i=1,#b do--#table就是表的长度
        print(b[i])
    end
end
Test6(1,2,3)
--#endregion

--#region 函数嵌套
--函数嵌套
function Test7(x)
    return function(y)
            return x+y
    end
end
temp4 = Test7(1)--当执行这条指令时，temp4实际上就已经是return x+y的函数了，其中x直接变为了1（相当于从局部变量变为了局部常量）

--随后调用temp4函数
print(temp4(5))
--#endregion