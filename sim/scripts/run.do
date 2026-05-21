vlib work
vmap work work
vlog ../../../rtl/fifo_sync.v
vlog ../../../tb/fifo_sync_tb.v
vsim -gui work.fifo_sync_tb
add wave -position end sim:/fifo_sync_tb/*
run -all
