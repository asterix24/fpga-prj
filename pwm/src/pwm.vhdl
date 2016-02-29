library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;    -- for the unsigned type

entity pwm is
  generic (
            WIDTH : in natural := 8);
  port (
         clk  : in std_logic;
         rst  : in std_logic;
         p    : out std_logic;
         duty : in std_logic_vector(WIDTH-1 downto 0));
end entity pwm;

architecture beh of pwm is
  signal cnt: unsigned(WIDTH-1 downto 0);
begin
  process (clk, duty) is
  begin
    if rst = '1' then
      p <= '0';
      cnt <= (others => '0');
    elsif rising_edge(clk) then
      if cnt < x"FF" then
        if cnt < unsigned(duty) then
          p <= '1';
        else
          p <= '0';
        end if;
        cnt <= cnt + 1;
      else
        p <= '0';
        cnt <= (others => '0');
      end if;
    end if;
  end process;
end architecture beh;


