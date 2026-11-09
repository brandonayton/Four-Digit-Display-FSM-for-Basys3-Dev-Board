## Four-Digit-Display-FSM-for-Basys3-Dev-Board
This is a finite state machine that was coded in Verilog for the Basys3 Development Board. The purpose of this state machine is to decode the signals from the 16 on board switches to display (in hex) onto the 4 digit seven segment display 0-F. For human eyes, there is a clock generation module that slows the 100MHz clock down to 190Hz.


# Clock Generation
This module generates a slower clock by implementing a 26 bit counter. The 20th bit (index 19) is used as the output signal clkd so that every time the 20th bit in the counter is true, the "slow" clock is driven to other modules. To see the code click [here](clk_gen.v).

