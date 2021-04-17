using XLSX

data = XLSX.readxlsx("Data Refresh Sample Data.xlsx")

sn = XLSX.sheetnames(data)

s1 = data[sn[1]]


using DataFrames

table = DataFrame(XLSX.readtable("Data Refresh Sample Data.xlsx", "Sheet1")...)

for i in eachrow(table)
    if (i[3] > 100)		#	enter logic here.
		print(i)
    end
end