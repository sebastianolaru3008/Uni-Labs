
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY wallace IS
    PORT (
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        prod : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END wallace;

ARCHITECTURE Behavioral OF wallace IS

    COMPONENT full_adder IS
        PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            c : IN STD_LOGIC;
            sum : OUT STD_LOGIC;
            carry : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT half_adder IS
        PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            sum : OUT STD_LOGIC;
            carry : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL s11, s12, s13, s14, s15, s22, s23, s24, s25, s26, s32, s33, s34, s35, s36, s37 : STD_LOGIC;
    SIGNAL c11, c12, c13, c14, c15, c22, c23, c24, c25, c26, c32, c33, c34, c35, c36, c37 : STD_LOGIC;
    SIGNAL p0, p1, p2, p3 : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN

    PROCESS (A, B)
    BEGIN
        FOR i IN 0 TO 3 LOOP
            p0(i) <= A(i) AND B(0);
            p1(i) <= A(i) AND B(1);
            p2(i) <= A(i) AND B(2);
            p3(i) <= A(i) AND B(3);
        END LOOP;
    END PROCESS;

    prod(0) <= p0(0);
    prod(1) <= s11;
    prod(2) <= s22;
    prod(3) <= s32;
    prod(4) <= s34;
    prod(5) <= s35;
    prod(6) <= s36;
    prod(7) <= s37;

    --first stage
    ha11 : half_adder PORT MAP(p0(1), p1(0), s11, c11);
    fa12 : full_adder PORT MAP(p0(2), p1(1), p2(0), s12, c12);
    fa13 : full_adder PORT MAP(p0(3), p1(2), p2(1), s13, c13);
    fa14 : full_adder PORT MAP(p1(3), p2(2), p3(1), s14, c14);
    ha15 : half_adder PORT MAP(p2(3), p3(2), s15, c15);

    --second stage
    ha22 : half_adder PORT MAP(c11, s12, s22, c22);
    fa23 : full_adder PORT MAP(p3(0), c12, s13, s23, c23);
    fa24 : full_adder PORT MAP(c13, c32, s14, s24, c24);
    fa25 : full_adder PORT MAP(c14, c24, s15, s25, c25);
    fa26 : full_adder PORT MAP(c15, c25, p3(3), s26, c26);

    --third stage
    ha32 : half_adder PORT MAP(c22, s23, s32, c32);
    ha34 : half_adder PORT MAP(c23, s24, s34, c34);
    ha35 : half_adder PORT MAP(c34, s25, s35, c35);
    ha36 : half_adder PORT MAP(c35, s26, s36, c36);
    ha37 : half_adder PORT MAP(c36, c26, s37, c37);

END Behavioral;