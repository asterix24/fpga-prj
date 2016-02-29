library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;    -- for the unsigned type

entity pwm_tb is
  end pwm_tb;

architecture beh of pwm_tb is
  component pwm
      generic (
                WIDTH : in natural := 8);
      port (
               clk   : in std_logic;
               rst   : out std_logic;
               p   : out std_logic;
               duty : in std_logic_vector(WIDTH-1 downto 0));
  end component;

  signal clk_s: std_logic;
  signal rst_s: std_logic;
  signal out_s: std_logic;
  signal duty_s: std_logic_vector(7 downto 0);

begin
  clk_p: process
  begin
      clk_s <= '1'; wait for 1 us;
      clk_s <= '0'; wait for 1 us;
  end process;

  uut: entity work.pwm port map (clk_s, rst_s, out_s, duty_s);
  process
  begin
      duty_s <= x"7F";
      rst_s <= '1';
      for i in 1 to 10 loop
          wait until rising_edge(clk_s);
      end loop;

      duty_s <= x"7F";
      rst_s <= '0';
      for i in 1 to 512 loop
          wait until rising_edge(clk_s);
      end loop;

      duty_s <= x"0F";
      rst_s <= '0';
      for i in 1 to 512 loop
          wait until rising_edge(clk_s);
      end loop;

      -- Exit
      wait for 100 us;
      assert false
      report "Fine simulazione"
      severity failure;
  end process;

end beh;
