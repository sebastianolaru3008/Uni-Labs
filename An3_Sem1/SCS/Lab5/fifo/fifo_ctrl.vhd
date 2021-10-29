LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY fifo_ctrl IS
    PORT (
        rd : IN STD_LOGIC;
        wr : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        rd_inc : OUT STD_LOGIC;
        wr_inc : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        full : OUT STD_LOGIC);
END fifo_ctrl;

ARCHITECTURE Behavioral OF fifo_ctrl IS

BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk'event AND clk = '1') THEN
            rd_inc <= rd OR '1'; -- RD + 1
            wr_inc <= wr OR '1'; -- WR + 1
        END IF;
    END PROCESS;

END Behavioral;