-- =========================================================================
-- Module: N-bit ALU
-- Inputs: i_input1(n), i_input2(n), i_opcode(4), i_carry
-- Outputs: o_result(n),o_carry,o_overflow
-- =========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_n_bit is
    generic (
         c_width : natural 
    );

    port(
        i_input1 : in std_logic_vector(c_width-1 downto 0);
        i_input2 : in std_logic_vector(c_width-1 downto 0);
        i_carry : in std_logic;
        i_opcode : in std_logic_vector(3 downto 0);
        --
        o_result : out std_logic_vector(c_width-1 downto 0);
        o_carry : out std_logic;
        o_overflow : out std_logic
        );
end entity ALU_n_bit;

architecture rtl of ALU_n_bit is
    begin
        process(i_input1,i_input2,i_opcode,i_carry)

        variable v_a : unsigned(c_width-1 downto 0);
        variable v_b : unsigned(c_width-1 downto 0);
        variable v_result : unsigned(c_width downto 0);
    begin    
        o_result <= (others =>'0');
        o_carry <= '0';
        o_overflow <= '0';

        v_a := unsigned(i_input1);
        v_b := unsigned(i_input2);
        v_result := (others =>'0');

                case i_opcode is
                    when "0000" => o_result <= not i_input1;
                    when "0001" => o_result <= not i_input2;
                    when "0010" => o_result <= i_input1 and i_input2;
                    when "0011" => o_result <= i_input1 or i_input2;
                    --
                    when "0100" => o_result <= i_input1 nand i_input2;
                    when "0101" => o_result <= i_input1 nor i_input2;
                    when "0110" => o_result <= i_input1 xor i_input2;
                    when "0111" => o_result <= i_input1 xnor i_input2;
                    --
                    when "1000" => o_result <= i_input1;
                    when "1001" => o_result <= i_input2;
                    --
                    when "1010" => 
                                v_result := ('0' & v_a) +1;
                                o_result <= std_logic_vector(v_result(c_width-1 downto 0));
                                o_carry <= v_result(c_width);

                    when "1011" =>
                                v_result := ('0' & v_b) +1;
                                o_result <= std_logic_vector(v_result(c_width-1 downto 0));
                                o_carry <= v_result(c_width);

                    when "1100" =>
                                v_result := ('0' & v_a) -1;
                                o_result <= std_logic_vector(v_result(c_width-1 downto 0));
                                o_carry <= v_result(c_width);

                    when "1101" =>
                                v_result := ('0' & v_b) -1;
                                o_result <= std_logic_vector(v_result(c_width-1 downto 0));
                                o_carry <= v_result(c_width);

                    when "1110" =>
                                v_result := ('0' & v_a) + ('0' & v_b);
                                o_result <= std_logic_vector(v_result(c_width-1 downto 0));
                                o_carry <= v_result(c_width);

                                if(i_input1(c_width-1)=i_input2(c_width-1)) and
                                    (i_input1(c_width-1) /= std_logic(v_result(c_width-1))) then
                                        o_overflow <='1';
                                    end if;

                    when "1111" =>
                                    if i_carry ='1'then
                                v_result := ('0' & v_a) + ('0' & v_b) +1;
                                else
                                v_result := ('0' & v_a) + ('0' & v_b); 
                                end if;

                                o_result <= std_logic_vector(v_result(c_width-1 downto 0));
                                o_carry <= v_result(c_width);

                                if(i_input1(c_width-1)=i_input2(c_width-1)) and
                                    (i_input1(c_width-1) /= std_logic(v_result(c_width-1))) then
                                        o_overflow <='1';
                                    end if;


		            when others => 
                        o_result <= (others => '0');
                        o_carry <= '0';
                        o_overflow <='0';
                end case;

            end process;
        end architecture rtl;


