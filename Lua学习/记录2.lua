-- 运算符

--#region 算数运算符
--只有+ - * / ^
print("12.5" .. 2)
print("12.5" + 2)--这里会打印出14.5，lua如果使用算数运算符会尝试将字符串转换为number，然后进行算数运算
print("12.5" - 2)
print(2^2)--幂运算
--#endregion

--#region 条件运算符
-- 使用> < >= <= ~= ==
a = 1
b = 2
c = 3
if a<b then
    print("a<b")
end
if b~=c then
    print("b~=c")
end
--#endregion

--#region 逻辑运算符
-- and or not，与Python一致，且满足“短路”规则
print(not true)
if true or false then
    print(1)
end
--#endregion

--region 条件分支语句if
--if语句
a = 2 
--单分支
if a>1 then
		print(1)
end
--双分支
if a>3 then
		print(2)
else
		print(3)
end
--多分支，这里使用elseif，lua中不存在Switch-case语句
if a>4 then
		print(4)
elseif a>3 then
		print(5)
elseif a>2 then
		print(6)
elseif a>1 then
		print(7)
end
--#endregion

--#region 循环语句
--while语句
var1 = 0
while var1<5 do--打印0-4
    print(var1)
    var1 = var1 + 1
end

--do-while语句
var2 = 5
repeat --打印5-1
    print(var2)
    var2 = var2-1
until var2 ==0 --填入终止循环条件

--for语句
for i = 1, 3, 1 do --do前面是计数器，第一个逗号后是终止循环的数值大小，第二个逗号后的数值是每次循环后增加的数值
    print(i)
end
--#endregion