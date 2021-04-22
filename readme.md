# data science


## language:
> julia		[that's what we are using]


### libraries/packages:
> matplotlib	-	for data analysis    
> Matlab	-	for mathematical computations


## quick notes:

* file extension for julia code = `.jl`


###	operations:

1.	compliment `~`

2.	and 	`&`

3.	or 		`|`

4.	biswise operations like `>, <, >>>`


mathematical operations: [here](https://docs.julialang.org/en/v1/manual/mathematical-operations/)


####	input data

*	to input a string:
```julia
var = readline()
```

*	to read a number:
```julia
num = parse(Int64, readline())
```


####	loop

*	while
```julia
while(true)
	print("Go to hell")
end
```


####	conditional

*	if else
```julia
if(num%2==0)
	println("even")
else
	println("odd")
end
```


### functions:

1.	traditional method:
```julia
function sum(a,b)
	a+b
end
```

2.	new method:
```julia
sum(a,b) = a+b
```

*	assignment of function object
```julia
something = sum
```
*	now assigned object will work same
```julia
something(5,10)
```


####	types of function

*	User-defined function
*	Parameteric function


####	Forms of function

*	No arguments, no return value
*	No arguments, return value
*	Arguments, no return value
*	Arguments, return value



```julia
function sumData()
	println("Enter first number")
	n1 = parse(Int64, readline())
	println("Enter second number")
	n2 = parse(Int64, readline())	
	return n1 + n2
end
```

#####	return multiple values from function

```julia
julia> function addMultiply(a, b)
               return a+b, a*b
       end
addMultiply (generic function with 1 method)

julia> a = 10
10

julia> b = 5
5

julia> a, b = addMultiply(a,b)
(15, 50)

julia> a
15

julia> b
50
```



####	keyword argument

*	when we have multiple number of arguments and can't maintain order of arguments while calling then we can use **keyword argument**.

```julia
julia> function plot(x, y; width=10, height=10)
               println("x: ",x)
               println("y: ",y)
               println("H*W: ",width*height)
       end
plot (generic function with 1 method)

julia> plot(.5, 8)
x: 0.5
y: 8
H*W: 100

julia> plot(.5, 8, width=20)
x: 0.5
y: 8
H*W: 200
```

*	here we have to pass `x` & `y` as arguments (compulsory) but it's not manditory to pass the other two i.e. width & height!

*	we've already provided default values for `width` & `height` arguments. 

*	so if we want to pass them as argument then we have to tell explicity that which of the optional argument has been passed.

*	order is flexible i.e.	it doesn't matter if we change the order of argument (only in terms of optional arguments).

###	File handling

*	open a file

```julia
f = open('filename.ext')
```

*	close a file

```julia
close(f)
```

*	to read data from file

```julia
read(fileObject, String)
```

*	to open a file then read, and close at same time

```julia
open("filename.txt") do f1 
	println(reaf(f1, String))
end
```

*	time to read file and no. of lines in files

```julia
tt, t1 = open("filename.txt") do f2
	lc = 0
	timeTaken = @elapsed for r in eachline(f2)
		lc+=1
	end
	(timeTaken, lc)
end
```

*	to read line by line

```julia
open("filename.txt") do f3
	for i in readlines(f3)
		print(i)
	end
end
```

```julia
open("filename.txt") do f3
	for i in eachline(f3)
		print(i)
	end
end
```


*	to write to file

```julia
using 
open("filename.txt", "w") do f
	writedl(f, [name, age])
end
```

```julia
file = open("file.txt", "w")
write(file, "hello world")
```


*	question: 	read data from a file & write into other file

```julia
f = open("exp.txt")
of = open("otherFile.txt", "w")

for i in readlines(f)
   write(of, i)
end

close(f)
close(of)
```


*	reading a xlxs (excel) file

```julia
using pkg
pkg.add("XLSX")
import XLSX
XLSX.openxlsx("file.xlsx") do f
	sh = file["sheet1"]
	for i in XLSX.reachrow(f)
		print(i)
	end
end
```

DataFrame(XLSX.readtable("Data Refresh Sample Data.xlsx", "Sheet1")...) do f
	for i in f
		print(i)
	end
end


##	DataFrames

there are bunch of methods here, 
just look into file named `dataFrameExp.jl`



##	read data from dataset

####	XLSX file:		

> read this file: `terminal-julia-run.txt` & `dataFrameExp2.jl`

```julia
using XLSX

data = XLSX.readxlsx('/path/to/file.xlsx')

sheetname = XLSX.sheetnames(data)

ref = data[sheetname]

# to get data

print(ref[1,5])

print(ref["A2:E6"])


XLSX.readdata("/path/to/file.xlsx", "sheetname", "A2:E10)

using DataFrames

d = DataFrame(XLSX.readtable("/path/to/file.xlsx", "sheetname")...)

d[10, :]

d[1:20, :]
```

##	Database

>	going to do some CRUD on MySQL via julia.



```mysql

mysql> CREATE DATABASE example;
Query OK, 1 row affected (0.01 sec)

mysql> USE example;
Database changed

mysql> CREATE TABLE user (name varchar(30) PRIMARY KEY, gender varchar(1) NOT NULL);
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_example |
+-------------------+
| user              |
+-------------------+
1 row in set (0.01 sec)

mysql> DESC user;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| name   | varchar(30) | NO   | PRI | NULL    |       |
| gender | varchar(1)  | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> INSERT INTO user VALUES("Karan Sharma", "M");
Query OK, 1 row affected (0.02 sec)

mysql> CREATE TABLE student(name varchar(30), rollno int, address text, course varchar(10));
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO student VALUES("Karan Sharma", 39, "Dehradun", "BCA");
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM student;
+--------------+--------+----------+--------+
| name         | rollno | address  | course |
+--------------+--------+----------+--------+
| NULL         |   NULL | NULL     | NULL   |
| Karan Sharma |     39 | Dehradun | BCA    |
+--------------+--------+----------+--------+
2 rows in set (0.00 sec)

mysql> INSERT INTO student VALUES("Nikhil Swain", 43, "Odisa", "BCA");
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES("Sudhanshu Rajdhur", 73, "UP", "BCA");
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM student WHERE name IS NOT NULL;
+-------------------+--------+----------+--------+
| name              | rollno | address  | course |
+-------------------+--------+----------+--------+
| Karan Sharma      |     39 | Dehradun | BCA    |
| Nikhil Swain      |     43 | Odisa    | BCA    |
| Sudhanshu Rajdhur |     73 | UP       | BCA    |
+-------------------+--------+----------+--------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE student ADD age INT;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DELETE FROM student WHERE name IS NULL;
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE student SET name = "Karan" WHERE rollno = 39;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM student;
+-------------------+--------+----------+--------+------+
| name              | rollno | address  | course | age  |
+-------------------+--------+----------+--------+------+
| Karan             |     39 | Dehradun | BCA    | NULL |
| Nikhil Swain      |     43 | Odisa    | BCA    | NULL |
| Sudhanshu Rajdhur |     73 | UP       | BCA    | NULL |
+-------------------+--------+----------+--------+------+
3 rows in set (0.00 sec)

mysql> UPDATE student SET age = 19;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> INSERT INTO student VALUES("Aditya Anand", 7, "Bihar", "BCA", 21);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM student ORDER BY name ASC;
+-------------------+--------+----------+--------+------+
| name              | rollno | address  | course | age  |
+-------------------+--------+----------+--------+------+
| Aditya Anand      |      7 | Bihar    | BCA    |   21 |
| Karan             |     39 | Dehradun | BCA    |   19 |
| Nikhil Swain      |     43 | Odisa    | BCA    |   19 |
| Sudhanshu Rajdhur |     73 | UP       | BCA    |   19 |
+-------------------+--------+----------+--------+------+
4 rows in set (0.00 sec)

mysql> DROP TABLE user;
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_example |
+-------------------+
| student           |
+-------------------+
1 row in set (0.01 sec)

mysql> ALTER TABLE student ADD semester INT(2);
Query OK, 0 rows affected, 1 warning (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> SELECT * FROM student;
+-------------------+--------+----------+--------+------+----------+
| name              | rollno | address  | course | age  | semester |
+-------------------+--------+----------+--------+------+----------+
| Karan             |     39 | Dehradun | BCA    |   19 |     NULL |
| Nikhil Swain      |     43 | Odisa    | BCA    |   19 |     NULL |
| Sudhanshu Rajdhur |     73 | UP       | BCA    |   19 |     NULL |
| Aditya Anand      |      7 | Bihar    | BCA    |   21 |     NULL |
+-------------------+--------+----------+--------+------+----------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE student DROP semester;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student;
+-------------------+--------+----------+--------+------+
| name              | rollno | address  | course | age  |
+-------------------+--------+----------+--------+------+
| Karan             |     39 | Dehradun | BCA    |   19 |
| Nikhil Swain      |     43 | Odisa    | BCA    |   19 |
| Sudhanshu Rajdhur |     73 | UP       | BCA    |   19 |
| Aditya Anand      |      7 | Bihar    | BCA    |   21 |
+-------------------+--------+----------+--------+------+
4 rows in set (0.00 sec)
```



##	plotting

package:	`Plots`

*	use to plot values to graph in 2-D format!

*	to draw graph:

	1.	plot()
	2.	bar()


###	plot

```julia
using Pkg

Pkg.add("Plots")

using Plots

x = 1:10

y = rand(10, 2)

plot(x, y, title="first line plot", label=["first" "second"], lw=4)

xlabel!("X-AXIS")

ylabel!("Y-AXIS")

plot(x, y, seriestype=:scatter, title="First Line Plot")
```

###	bar

*	also read: `plot1.jl`

```julia

bar(x, y)

bar(data.x, data.y, legend=:topleft, label="India")

```

###	VegaLite & VegaDatasets

>	PieChart

```

using Pkg

Pkg.add("VegaLite")

Pkg.add("VegaDatasets")

using VegaLite

party =["BJP", "RRS", "Congress"]
seats = [123, 1231, 213]

p = pie(party, seats)

using VegaDataset

carData = VegaDataset("car")

#	print data in form of graph which will display in browser

data |> @vlplot(:point, x=:colName, y=:colName2) |> display

data |> @vlplot(:point, x=:colName, y=:colName2, column=:colName) |> display

data |> @vlplot(:bar, x="count()", y=:colName2) |> display

data |> @vlplot(:bar, x="average(colName)", y=:colName2) |> display
```



##	to get dataset through RDataset pkg


