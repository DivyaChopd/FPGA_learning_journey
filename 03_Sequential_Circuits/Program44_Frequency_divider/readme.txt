Frequency Divider
It is used for the creation of the low-frequency clocks. 
To decrease the frequency of a digital waveform - counter is used. Here we have used MOD counter. 

For ex. we have input frequency as 14 MHz and we need output frequency as 1MHz then we need divider as 14Mhz/1Mhz = 14. Therefore we need /14.

Here we have given MOD state as 7 which means counter will count from 0 to 6. 
We have out port called clk_out which is our frequency divider here. So it will be 0 from 1st run of clock and then 1 for another run of clk and so on. In this way we have create divider 14 (7+7).

---------------------------------------------------------------------------------
NOTES
---------------------------------------------------------------------------------

Divider = Input frequency / output frequency

or 

Divider = 2 * (MAX + 1)