`timescale 1ns/1ps

module sequence_detector_tb;

    reg clk;
    reg rst;
    reg din;
    wire detected;

    sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .detected(detected)
    );

    always #5 clk = ~clk;

    task send_bit;
        input bit_value;
        begin
            @(negedge clk);
            din = bit_value;
            @(posedge clk);
            #1;
            $display("Time=%0t din=%b detected=%b",
                     $time, din, detected);
        end
    endtask

    initial begin
        clk = 0;
        rst = 1;
        din = 0;

        repeat (2) @(negedge clk);
        rst = 0;

        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(1);

        #10;
        $finish;
    end

endmodule
