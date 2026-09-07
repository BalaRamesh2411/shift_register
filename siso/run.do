
	vlib work
	vlog siso_tb.v
	vsim -voptargs="+acc" work.tb
	add wave -r *
	run -all


