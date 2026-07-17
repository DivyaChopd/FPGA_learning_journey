-- ==========================================================================
-- Module: 4-bit Asynchronous counter or ripple counter
-- Inputs: 2-> clk,d
-- Outputs: q
-- ==========================================================================
library ieee;
use ieee.std_logic_1164.all;

entity asynchronous_counter is
    port(
        clk : in std_logic;
        count : out std_logic_vector(3 downto 0)
    );
end entity asynchronous_counter;

architecture rtl of asynchronous_counter is
    signal q: std_logic_vector(3 downto 0) := "0000";

    begin

        process(clk)
        begin
            if rising_edge(clk) then
                q(0) <= not q(0);
            end if;
        end process;

        process(q(0))
        begin
            if rising_edge(q(0)) then
                q(1) <= not q(1);
            end if;
        end process;

        process(q(1))
        begin
            if rising_edge(q(1)) then
                q(2) <= not q(2);
            end if;
        end process;

        process(q(2))
        begin
            if rising_edge(q(2)) then
                q(3) <= not q(3);
            end if;
        end process;

        count <= q;
    end architecture rtl;
            
        
            



