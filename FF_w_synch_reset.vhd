library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.Types.all;

entity FF_w_synch_reset is
        port (
        AsyncRst : in  bit1;
        Clk      : in  bit1;
        --
        Input    : in  bit1;
        Output   : out bit1;
        --
        Rst_N    : out bit1
        );
end entity;

architecture rtl of FF_w_synch_reset is
  signal FF_D : bit1;
  signal FF_Q : bit1;
begin
  synch_reset : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if AsyncRst = '1' then
        FF_D <= '0';
      else
        FF_D <= Input;
      end if;
    end if;
  end process;

  OutputAssign : Output <= FF_D;
end architecture rtl;
