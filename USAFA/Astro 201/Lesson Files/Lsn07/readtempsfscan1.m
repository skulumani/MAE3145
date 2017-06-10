% This m-file is for use as a demonstration during Astro 201 lesson 9 to
% demonstrate the use of the fscanf function.  It requires that the CD is
% the folder where the file tempsplain.txt is located.

%open the file and set tempsfile as the pointer for it
tempsfile=fopen('tempsplain.txt','rt') 

%I will read in all 5 numbers into the variable temp--consequently, temp
%will be an array of 5 numbers
temp=fscanf(tempsfile,'%f',5)


%now I have a a variable called temp which has 5 numbers in it

% I will now send each element of temp to the function we created in lesson
% 6 (cels2fahr.m) to convert them to Fahrenheit note that in Matlab, if I
% send the array of temps to the function, I need only call the function
% once

tempf=cels2fahr(temp)%semicolons left off so they print to the screen
