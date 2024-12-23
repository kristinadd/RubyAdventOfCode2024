# CSV.foreach

# 1.Stream-based: Reads the CSV file line by line, one row at a time.
# 2.Efficient for large files: Since it processes one row at a time, it doesn't load the entire file into memory, making it more memory-efficient for large files.
# 3.Iterative: You provide a block, and foreach passes each row to the block during iteration.

CSV.foreach('file.csv', headers: true) do |row|
  puts row.inspect
end

# When to Use:

# When you want to process each row individually without loading the entire file into memory.
# Ideal for large CSV files.

#################################################################################
# CSV.read

# 1.Loads the entire file: Reads the entire CSV file into an array of rows at once.
# 2.Memory-intensive: Stores all rows in memory, so it may not be suitable for very large files.
# 3.Array-based: Returns the rows as an array of arrays (headers: false) or an array of CSV::Row objects (headers: true).


rows = CSV.read('file.csv', headers: true)
rows.each do |row|
  puts row['name']
end

# When to Use:

# When you need to load and work with the entire CSV file at once.
# Useful for smaller files or when you need to perform multiple operations on the same data.

#################################################################################
# 