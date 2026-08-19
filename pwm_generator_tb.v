`timescale 1ns/1ps

module pwm_generator_tb;

    reg clk;
    reg reset;
    reg [7:0] duty_cycle;

    wire pwm_out;

    // Instantiate the PWM Generator
    pwm_generator uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform file
        $dumpfile("waveform.vcd");
        $dumpvars(0, pwm_generator_tb);

        // Initialize signals
        clk = 0;
        reset = 1;
        duty_cycle = 8'd0;

        // Apply reset
        #20;
        reset = 0;

        // Test 25% Duty Cycle
        duty_cycle = 8'd64;
        #3000;

        // Test 50% Duty Cycle
        duty_cycle = 8'd128;
        #3000;

        // Test 75% Duty Cycle
        duty_cycle = 8'd192;
        #3000;

        // Test Nearly 100% Duty Cycle
        duty_cycle = 8'd255;
        #3000;

        $finish;
    end

endmodule