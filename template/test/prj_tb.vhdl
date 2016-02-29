-- <project> is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
--
-- Copyright 2016 Daniele Basile <asterix24@gmail.com>
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;    -- for the unsigned type

entity <project>_tb is
  end <project>_tb;

architecture beh of <project>_tb is
  component <project>
    port (
         );
  end component;

begin
  -- test here!

  -- Exit
  wait for 100 us;
  assert false
  report "Fine simulazione"
  severity failure;
end process;

end beh;
