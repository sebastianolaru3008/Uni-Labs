LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY debounce_filter IS
    PORT (
        d_in : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        q_out : OUT STD_LOGIC);
END debounce_filter;

ARCHITECTURE Behavioral OF debounce_filter IS

    --  Provides a one-shot pulse from a non-clock input, with reset
    --**Insert the following between the 'architecture' and
    ---'begin' keywords**
    SIGNAL Q1, Q2, Q3 : STD_LOGIC;

BEGIN

    --**Insert the following after the 'begin' keyword**
    PROCESS (clk)
    BEGIN
        IF (clk'event AND clk = '1') THEN
            IF (rst = '1') THEN
                Q1 <= '0';
                Q2 <= '0';
                Q3 <= '0';
            ELSE
                Q1 <= D_IN;
                Q2 <= Q1;
                Q3 <= Q2;
            END IF;
        END IF;
    END PROCESS;

    Q_OUT <= Q1 AND Q2 AND (NOT Q3);

END Behavioral;