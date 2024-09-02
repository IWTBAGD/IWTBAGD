--多脚本执行

--#region 本地变量与全局变量

--Lua中声明的变量都是全局变量，即使是在语句或者函数中的变量
for i = 1, 2, 1 do
    a = 1
end
print(a)--能够打印出语句中的变量

--在变量名前加上关键字local，变为本地变量

for i = 1, 2, 1 do
    local b = 2
end
print(b)--这里会打印nil

--#endregion

--#region 多脚本执行

--使用require("脚本名")执行，能够使用脚本中的所有成员变量
require("6_Test")
--执行这个脚本会print出2，因为脚本本身访问了bb
print(bb)--这里会打印nil，因为该变量为local
print(aa)--这里可以正常打印全局变量
--#endregion

--#region 脚本卸载

--当一个脚本被require后就被加载了，不会被重复加载

--可以使用package.loaded["脚本名"] 判断脚本是否被加载
print(package.loaded["6_Test"])

--通过在执行脚本中返回其本地变量，获得其他脚本中的本地变量
testBB = require("6_Test")
print(testBB.."这是testBB")

package.loaded["6_Test"] = nil--直接赋值为nil或者false，就能卸载该脚本

--#endregion

--#region 大G表

--_G就是大G表，会储存脚本中出现过的所有全局变量，即使脚本被卸载了，变量还是会保留
for key, value in pairs(_G) do
    print(key,value)
end
--#endregion
