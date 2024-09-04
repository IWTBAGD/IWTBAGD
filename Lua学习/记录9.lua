--#region 面向对象-封装

--创建一个基类（表）
Object = {}
Object.id = 1

--new方法
function Object:new()--这里使用：是将自己作为第一个参数传入  
    local obj = {}
    self.__index = self--这里使用index，即当访问不存在的数据时使用元表的
    setmetatable(obj,self)--这里用self实际上就是传入的基表
    return obj --new返回出去一个表
end

--相当于是c#中new了一个实例
TestTable = Object:new()
print(TestTable.id)--这里访问的是元表的数据所以是1
TestTable.id = 12--对新表进行修改，有了自己的数据
print(TestTable.id)--由于有了自己的数据所以__index不会访问元表

--#endregion
print("*******************")

--#region 面向对象-继承

--继承方法，实质上逻辑与前面new的没啥区别
function Object:subClass(className)
    _G[className] = {}--_G表会记录全局变量，所以在大G表中创建变量省去了return
    self.__index = self
    _G[className].base = self--这一行是多态中实现base的逻辑
    setmetatable(_G[className],self)
end

Object:subClass("Test2")--创建一个子类
print(Test2.id)
Test2.id = 20
--t2 = Test2:new()
Test2:subClass("t2")--这里就是继承的核心表现，Test2是空表没有subClass方法，于是就找Test2_index指向的Object:subClass方法；而方法调用者是Test2，所以子类t2就会指向Test2
print(t2.id)--但由于Test2.id赋值了20，所有读取到Test2就停止了


--#endregion
print("*******************")

--#region 面向对象-多态

--先继承一个基类，随后在子类中创建Move方法
Object:subClass("GameObject")
GameObject.posX = 0
GameObject.posY = 0
function GameObject:Move()
    self.posX = self.posX + 1
    self.posY = self.posY + 1 
    print(self.posX.."and"..self.posY)
end

--在创建一个子类，实现方法的重写
GameObject:subClass("Player")
function Player:Move()
    self.base:Move()--这里base后使用:因为原方法需要导入自己，这里的base就是subClass中的父类，使用父类中的原逻辑
    
end

--实例一个对象执行逻辑
local p1 = Player:new()
p1:Move()

--#endregion