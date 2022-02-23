-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity home_alarm is
port (
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    switches : IN STD_LOGIC_VECTOR (15 downto 0);
    sg_data : OUT STD_LOGIC_VECTOR (7 downto 0);
    sg_data_ap_vld : OUT STD_LOGIC;
    sg_enable : OUT STD_LOGIC_VECTOR (3 downto 0);
    sg_enable_ap_vld : OUT STD_LOGIC );
end;


architecture behav of home_alarm is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "home_alarm_home_alarm,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100t-csg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.226500,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=142,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv4_B : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv8_B0 : STD_LOGIC_VECTOR (7 downto 0) := "10110000";
    constant ap_const_lv8_92 : STD_LOGIC_VECTOR (7 downto 0) := "10010010";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv8_A4 : STD_LOGIC_VECTOR (7 downto 0) := "10100100";
    constant ap_const_lv8_F9 : STD_LOGIC_VECTOR (7 downto 0) := "11111001";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv8_C0 : STD_LOGIC_VECTOR (7 downto 0) := "11000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal icmp_ln870_fu_122_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal switch_code_fu_112_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal window_sensors_V_fu_86_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal motion_sensors_V_fu_94_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln5_fu_90_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_146_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_2_fu_160_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln874_1_fu_134_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln874_fu_128_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln874_fu_184_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln874_fu_190_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_s_fu_140_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln819_fu_204_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln874_fu_196_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_1_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln874_1_fu_218_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln819_fu_224_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln819_1_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln20_fu_168_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln819_fu_210_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln874_1_fu_244_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln20_1_fu_176_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln819_2_fu_252_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln819_3_fu_260_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_fu_104_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_4_fu_278_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln819_1_fu_236_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln819_fu_268_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal p_Result_3_fu_272_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp79_fu_302_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln874_1_fu_314_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln874_2_fu_320_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln874_3_fu_334_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln874_4_fu_340_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln874_2_fu_326_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal sel_tmp39_fu_308_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln29_fu_286_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln874_3_fu_346_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln874_4_fu_363_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln29_1_fu_294_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln874_5_fu_371_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal sg_enable_new_1_fu_379_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ce_reg : STD_LOGIC;


