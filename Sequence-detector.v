module sequence_detector (
    input wire clk,
    input wire rst,
    input wire din,
    output reg detected
);

    parameter S0   = 3'b000,
              S1   = 3'b001,
              S10  = 3'b010,
              S100 = 3'b011;

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        detected = 1'b0;

        case (state)
            S0: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S10;
            end

            S10: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S100;
            end

            S100: begin
                if (din) begin
                    detected = 1'b1;
                    next_state = S1;
                end
                else begin
                    next_state = S0;
                end
            end

            default: begin
                next_state = S0;
                detected = 1'b0;
            end
        endcase
    end

endmodule
