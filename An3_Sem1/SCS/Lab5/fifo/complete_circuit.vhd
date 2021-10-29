LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY complete_circuit IS
    PORT (
        data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        btn_rd : IN STD_LOGIC;
        btn_wr : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        sseg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        empty : OUT STD_LOGIC;
        full : OUT STD_LOGIC);
END complete_circuit;

ARCHITECTURE Behavioral OF complete_circuit IS

    COMPONENT debounce_filter IS
        PORT (
            d_in : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            q_out : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT fifo_ctrl IS
        PORT (
            rd : IN STD_LOGIC;
            wr : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            rd_inc : OUT STD_LOGIC;
            wr_inc : OUT STD_LOGIC;
            empty : OUT STD_LOGIC;
            full : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT fifo_8x8 IS
        PORT (
            data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            rd : IN STD_LOGIC;
            wr : IN STD_LOGIC;
            rd_inc : IN STD_LOGIC;
            wr_inc : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT displ_7seg IS
        PORT (
            clk, rst : IN STD_LOGIC;
            data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            sseg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
            an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    ---
    COMPONENT SegDisp IS
        PORT (
            clk : IN STD_LOGIC;
            CAT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            AN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Digit0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Digit1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Digit2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Digit3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    ---

    SIGNAL rd : STD_LOGIC;
    SIGNAL wr : STD_LOGIC;
    SIGNAL rd_inc : STD_LOGIC;
    SIGNAL wr_inc : STD_LOGIC;
    SIGNAL data_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_out_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL an_output_displ_7seg : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL LED_output_hex2sseg : STD_LOGIC_VECTOR (6 DOWNTO 0);

BEGIN

    PART1_1 : debounce_filter PORT MAP(btn_rd, clk, rst, rd);
    PART1_2 : debounce_filter PORT MAP(btn_wr, clk, rst, wr);
    PART2 : fifo_ctrl PORT MAP(rd, wr, clk, rst, rd_inc, wr_inc, empty, full);
    PART3 : fifo_8x8 PORT MAP(data_in, rd, wr, rd_inc, wr_inc, clk, rst, data_out);

    data_out_2 <= data_in & data_out; -- data_in & data_out == data(15:8) & data(7:0)

    PART4 : SegDisp PORT MAP(
        clk => clk,
        CAT => sseg,
        AN => anode,
        Digit0 => data_out_2(3 DOWNTO 0),
        Digit1 => data_out_2(7 DOWNTO 4),
        Digit2 => data_out_2(11 DOWNTO 8),
        Digit3 => data_out_2(15 DOWNTO 12));

END Behavioral;