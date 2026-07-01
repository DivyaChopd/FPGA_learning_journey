library ieee;
use ieee.std_logic_1164.all;

entity mux_2_to_1_width is
    generic(
        g_width : integer :=8
    );
    port(
        i_data1 : in std_logic_vector(g_width-1 downto 0) ;
        i_data2 : in std_logic_vector(g_width-1 downto 0) ;
        i_select : in std_logic;

        o_result : out std_logic_vector(g_width-1 downto 0)
    );
end entity mux_2_to_1_width;

    architecture rtl of mux_2_to_1_width is
        begin
        o_result <= i_data1 when i_select = '0' else i_data2;
    end architecture rtl;
