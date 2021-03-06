library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.Types.all;

entity FF_w_synch_reset is
        port (
        Rst : in  bit1;
        Clk      : in  bit1;
        --
        Input    : in  bit1;
        Output   : out bit1
        );

end entity;

architecture rtl of FF_w_synch_reset is
  signal FF_D : bit1;
  signal FF_Q : bit1;
begin
  FF_D_Assign : FF_D <= Input;

  synch_reset : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if Rst = '1' then
        FF_Q <= '0';
      else
        FF_Q <= FF_D;
      end if;
    end if;
  end process;

  Output_Assign : Output <= FF_Q;
end architecture rtl;
