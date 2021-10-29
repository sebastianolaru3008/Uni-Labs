LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY fifo_8x8 IS
    PORT (
        data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        rd : IN STD_LOGIC;
        wr : IN STD_LOGIC;
        rd_inc : IN STD_LOGIC;
        wr_inc : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END fifo_8x8;

ARCHITECTURE Behavioral OF fifo_8x8 IS

    SIGNAL wrptr : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL rdptr : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL RES_decoder : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL EN_register : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Q_register0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MUX_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    write_pointer : PROCESS (clk) BEGIN
        IF (rising_edge(clk) AND rst = '0') THEN
            IF (wr_inc = '1') THEN
                wrptr <= wr & "00";
            END IF;
        END IF;
    END PROCESS;
    read_pointer : PROCESS BEGIN
        IF (rising_edge(clk) AND rst = '0') THEN
            IF (rd_inc = '1') THEN
                rdptr <= rd & "00";
            END IF;
        END IF;
    END PROCESS;
    decoder : PROCESS (wrptr) BEGIN
        CASE wrptr IS
            WHEN "000" => RES_decoder <= "00000001";
            WHEN "001" => RES_decoder <= "00000010";
            WHEN "010" => RES_decoder <= "00000100";
            WHEN "011" => RES_decoder <= "00001000";
            WHEN "100" => RES_decoder <= "00010000";
            WHEN "101" => RES_decoder <= "00100000";
            WHEN "110" => RES_decoder <= "01000000";
            WHEN OTHERS => RES_decoder <= "10000000";
        END CASE;
    END PROCESS;
    register_set : PROCESS (clk) BEGIN

        FOR i IN 7 DOWNTO 0 LOOP
            EN_register(i) <= wr AND RES_decoder(i);
            IF rising_edge(clk) THEN
                IF EN_register(i) = '1' THEN
                    IF (i = 7) THEN
                        Q_register7 <= data_in;
                    ELSIF (i = 6) THEN
                        Q_register6 <= data_in;
                    ELSIF (i = 5) THEN
                        Q_register5 <= data_in;
                    ELSIF (i = 4) THEN
                        Q_register4 <= data_in;
                    ELSIF (i = 3) THEN
                        Q_register3 <= data_in;
                    ELSIF (i = 2) THEN
                        Q_register2 <= data_in;
                    ELSIF (i = 1) THEN
                        Q_register1 <= data_in;
                    ELSIF (i = 0) THEN
                        Q_register0 <= data_in;
                    END IF;
                END IF;
            END IF;
        END LOOP;

    END PROCESS;
    multiplexer : PROCESS (rdptr, Q_register0, Q_register1, Q_register2, Q_register3, Q_register4, Q_register5, Q_register6, Q_register7) BEGIN
        -- 'rdptr' is the SELECT signal for the MUX
        CASE rdptr IS
            WHEN "000" => MUX_out <= Q_register7;
            WHEN "001" => MUX_out <= Q_register6;
            WHEN "010" => MUX_out <= Q_register5;
            WHEN "011" => MUX_out <= Q_register4;
            WHEN "100" => MUX_out <= Q_register3;
            WHEN "101" => MUX_out <= Q_register2;
            WHEN "110" => MUX_out <= Q_register1;
            WHEN "111" => MUX_out <= Q_register0;
            WHEN OTHERS => MUX_out <= Q_register7;
        END CASE;
    END PROCESS;
    tri_state_buffer : PROCESS BEGIN
        IF (rd = '1') THEN
            data_out <= MUX_out;
        ELSE
            data_out <= "ZZZZZZZZ"; -- the High Impedance state
        END IF;
    END PROCESS;

END Behavioral;