LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY full_adder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        c : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        carry : OUT STD_LOGIC);
END full_adder;

ARCHITECTURE Behavioral OF full_adder IS

BEGIN

    sum <= (a XOR b XOR c);
    carry <= (a AND b) XOR (c AND (a XOR b));

END Behavioral;