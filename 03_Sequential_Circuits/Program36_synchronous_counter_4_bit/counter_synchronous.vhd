-- ======================================================================================
-- Module:Synchronous Counter
-- Inputs: clk, rst
-- Outputs: dout
-- ======================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_sync is
    port(
        clk,rst: in std_logic;
        dout: out std_logic_vector(3 downto 0)
    );
end entity counter_sync;

architecture rtl of counter_sync is
    signal count : unsigned(3 downto 0) :=(others => '0');
    begin
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                count <= "0000" ;
                 else
                 count <= count + 1;
                end if;
            end if;
        end process;
        dout <= std_logic_vector(count);
    end architecture rtl;

