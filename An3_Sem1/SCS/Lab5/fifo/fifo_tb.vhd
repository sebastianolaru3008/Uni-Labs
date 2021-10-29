LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY fifo_tb IS
END fifo_tb;

ARCHITECTURE behavior OF fifo_tb IS

    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT complete_circuit
        PORT (
            data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            btn_rd : IN STD_LOGIC;
            btn_wr : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            sseg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            anode : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            empty : OUT STD_LOGIC;
            full : OUT STD_LOGIC
        );
    END COMPONENT;
    --Inputs
    SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL btn_rd : STD_LOGIC := '0';
    SIGNAL btn_wr : STD_LOGIC := '0';
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst : STD_LOGIC := '0';

    --Outputs
    SIGNAL sseg : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL anode : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL empty : STD_LOGIC;
    SIGNAL full : STD_LOGIC;

    -- Clock period definitions
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : complete_circuit PORT MAP(
        data_in => data_in,
        btn_rd => btn_rd,
        btn_wr => btn_wr,
        clk => clk,
        rst => rst,
        sseg => sseg,
        anode => anode,
        empty => empty,
        full => full
    );

    -- Clock process definitions
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;
    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- hold reset state for 100 ns.
        WAIT FOR 100 ns;

        WAIT FOR clk_period * 10;

        -- insert stimulus here 
        data_in <= "00000001";
        btn_rd <= '1';
        btn_wr <= '0';
        rst <= '0';

        WAIT;
    END PROCESS;

END;