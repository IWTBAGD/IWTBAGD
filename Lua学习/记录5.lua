--table进阶使用

--#region table实现字典


--table声明字典
a = {["name"] = "damn",["age"] = 10,["1"] = 1}

--数据访问
print(a["name"])--基础的索引访问
print(a.name)--类似成员变量的.访问
print(a["1"])--但是数字不能使用.的方式只能使用索引，即使是字符串的额数组

--改值
a.name = "it"
print(a.name)

--新增
a["sexual"] = "boy"
print(a.sexual)

--删除
a["sexual"] = nil
print(a.sexual)

--字典的遍历,不能使用ipairs会忽略非整数索引
for i,k in pairs(a) do
    print(i.."_"..k)
end

for i in pairs(a) do
    print(i)
end

--#endregion