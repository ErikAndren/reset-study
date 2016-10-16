library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.Types.all;

entity Top is
  port (
    AsyncRst : in  bit1;
    Clk      : in  bit1;
    --
    Input    : in  bit1;
    Output   : out word(2-1 downto 0)
    );
end entity;

architecture rtl of Top is
  signal Rst_N, Rst : bit1;
begin
  ResetSync : entity work.ResetSync
    port map (
      AsyncRst => AsyncRst,
      Clk      => Clk,
      --
      Rst_N    => Rst_N
    );

  RstAssign : Rst <= not Rst_N;

  FF_sync : entity work.FF_w_synch_reset
    port map (
      Rst    => Rst,
      Clk    => Clk,
      --
      Input  => Input,
      Output => Output(0)
    );

  FF_async : entity work.FF_w_asynch_reset
    port map (
      Rst    => Rst,
      Clk    => Clk,
      --
      Input  => Input,
      Output => Output(1)
    );
end architecture rtl;
