
	vlib work
	vlog bidirectional_shift_tb.v
	vsim -voptargs="+acc" work.tb
	add wave -r *
	run -all


