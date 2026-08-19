`timescale 1ns/1ps

module pwm_generator (
    input        clk,
    input        reset,
    input  [7:0] duty_cycle,
    output reg   pwm_out
);

    reg [7:0] counter;

    // Counter
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 8'b00000000;
        else
            counter <= counter + 1'b1;
    end

    // PWM Generation
    always @(*) begin
        if (counter < duty_cycle)
            pwm_out = 1'b1;
        else
            pwm_out = 1'b0;
    end

endmodule