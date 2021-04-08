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

