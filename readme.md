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


#### functions

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


