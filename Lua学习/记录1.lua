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
caozuo4 = "nihao"
print(caozuo3 ..caozuo4)

--格式化输入
caozuo5 = 18
caozuo6 = string.format("I'm %d years old",caozuo5)
print(caozuo6)
--#endregion