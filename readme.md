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

####	sample code
```julia
function hello()
   print("enter name: ")
   name = readline()
   println("Hello, "+name)
end
```

*	output
```text
julia> hello()
enter name: karan sharma
Hello, karan sharma
```


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

