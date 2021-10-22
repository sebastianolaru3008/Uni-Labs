LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY carry_lookahead IS
    GENERIC (
        g_width : NATURAL := 3
    );
    PORT (
        x_in : IN STD_LOGIC_VECTOR(g_width DOWNTO 0);
        y_in : IN STD_LOGIC_VECTOR(g_width DOWNTO 0);
        carry_in : IN STD_LOGIC;
        sum : OUT STD_LOGIC_VECTOR(g_width DOWNTO 0);
        carry_out : OUT STD_LOGIC
    );
END carry_lookahead;

ARCHITECTURE behavioral OF carry_lookahead IS

    SIGNAL h_sum : STD_LOGIC_VECTOR(g_width DOWNTO 0);
    SIGNAL carry_generate : STD_LOGIC_VECTOR(g_width DOWNTO 0);
    SIGNAL carry_propagate : STD_LOGIC_VECTOR(g_width DOWNTO 0);
    SIGNAL carry_in_internal : STD_LOGIC_VECTOR(g_width DOWNTO 1);

BEGIN
    h_sum <= x_in XOR y_in;
    carry_generate <= x_in AND y_in;
    carry_propagate <= x_in OR y_in;
    PROCESS (carry_generate, carry_propagate, carry_in_internal)
    BEGIN
        carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND carry_in);
        inst : FOR i IN 1 TO g_width - 1 LOOP
            carry_in_internal(i + 1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
        END LOOP;
        carry_out <= carry_generate(g_width) OR (carry_propagate(g_width) AND carry_in_internal(g_width));
    END PROCESS;

    sum(0) <= h_sum(0) XOR carry_in;
    sum(g_width DOWNTO 1) <= h_sum(g_width DOWNTO 1) XOR carry_in_internal(g_width DOWNTO 1);
END behavioral;