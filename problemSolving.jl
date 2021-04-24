using DataFrames
using XLSX
using Query

data = DataFrame(XLSX.readtable("path/to/file", "sheet1")...)



d1 = data |> 
@groupby(_.Icon) |>
@map({Icon=key(_), Cout=(_)}) |>
DataFrame



# this will print filtered data
d2 = data |>
@filter(_.tofleft==_.topright) |>
DataFrame
# 	thi will count rows
nrow(d2)

size(d3, 1)



d4 = data |>
@groupby(_.zone) |>
@map({Zone=key(_), Count=length(_)}) |> DataFrame
# list of zone & count
d4.zone
d4.count
#	to plot data as Bar graph
using Plots
bar(d4.Zone, d4.Count)
#		to give numbering
dd = ["NE", "SE", "SW", "NW"]
bar(dd, d4.count)



d5 = data |>
@filter(_.Zone==1) |>
@orderby_descending(_.area)
first(d5, 1)



d6 = data |>
@groupby(_.language) |>
@map({Lang=key(_), Count=length(_)}) |>
@orderby_descending(_.language) |>
DataFrame



d7 = data |>
@map({Name=_.Name, Value=_.bars+_.Stripes}) |>
@orderby_descending(_.Value) |>
DataFrame
#	to get first 5 records
first(d7, 5)



#	find out least populated country in south-america landmass
d8 = data |>
@filter(_.landmass==2) |>
@orderby_descending(_.population) |>
DataFrame
#	to get first value (least will be on top)
last(d8, 1)



d9 = data |>
@groupby(_.color) |>


#	this is wrong!!
d10 = sum(data, _.cicle)


#	countries
d11 = data |>
@filter(_.text==1 && _.icon==1) |>
DataFrame
#	counting
nrows(d11)