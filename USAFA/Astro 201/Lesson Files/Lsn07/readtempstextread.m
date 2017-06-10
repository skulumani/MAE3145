% This m-file is for use as a demonstration during Astro 201 lesson 9 to
% demonstrate the use of the textread function.  It requires that the CD is
% the folder where the file tempsheaders.txt is located.  This file has
% header rows and a footer row


%Let's assume we know there are 2 rows of data (we'll look at how to count
%the number of lines of data later when we introduce the while loop)


%I want to read each column of data into a separate value
[temp1 temp2 temp3 temp4 temp5]=textread('tempsheaders.txt','%f %f %f %f %f',2,'headerlines',3)

% I now have 5 separate variables, each representing the columns of data in
% the file

temp1f(1,1)=cels2fahr(temp1(1,1))%semicolons left off so they print to the screen
temp1f(2,1)=cels2fahr(temp1(2,1))
temp2f(1,1)=cels2fahr(temp2(1,1))
temp2f(2,1)=cels2fahr(temp1(2,1))
temp3f(1,1)=cels2fahr(temp3(1,1))
temp3f(2,1)=cels2fahr(temp3(2,1))
temp4f(1,1)=cels2fahr(temp4(1,1))
temp4f(2,1)=cels2fahr(temp4(2,1))
temp5f(1,1)=cels2fahr(temp5(1,1))
temp5f(2,1)=cels2fahr(temp5(2,1))
