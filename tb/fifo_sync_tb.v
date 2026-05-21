`timescale 1us/1ns
module fifo_sync_tb ();
  
// Testbench Variables
    parameter depth = 8;
    parameter width = 32;

    // DUT Inputs
    reg clk = 0;
    reg rst_n;
    reg cs;
    reg wr_en;
    reg rd_en;
    reg [width-1:0] data_in;

    // DUT Outputs
    wire [width-1:0] data_out;
    wire empty;
    wire full;

    // For verification
    integer i;

// DUT Instance
    fifo_sync #(.FIFO_DEPTH(depth),.DATA_WIDTH(width)) FIFO0 (
        .clk(clk),
        .rst_n(rst_n),
        .cs(cs),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

// Task for Write & Read

    // WRITE
    task write_data(input [width-1:0] d_in);
        begin
            @ (posedge clk);
            cs = 1;
            wr_en = 1;
            data_in = d_in;
            $display($time, " write data_in = %0d", data_in);
            @ (posedge clk);
            cs = 1; wr_en = 0;
        end
    endtask

    // READ
    task read_data();
        begin
           @ (posedge clk);
           cs = 1;
           rd_en = 1;
           @ (posedge clk);
           #0.1;
           $display("%0t read_data data_out = %0d", $time, data_out);
           cs = 1; rd_en = 0;
        end
    endtask

// Clock Signal
always begin
    #0.5 clk = ~clk;
end

// Stimulus
    initial begin
        #1;
        rst_n = 0;
        rd_en = 0;
        wr_en = 0;

        #1.3;
        rst_n = 1;
        $display($time, "\n SCENARIO 1");
        write_data(1);
        write_data(10);
        write_data(100);
        read_data();
        read_data();
        read_data();
        read_data();

        $display($time, "\n SCENARIO 2");
        for (i = 0;i < depth; i = i + 1) begin
            write_data(2**i);
            read_data();
        end

        $display($time, "\n SCENARIO 3");
        for (i = 0;i < depth; i = i + 1) begin
            write_data(2**i);
        end

        for (i = 0; i < depth; i = i + 1) begin
            read_data();
        end

        #40 $stop;
    end
    


endmodule