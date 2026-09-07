
	vlib work
	vlog sipo_tb.v
	vsim -voptargs="+acc" work.tb
	add wave -r *
	run -all


