function readvector(filename)

fileid = fopen(filename, 'rt')
row = 0

while not(feof(fileid))
    row = row +1
    v(row,col) = fscanf(fileid,'%f',1)
    
end

fclose(fileid)