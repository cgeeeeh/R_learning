#R语言 从数据思维到数据实战


#2.1
#R中的数据类型

# match 函数帮助我们在y中找到x中元素对应的位置
x = c(1, 2, 3, 2, 3)
x
y = letters[x]
y
match(y, letters)

# cut函数能将连续数值离散化
age = c(11, 21, 31, 41, 51, 61)
label = c("壮年", "中年", "老年")
ages = cut(age, breaks = c(10, 20, 40, 70), labels = label)
ages

#sort 函数将向量排序，
#而 order 函数返回x中的每个元素在所有元素中的排名位置
x = c(1, 10, 7, 9, 3)
sort(x)
order(x)

#paste 函数能扩充一个字符串or合并两个字符串
paste(c("双", "11"), collapse = " ")
paste("A", 1:4, sep = "_")

#grep函数用来搜索，gsub函数用来替换
x = c("狗熊会", "双11", "生日")
grep("狗", x)
gsub("生日", "happy birthday", x)


#将向量转化为矩阵(默认按列排列)
M = matrix(1:12,
           nrow = 3,
           ncol = 4,
           byrow = T)
M

#对dataframe可以根据某些指标进行排序（类似excel的效果）
stars = c("孙俪", "邓超", "鲁迅", "胡适")
movies = c("A", "B", "C", "D")
moneys = c(1000, 1200, 900, 800)
df = data.frame(movies, stars, moneys)
order(df$stars, decreasing = T)
df = df[order(df$stars, decreasing = T), ]
head(df)
df = df[order(df$moneys, df$stars, decreasing = T), ]
head(df)

#melt函数将dataframe从长表变成宽表
library(reshape2)
df = data.frame(
  Name = c("熊大", "水妈"),
  Type = c("帅哥", "美女"),
  GF2013 = c(2000, 1000),
  GF2014 = c(1500, 2500)
)
df = melt(df,
          id.vars = c("Name", "Type"),
          variable.name = "Year")
df

#dcast函数将宽表变成长表
df = dcast(df, Name + Type ~ Year)
df

#ddply函数能将数据分组，并对每个子组应用某个函数的操作
library(plyr)

#列表元素可以是之前提到的所有数据结构，
#list函数能将不同元素组成一个list
#str能将一个list的层级完整地展示出来
l = list(c(1, 2, 3), "st", list("th", c(4, 5)))
str(l)

#利用名字和序号引用l的第一个元素
l[[1]]
l[1]

#对列表中的每个元素应用某个函数
#lapply 在计算完成后返回的数据类型是list
#sapply返回的则是向量与矩阵
#mapply 能将两个列表的对应位置一一计算
price = list(year2014 = 30:33,
             year2015 = 33:36,
             year2016 = 36:39)
price
lapply(price, mean)
sapply(price, mean)
amount = list(
  year2014 = rep(100, 4),
  year2015 = rep(200, 4),
  year2016 = rep(300, 4)
)
mapply("*", price, amount)


#2.2
#读入数据
#getwd，setwd可以查询与更改工作目录
getwd()
#txt：read.table(  )
#文件名，首行是否是列名，分隔符
#csv:read.csv()

#2.2.2
#非结构化数据，文本数据读入

