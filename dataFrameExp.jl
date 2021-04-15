using DataFrames

data = DataFrame(Name=["karan", "Nik", "Aditya", "Sudi"], Age=[19, 19, 21, 19])

println(data)

println(data.Name)

#	select last to rows completely
println(last(data, 2))

#	select third row and all columns
println(data[3,:])

#	select third row and first column
println(data[3,1])

#	add a new row
push!(data, ["Raushan", 20])

# 	insert new column
insert(data, "salary", [90000, 140000, 100000, 210000, 120000], :id)

println(data)
