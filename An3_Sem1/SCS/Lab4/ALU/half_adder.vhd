
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY half_adder IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        sum : OUT STD_LOGIC;
        carry : OUT STD_LOGIC);
END half_adder;

ARCHITECTURE Behavioral OF half_adder IS

BEGIN

    sum <= a XOR b;
    carry <= a AND b;

END Behavioral;