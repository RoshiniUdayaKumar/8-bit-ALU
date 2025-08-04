//use this when running on EDA playground 

vsim +access+r;
run -all;
acdb save;
acdb report -db fcover.acdb -txt -o cov.txt;
exit
