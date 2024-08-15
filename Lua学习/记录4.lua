--#region 基础数组

--创建一个table
a = {}
--一个数组中可以塞入不同类型的值
b = {true,"123",nil,1,nil}
print(b[1])--lua索引从1开始

--获取数组的长度
print(#b)--这里会打印为4，因为长度的获取如果最后一位是nil就会忽略最后一位

--遍历数组
for i=1,#b do
		print(b[i])
end
--#endregion

--#region 二维数组

--二维数组,就是在表中的表
c = {{1,2,3},{4,5,6}}
--引用表中的数据
print(c[1][1])--这里相当于首先取得二维数组中的第一个值（数组），随后在这个数组中取得第一个值

--遍历二维数组
for i=1,#c do
		b = c[i]--首先将第一个数组遍历出来
		for j=1,#b do --随后遍历第一个数组中的数据，注意这里不能用i，因为是两个不同的计数单位
				print(b[j])
		end
end

--#endregion

--#region 自定义索引

--自定义索引
d = {[0]=1,2,3,[-1]=4,5,[5]=6}
--此时1和4这里两个值就能通过0和-1索引
print(d[0])
print(d[-1])
--但是长度#上除了忽略最后一位nil，也从1开始按顺序识别，顺序中断2位开始不识别
print(#d)--这里会打印为3，1和4的索引小于1，6的索引不连续

e = {[1]=1,[2]=4,[4]=5,[6]=6}
print(#e)--这里会打印为6，因为顺序只中断了1位

--#endregion

--#region 遍历器-ipairs

--实验用数组
f = {[0]=1,2,3,[-1]=4,5,[5]=6}

for i,k in ipairs(f) do --这里输入i和k装载索引和值
		print("Index&Value = "..i.." and "..k)--这里也是从1开始，与#不同会直接忽略掉不连续的索引
end

--也可以只输入索引
for i in ipairs(f) do
		print("Index = "..i)
end
--#endregion

--#region 遍历器-pairs

--实验数组
g = {[0]=1,2,3,[-1]=4,5,[5]=6}

for i,k in pairs(g) do
		print("Index&Value = "..i.." and "..k)--pairs就能够遍历出所有的索引和值
end

for i in pairs(g) do--也可以只输入索引
		print("Index = "..i)
end
--#endregion