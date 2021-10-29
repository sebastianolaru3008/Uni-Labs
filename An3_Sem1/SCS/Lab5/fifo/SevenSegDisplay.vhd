LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SegDisp IS
    PORT (
        clk : IN STD_LOGIC;
        CAT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        AN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Digit0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Digit1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Digit2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Digit3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END SegDisp;

ARCHITECTURE Behavioral OF SegDisp IS
    SIGNAL Digit : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Q : STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
BEGIN

    WITH Digit SELECT
        Cat <= "1111001" WHEN "0001", --1
        "0100100" WHEN "0010", --2
        "0110000" WHEN "0011", --3
        "0011001" WHEN "0100", --4
        "0010010" WHEN "0101", --5
        "0000010" WHEN "0110", --6
        "1111000" WHEN "0111", --7
        "0000000" WHEN "1000", --8
        "0010000" WHEN "1001", --9
        "0001000" WHEN "1010", --A
        "0000011" WHEN "1011", --b
        "1000110" WHEN "1100", --C
        "0100001" WHEN "1101", --d
        "0000110" WHEN "1110", --E
        "0001110" WHEN "1111", --F
        "1000000" WHEN OTHERS; --0

    CNTER : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            Q <= Q + '1';
        END IF;
    END PROCESS;

    MUXes : PROCESS (Q(15 DOWNTO 14), Digit0, Digit1, Digit2, Digit3)
    BEGIN
        CASE Q(15 DOWNTO 14) IS
            WHEN "00" => Digit <= Digit0;
                AN <= "1110";
            WHEN "01" => Digit <= Digit1;
                AN <= "1101";
            WHEN "10" => Digit <= Digit2;
                AN <= "1011";
            WHEN OTHERS => Digit <= Digit3;
                AN <= "0111";
        END CASE;
    END PROCESS;

END Behavioral;