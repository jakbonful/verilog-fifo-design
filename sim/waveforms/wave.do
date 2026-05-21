onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fifo_sync_tb/clk
add wave -noupdate /fifo_sync_tb/rst_n
add wave -noupdate /fifo_sync_tb/cs
add wave -noupdate /fifo_sync_tb/wr_en
add wave -noupdate /fifo_sync_tb/rd_en
add wave -noupdate /fifo_sync_tb/data_in
add wave -noupdate /fifo_sync_tb/data_out
add wave -noupdate /fifo_sync_tb/empty
add wave -noupdate /fifo_sync_tb/full
add wave -noupdate /fifo_sync_tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {114265 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 40
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {111288 ns} {116470 ns}
