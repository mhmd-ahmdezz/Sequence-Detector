quit -sim
vlib work
vlog -sv -f ./scripts/files_adv.f
vsim work.overlap_mo_101_tb_adv
add wave -position insertpoint \
sim:/overlap_mo_101_tb_adv/DUT/clk \
sim:/overlap_mo_101_tb_adv/DUT/arstn \
sim:/overlap_mo_101_tb_adv/DUT/in \
sim:/overlap_mo_101_tb_adv/DUT/current_state \
sim:/overlap_mo_101_tb_adv/DUT/next_state \
sim:/overlap_mo_101_tb_adv/DUT/out
run -all