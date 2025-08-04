//use this when running on EDA playground 

vsim ALU_tb +access+r -dbg
vcd file dump.vcd
vcd add -r sim:/*
run -all
