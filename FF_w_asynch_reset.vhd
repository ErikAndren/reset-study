library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.Types.all;

entity FF_w_asynch_reset is
        port (
        Rst : in  bit1;
        Clk      : in  bit1;
        --
        Input    : in  bit1;
        Output   : out bit1;
        --
        Rst_N    : out bit1
        );
end entity;

architecture rtl of FF_w_asynch_reset is
  signal FF_D : bit1;
  signal FF_Q : bit1;
begin
  -- Combinathoric processing goes here
  FF_D_Assign : FF_D <= Input;

  async_reset : process (Clk, Rst)
  begin
    if (Rst = '1') then
      FF_Q <= '0';
    elsif (rising_edge(Clk)) then
      FF_Q <= FF_D;
    end if;
  end process;

  Output_Assign : Output <= FF_Q;
end architecture rtl;
