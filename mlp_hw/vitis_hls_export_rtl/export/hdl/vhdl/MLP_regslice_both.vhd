-- ==============================================================
-- Generated by Vitis HLS v2024.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================
-- 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MLP_regslice_both is
    generic (
        DataWidth   : INTEGER := 8);
    port (
        -- system signals
        ap_clk      : in  STD_LOGIC;
        ap_rst      : in  STD_LOGIC;
        -- slave side
        data_in     : in  STD_LOGIC_VECTOR(DataWidth-1 downto 0);
        vld_in      : in  STD_LOGIC;
        ack_in      : out STD_LOGIC;
        -- master side
        data_out    : out STD_LOGIC_VECTOR(DataWidth-1 downto 0);
        vld_out     : out STD_LOGIC;
        ack_out     : in  STD_LOGIC;
        apdone_blk  : out STD_LOGIC);
end entity MLP_regslice_both;

architecture behave of MLP_regslice_both is
    constant ZERO                     : UNSIGNED(1 downto 0) := "10";
    constant ONE                      : UNSIGNED(1 downto 0) := "11";
    constant TWO                      : UNSIGNED(1 downto 0) := "01";
    signal   data_p1                  : STD_LOGIC_VECTOR(DataWidth-1 downto 0);
    signal   data_p2                  : STD_LOGIC_VECTOR(DataWidth-1 downto 0);
    signal   load_p1                  : STD_LOGIC;
    signal   load_p2                  : STD_LOGIC;
    signal   load_p1_from_p2          : STD_LOGIC;
    signal   ack_in_t                 : STD_LOGIC;
    signal   state                    : UNSIGNED(1 downto 0);
    signal   next_st                  : UNSIGNED(1 downto 0);
begin
    ack_in <= ack_in_t;
    data_out <= data_p1;
    vld_out <= state(0);
    apdone_blk <= '1' when (state = ONE and ack_out = '0') or (state = TWO)
                  else '0';

    load_p1 <= '1' when (state = ZERO and vld_in = '1') or
                        (state = ONE  and vld_in = '1' and ack_out = '1') or
                        (state = TWO  and ack_out = '1')
               else '0';

    load_p2         <= vld_in and ack_in_t;
    load_p1_from_p2 <= '1' when state = TWO else '0';

    data_p1_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (load_p1 = '1') then
                if (load_p1_from_p2 = '1') then
                    data_p1 <= data_p2;
                else
                    data_p1 <= data_in;
                end if;
            end if;
        end if;
    end process;

    data_p2_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (load_p2 = '1') then
                data_p2 <= data_in;
            end if;
        end if;
    end process;

    ack_in_t_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (ap_rst = '1') then
                ack_in_t <= '0';
            elsif (state = ZERO) then
                ack_in_t <= '1';
            elsif (state = ONE and next_st = TWO) then
                ack_in_t <= '0';
            elsif (state = TWO and next_st = ONE) then
                ack_in_t <= '1';
            end if;
        end if;
    end process;

    state_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (ap_rst = '1') then
                state <= ZERO;
            else
                state <= next_st;
            end if;
        end if;
    end process;

    next_st_proc : process (state, vld_in, ack_in_t, ack_out)
    begin
        case state is
            when ZERO =>
                if (vld_in = '1' and ack_in_t = '1') then
                    next_st <= ONE;
                else
                    next_st <= ZERO;
                end if;
            when ONE =>
                if (vld_in = '0' and ack_out = '1') then
                    next_st <= ZERO;
                elsif (vld_in = '1' and ack_out = '0') then
                    next_st <= TWO;
                else
                    next_st <= ONE;
                end if;
            when TWO =>
                if (ack_out = '1') then
                    next_st <= ONE;
                else
                    next_st <= TWO;
                end if;
            when others =>
                next_st <= ZERO;
        end case;
    end process;

end architecture behave;