begin



    and_ln819_1_fu_230_p2 <= (p_Result_s_fu_140_p2 and and_ln819_fu_224_p2);
    and_ln819_fu_224_p2 <= (xor_ln874_1_fu_218_p2 and p_Result_1_fu_154_p2);
    and_ln874_1_fu_314_p2 <= (icmp_ln874_fu_128_p2 and icmp_ln874_1_fu_134_p2);
    and_ln874_2_fu_320_p2 <= (icmp_ln870_fu_122_p2 and and_ln874_1_fu_314_p2);
    and_ln874_3_fu_334_p2 <= (xor_ln874_1_fu_218_p2 and icmp_ln874_1_fu_134_p2);
    and_ln874_4_fu_340_p2 <= (icmp_ln870_fu_122_p2 and and_ln874_3_fu_334_p2);
    and_ln874_fu_190_p2 <= (xor_ln874_fu_184_p2 and icmp_ln874_fu_128_p2);
    ap_done <= ap_start;
    ap_idle <= ap_const_logic_1;
    ap_ready <= ap_start;
    icmp_ln870_fu_122_p2 <= "1" when (switch_code_fu_112_p4 = ap_const_lv4_B) else "0";
    icmp_ln874_1_fu_134_p2 <= "1" when (motion_sensors_V_fu_94_p4 = ap_const_lv2_0) else "0";
    icmp_ln874_fu_128_p2 <= "1" when (window_sensors_V_fu_86_p1 = ap_const_lv3_0) else "0";
    motion_sensors_V_fu_94_p4 <= switches(7 downto 6);
    or_ln819_fu_204_p2 <= (p_Result_s_fu_140_p2 or icmp_ln874_fu_128_p2);
    p_Result_1_fu_154_p2 <= (tmp_1_fu_146_p3 xor ap_const_lv1_1);
    p_Result_2_fu_160_p3 <= switches(2 downto 2);
    p_Result_3_fu_272_p2 <= (tmp_fu_104_p3 xor ap_const_lv1_1);
    p_Result_4_fu_278_p3 <= switches(7 downto 7);
    p_Result_s_fu_140_p2 <= (trunc_ln5_fu_90_p1 xor ap_const_lv1_1);
    sel_tmp39_fu_308_p2 <= (tmp79_fu_302_p2 and icmp_ln870_fu_122_p2);
    select_ln20_1_fu_176_p3 <= 
        ap_const_lv2_2 when (p_Result_2_fu_160_p3(0) = '1') else 
        ap_const_lv2_0;
    select_ln20_fu_168_p3 <= 
        ap_const_lv8_B0 when (p_Result_2_fu_160_p3(0) = '1') else 
        ap_const_lv8_92;
    select_ln29_1_fu_294_p3 <= 
        ap_const_lv3_5 when (p_Result_4_fu_278_p3(0) = '1') else 
        sext_ln819_fu_268_p1;
    select_ln29_fu_286_p3 <= 
        ap_const_lv8_A4 when (p_Result_4_fu_278_p3(0) = '1') else 
        select_ln819_1_fu_236_p3;
    select_ln819_1_fu_236_p3 <= 
        select_ln20_fu_168_p3 when (and_ln819_1_fu_230_p2(0) = '1') else 
        select_ln819_fu_210_p3;
    select_ln819_2_fu_252_p3 <= 
        select_ln874_1_fu_244_p3 when (or_ln819_fu_204_p2(0) = '1') else 
        ap_const_lv2_2;
    select_ln819_3_fu_260_p3 <= 
        select_ln20_1_fu_176_p3 when (and_ln819_1_fu_230_p2(0) = '1') else 
        select_ln819_2_fu_252_p3;
    select_ln819_fu_210_p3 <= 
        select_ln874_fu_196_p3 when (or_ln819_fu_204_p2(0) = '1') else 
        ap_const_lv8_F9;
    select_ln874_1_fu_244_p3 <= 
        ap_const_lv2_0 when (and_ln874_fu_190_p2(0) = '1') else 
        ap_const_lv2_2;
    select_ln874_2_fu_326_p3 <= 
        ap_const_lv8_C0 when (and_ln874_2_fu_320_p2(0) = '1') else 
        ap_const_lv8_F9;
    select_ln874_3_fu_346_p3 <= 
        select_ln819_1_fu_236_p3 when (and_ln874_4_fu_340_p2(0) = '1') else 
        select_ln874_2_fu_326_p3;
    select_ln874_4_fu_363_p3 <= 
        ap_const_lv3_0 when (and_ln874_2_fu_320_p2(0) = '1') else 
        ap_const_lv3_5;
    select_ln874_5_fu_371_p3 <= 
        sext_ln819_fu_268_p1 when (and_ln874_4_fu_340_p2(0) = '1') else 
        select_ln874_4_fu_363_p3;
    select_ln874_fu_196_p3 <= 
        ap_const_lv8_92 when (and_ln874_fu_190_p2(0) = '1') else 
        ap_const_lv8_A4;
        sext_ln819_fu_268_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(select_ln819_3_fu_260_p3),3));

    sg_data <= 
        select_ln29_fu_286_p3 when (sel_tmp39_fu_308_p2(0) = '1') else 
        select_ln874_3_fu_346_p3;

    sg_data_ap_vld_assign_proc : process(ap_start, icmp_ln870_fu_122_p2)
    begin
        if (((ap_start = ap_const_logic_1) and (icmp_ln870_fu_122_p2 = ap_const_lv1_1))) then 
            sg_data_ap_vld <= ap_const_logic_1;
        else 
            sg_data_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

        sg_enable <= std_logic_vector(IEEE.numeric_std.resize(signed(sg_enable_new_1_fu_379_p3),4));


    sg_enable_ap_vld_assign_proc : process(ap_start, icmp_ln870_fu_122_p2)
    begin
        if (((ap_start = ap_const_logic_1) and (icmp_ln870_fu_122_p2 = ap_const_lv1_1))) then 
            sg_enable_ap_vld <= ap_const_logic_1;
        else 
            sg_enable_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    sg_enable_new_1_fu_379_p3 <= 
        select_ln29_1_fu_294_p3 when (sel_tmp39_fu_308_p2(0) = '1') else 
        select_ln874_5_fu_371_p3;
    switch_code_fu_112_p4 <= switches(15 downto 12);
    tmp79_fu_302_p2 <= (xor_ln874_fu_184_p2 and p_Result_3_fu_272_p2);
    tmp_1_fu_146_p3 <= switches(1 downto 1);
    tmp_fu_104_p3 <= switches(6 downto 6);
    trunc_ln5_fu_90_p1 <= switches(1 - 1 downto 0);
    window_sensors_V_fu_86_p1 <= switches(3 - 1 downto 0);
    xor_ln874_1_fu_218_p2 <= (icmp_ln874_fu_128_p2 xor ap_const_lv1_1);
    xor_ln874_fu_184_p2 <= (icmp_ln874_1_fu_134_p2 xor ap_const_lv1_1);
end behav;