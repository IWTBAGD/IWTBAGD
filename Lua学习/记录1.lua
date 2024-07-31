-- 简单变量类型
a = 'ceshi'
print(a)

--#region 字符串操作

-- 使用#就会返回字节长度
caozuo = "长"
print(#caozuo)--其中汉字在UTF-8的编码下占3个字节

-- 字符串换行
print("123\n456")--使用转义字符\n

--使用双中括号+换行
caozuo2 = [[12
34
56]]
print(caozuo2)

--字符串拼接
caozuo3 = 2
caozuo4 = "nihao=hi"
print(caozuo3 ..caozuo4)

--格式化输入
caozuo5 = 18
caozuo6 = string.format("I'm %d years old",caozuo5)
print(caozuo6)

--数据类型显式转换
caozuo7 = 233
print(tostring(caozuo7))--实际上print会自动隐式转换为string，这个只是做一个演示

-- 字符串公共方法
caozuo8 = "ABCdef"
print(string.upper(caozuo8))-- 小写转大写
print(string.lower(caozuo8))-- 大写转小写

print(string.reverse(caozuo8))-- 字符串翻转

print(string.find(caozuo8,"AB"))-- 查找字符串索引，当搜索到第一个符合要求字符串后会中终止并返回值

print(string.sub(caozuo8,2,4))-- 字符串截取，闭区间，可重载

print(string.rep(caozuo8,3))-- 字符串重复

print(string.gsub(caozuo8,"BC","bc"))-- 字符串修改

print(string.byte(caozuo8,1,3))-- 字符串转换为ASCII

print(string.char(65,66,67))-- ASCII转换为字符串
--#endregion