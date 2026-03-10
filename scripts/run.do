quit -sim
vlib work
vlog -sv -f ./scripts/files.f
vsim work.overlap_mo_101_tb
add wave -position insertpoint \
sim:/overlap_mo_101_tb/DUT/clk \
sim:/overlap_mo_101_tb/DUT/arstn \
sim:/overlap_mo_101_tb/DUT/in \
sim:/overlap_mo_101_tb/DUT/current_state \
sim:/overlap_mo_101_tb/DUT/next_state \
sim:/overlap_mo_101_tb/DUT/out
run -all