-- ==============================================================================
-- Testbench: Register n-bit
-- ==============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity register_n_bit_tb is
end entity register_n_bit_tb ;

architecture behave of register_n_bit_tb is
    constant C_WIDTH : natural := 4;

    signal r_CLK, r_RST, r_LOAD : std_logic := '0';
    signal r_D : std_logic_vector(C_WIDTH-1 downto 0) := (others => '0');
    --
    signal w_Q : std_logic_vector(C_WIDTH-1 downto 0);

    begin
        uut: entity work.register_n_bit
        generic map(
            g_width => C_WIDTH)
        port map(
            i_d => r_D,
            i_clk => r_CLK,
            i_rst => r_RST,
            i_load => r_LOAD,
            --
            o_q => w_Q
        );

        p_clk :process 
        begin
            wait for 20 ns;
            r_CLK <= not r_CLK;
        end process p_clk;
        
        p_rst :process 
        begin
            wait for 20 ns;
            r_RST <= '1';
            wait for 20 ns;
            r_RST <= '0';
            wait;
        end process p_rst;

        p_load :process 
        begin
            wait for 20 ns;
            r_LOAD <= '1';
        end process p_load;

        p_data: process
        begin
            r_D <= "0001";
            wait for 20 ns;

            r_D <= "0010";
            wait for 20 ns;

            r_D <= "0011";
            wait for 20 ns;

            r_D <= "0100";
            wait for 20 ns;

            r_D <= "0101";
            wait for 20 ns;

            r_D <= "0110";
            wait for 20 ns;

            r_D <= "0111";
            wait for 20 ns;

            r_D <= "1000";
             wait for 20 ns;

        end process p_data;
    end architecture behave;



