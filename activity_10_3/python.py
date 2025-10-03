Data = "Data"
Types = "Types"

DataTypes = Data + Types
print(DataTypes)

extractedTypes = DataTypes[len(Data):]
print(extractedTypes)
