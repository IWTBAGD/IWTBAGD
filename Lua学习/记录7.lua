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
print("************************")
--#region 协程的创建

function Test_co()--创建一个函数，协程需要依附一个函数
    print(01)
end

--创建协程的第一种方式，通过coroutine.create(函数)
co1 = coroutine.create(Test_co)--需要使用一个变量装载
print(type(co1))--返回一个线程对象

--创建协程的第二种方法，通过coroutine.wrap(函数)
co2 = coroutine.wrap(Test_co)--需要一个变量装载
print(type(co2))--返回一个方法

--#endregion
print("************************")
--#region 协程的运行

--第一种方法创建的协程使用coroutine.resume(协程名)方法运行
coroutine.resume(co1)
--第二种方式创建的协程由于本身就是一个方法类型，所以可以直接调用
co2()

--#endregion
print("************************")
--#region 协程的挂起

--创建一个函数
function Test_co2()
    local i  = 1
    while true do--写一个死循环测试lua的运行逻辑
        print(i)--由于不像unity中的c#有着游戏运行的死循环且脚本执行顺序为从上到下，所以即使协程中写了个死循环也只能做到脚本中多次执行协程时不断累积执行该循环
        i = i + 1
        --协程的挂起函数
        coroutine.yield(i)
    end
end

co3 = coroutine.create(Test_co2)
co4 = coroutine.wrap(Test_co2)

--这里打印1
coroutine.resume(co3)
co4()

--这里打印2
coroutine.resume(co3)
co4()

temp5,temp6 = coroutine.resume(co3)--这里也会运行一次
print(temp5,temp6)--使用.create创建的协程返回值第一个默认是true，代表是否成功返回，第二个才是输入的参数
temp5,temp6 = co4()
print(temp5,temp6)--使用.wrap创建的协程会直接返回参数，不返回布尔数


--#endregion
print("************************")
--#region 协程的状态

--协程共有3种状态，coroutine.status(协程对象)函数可以获取，dead结束，suspended暂停，running运行中
print(coroutine.status(co1))
print(coroutine.status(co3))--其中如果是使用.warp方法创建的协程不能用这个函数获取


print(coroutine.running())--coroutine.running()能够获取正在运行的协程编号，只有在协程内调用才能返回
--#endregion