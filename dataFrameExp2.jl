using XLSX

data = XLSX.readxlsx("Data Refresh Sample Data.xlsx")	#	open (dataset)file

sn = XLSX.sheetnames(data)	#	get sheetname

s1 = data[sn[1]]			#	open first sheet


using DataFrames

table = DataFrame(XLSX.readtable("Data Refresh Sample Data.xlsx", "Sheet1")...)

for i in eachrow(table)	#	get a tuple of rows of table
    if (i[3] > 100)		#	enter logic here.
		print(i)		#	print row which satisfy condition
    end
end