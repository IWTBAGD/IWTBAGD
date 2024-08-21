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

--#region table实现类和结构体
--实现类
b = {
    --创建变量，由于也是表里的一个数据，需要使用,分隔
    age = 1,
    sex = 0,
    --创建函数
    Test = function()
            print("test")
    end
}
--调用类中的变量与函数，lua没有面向对象的概念，所以不用new一个实例，整体更像是也静态的类

print(b.age)
b.Test()--调用函数

--也可以类似给表添加值的方式，声明一个变量或者函数
b.name = "ceshi"
b.Test2 = function()--函数的场外声明
    print("test2")
end
b.Test2()

--函数的第三种声明方式
function b.Test3()
    print("test3")
end
b.Test3()

--类中如果想要表内的变量
c = {
    age = 2,
    sex = 0,
    
    --第一  Lua中必须要让函数知道具体调用的是哪个表的变量
    Test = function()
            print("age_"..c.age)--如果这里直接写age会是nil
    end,
    
    --第二 还可以将表作为参数传入函数中
    Test2 = function(temp)
            print("age_"..temp.age)
    end,
    
    --第三 使用一个语法糖:调用，这种调用方法会默认将调用者自身作为第一个参数传入函数
    Test3 = function(self)--self不是关键字，只是约定速成的自己调用写法，跟第二种的参数没啥区别
            print("age_"..self.age)
    end
}


c.Test()
c.Test2(c)--将表自己作为参数传入
c:Test3()--这里使用了:调用
c.Test3(c)--这里也可以不用:也证明了self实际上就是一个普通的参数变量

--#endregion

print("*********************************")--分割线

--#region table的公共操作

--插入
T1 = {{name = 1 ,age = 0},{name = 2 ,age = 5}}--这里创建一个二维数组/或者说是表中表
T2 = {name = 3 ,age = 10}

table.insert(T1,T2)--格式是逗号前=被插入的表 逗号后为插入的元素；插入在最后一位
print(T1[3].age)--这里会打印出10，证明插入成功

--删除
table.remove(T1)--remove 会移出表最后一位元素
--print(T1[3].name)--这里会显示为nil/或者报错

table.remove(T1,1)--如果加多一个参数会移出指定索引的元素
print(T1[1].name)--这里会显示2，因为1已经被移除了

--排序

T3 = {2,6,5,7,1,9}--先声明一个数组
table.sort(T3)--默认状态是升序排序（小到大）

for i,k in pairs(T3) do--使用pairs遍历T3中的值
		print(k)
end

--第二种写法，额外传入一个排序规则函数，示例为降序排序
table.sort(T3,function(a,b)--这里实际上涉及到sort的执行逻辑了，ab就是对比两个数字之间大小，true就会向前移
		if a>b then
		    return true
		end
end
)

for i,k in pairs(T3) do--使用pairs遍历T3中的值
		print(k)
end

--表的拼接,只能拼接number和str类型的元素 ，其他类型都会报错
T4 = {1,2,3,4,5,6,"seven"}--会将表中的元素以拼接字符为间隔拼接成一个字符串，然后返回
str1 = table.concat(T4,",")
print(str1)
--#endregion
