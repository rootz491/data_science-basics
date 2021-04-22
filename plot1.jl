using XLSX

data = XLSX.readxlsx("Data Refresh Sample Data.xlsx")	#	open (dataset)file

sn = XLSX.sheetnames(data)	#	get sheetname

s1 = data[sn[1]]			#	open first sheet


using DataFrames

table = DataFrame(XLSX.readtable("Data Refresh Sample Data.xlsx", "Sheet1")...)

#	draw bar graph
print(bar(table."Unit Price", table.Profit))

#	plot graph-line
print(plot(table."Unit Price", table.Profit, label="Ship mode"))