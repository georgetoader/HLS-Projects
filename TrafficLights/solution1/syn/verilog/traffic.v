// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="traffic_traffic,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100t-csg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.934000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=34,HLS_VERSION=2020_2}" *)

module traffic (
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        stg,
        dr,
        sus,
        jos,
        ew,
        ew_ap_vld,
        ns,
        ns_ap_vld
);


input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   stg;
input   dr;
input   sus;
input   jos;
output   ew;
output   ew_ap_vld;
output   ns;
output   ns_ap_vld;

reg ew_ap_vld;
reg ns_ap_vld;

wire   [0:0] ew_rule_1_fu_70_p0;
wire   [0:0] ew_rule_1_fu_70_p1;
wire   [0:0] xor_ln26_fu_76_p0;
wire   [0:0] xor_ln26_fu_76_p1;
wire   [0:0] and_ln40_fu_82_p0;
wire   [0:0] and_ln40_fu_82_p1;
wire   [0:0] and_ln40_fu_82_p2;
wire   [0:0] xor_ln26_fu_76_p2;
wire   [0:0] xor_ln26_1_fu_88_p2;
wire   [0:0] ew_rule_1_fu_70_p2;
wire   [0:0] xor_ln40_fu_100_p2;
wire   [0:0] or_ln55_fu_112_p0;
wire   [0:0] or_ln55_fu_112_p1;
wire   [0:0] ns_rule_4_fu_118_p0;
wire   [0:0] ns_rule_4_fu_118_p1;
wire   [0:0] or_ln55_fu_112_p2;
wire   [0:0] ns_rule_4_fu_118_p2;
wire   [0:0] xor_ln55_fu_124_p2;
wire   [0:0] or_ln55_1_fu_136_p1;
wire   [0:0] or_ln55_1_fu_136_p2;
wire   [0:0] or_ln55_2_fu_142_p1;
wire   [0:0] or_ln55_2_fu_142_p2;
wire   [0:0] ew_rule_5_fu_148_p2;
wire   [0:0] or_ln97_fu_154_p2;
wire   [0:0] ew_rule_2_fu_94_p2;
wire   [0:0] ns_rule_3_fu_106_p2;
wire   [0:0] and_ln55_fu_130_p2;
wire    ap_ce_reg;

always @ (*) begin
    if ((ap_start == 1'b1)) begin
        ew_ap_vld = 1'b1;
    end else begin
        ew_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b1)) begin
        ns_ap_vld = 1'b1;
    end else begin
        ns_ap_vld = 1'b0;
    end
end

assign and_ln40_fu_82_p0 = sus;

assign and_ln40_fu_82_p1 = jos;

assign and_ln40_fu_82_p2 = (and_ln40_fu_82_p1 & and_ln40_fu_82_p0);

assign and_ln55_fu_130_p2 = (xor_ln55_fu_124_p2 & ns_rule_4_fu_118_p2);

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign ew = (or_ln97_fu_154_p2 | ew_rule_2_fu_94_p2);

assign ew_rule_1_fu_70_p0 = stg;

assign ew_rule_1_fu_70_p1 = dr;

assign ew_rule_1_fu_70_p2 = (ew_rule_1_fu_70_p1 & ew_rule_1_fu_70_p0);

assign ew_rule_2_fu_94_p2 = (xor_ln26_fu_76_p2 & xor_ln26_1_fu_88_p2);

assign ew_rule_5_fu_148_p2 = (or_ln55_2_fu_142_p2 ^ 1'd1);

assign ns = (ns_rule_3_fu_106_p2 | and_ln55_fu_130_p2);

assign ns_rule_3_fu_106_p2 = (xor_ln40_fu_100_p2 & and_ln40_fu_82_p2);

assign ns_rule_4_fu_118_p0 = sus;

assign ns_rule_4_fu_118_p1 = jos;

assign ns_rule_4_fu_118_p2 = (ns_rule_4_fu_118_p1 ^ ns_rule_4_fu_118_p0);

assign or_ln55_1_fu_136_p1 = jos;

assign or_ln55_1_fu_136_p2 = (or_ln55_fu_112_p2 | or_ln55_1_fu_136_p1);

assign or_ln55_2_fu_142_p1 = sus;

assign or_ln55_2_fu_142_p2 = (or_ln55_2_fu_142_p1 | or_ln55_1_fu_136_p2);

assign or_ln55_fu_112_p0 = stg;

assign or_ln55_fu_112_p1 = dr;

assign or_ln55_fu_112_p2 = (or_ln55_fu_112_p1 | or_ln55_fu_112_p0);

assign or_ln97_fu_154_p2 = (ew_rule_5_fu_148_p2 | ew_rule_1_fu_70_p2);

assign xor_ln26_1_fu_88_p2 = (1'd1 ^ and_ln40_fu_82_p2);

assign xor_ln26_fu_76_p0 = stg;

assign xor_ln26_fu_76_p1 = dr;

assign xor_ln26_fu_76_p2 = (xor_ln26_fu_76_p1 ^ xor_ln26_fu_76_p0);

assign xor_ln40_fu_100_p2 = (ew_rule_1_fu_70_p2 ^ 1'd1);

assign xor_ln55_fu_124_p2 = (or_ln55_fu_112_p2 ^ 1'd1);

endmodule //traffic
