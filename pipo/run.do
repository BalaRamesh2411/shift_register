
	vlib work
	vlog pipo_tb.v
	vsim -voptargs="+acc" work.tb
	add wave -r *
	run -all


