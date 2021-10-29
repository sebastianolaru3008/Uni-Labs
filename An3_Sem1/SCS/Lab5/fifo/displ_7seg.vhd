LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY displ_7seg IS
    PORT (
        clk, rst : IN STD_LOGIC;
        data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        sseg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END displ_7seg;

ARCHITECTURE Behavioral OF displ_7seg IS
    COMPONENT hex2sseg IS
        PORT (
            hex : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            led : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
    END COMPONENT hex2sseg;

    SIGNAL ledsel : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL cntdiv : STD_LOGIC_VECTOR (10 DOWNTO 0);
    SIGNAL segdata : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            cntdiv <= (OTHERS => '0');
        ELSIF (clk'event AND clk = '1') THEN
            cntdiv <= cntdiv + 1;
        END IF;
    END PROCESS;

    ledsel <= cntdiv(10 DOWNTO 9);

    an <= "1110" WHEN ledsel = "00" ELSE
        "1101" WHEN ledsel = "01" ELSE
        "1011" WHEN ledsel = "10" ELSE
        "0111" WHEN ledsel = "11";

    segdata <= data (3 DOWNTO 0) WHEN ledsel = "00" ELSE
        data (7 DOWNTO 4) WHEN ledsel = "01" ELSE
        data (11 DOWNTO 8) WHEN ledsel = "10" ELSE
        data (15 DOWNTO 12) WHEN ledsel = "11";

    hex2sseg_u : hex2sseg
    PORT MAP(hex => segdata, led => sseg);

END Behavioral;