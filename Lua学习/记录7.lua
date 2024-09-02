--#region 多变量赋值

a,b,c = 1,2
print(a,b,c)--这里由于赋值的参数长度不够，所以是nil
a,b,c = 1,2,3,4
print(a,b,c)--这里长度超过变量长度，丢失超出部分

--#endregion

--#region 多返回值

function Test()--测试函数
    return 10,9,8,7
end

d,e,f = Test()
print(d,e,f)--这里多返回值与前面的多变量赋值逻辑一致，如果变量长度不够就补空，如果返回值长度过长就丢失

--#endregion

--#region and or

--lua中and 和or 不止在布尔值上使用，只有nil和false才认为是假
print(1 and 2)--打印2，因为第一个是真
print(1 or 2)--打印1，因为短路，一真则真

print(nil and 2)--这里会打印nil，因为短路，一假则假
print(false or 2)--这里会打印2，因为第一个是假

--利用短路实现三目运算符condition? expression1 : expression2
x,y=1,2
res = (x>y) and x or y
print(res) --这里会返回y 2
x,y=3,2
res = (x>y) and x or y
print(res) --这里会返回x 3

--#endregion