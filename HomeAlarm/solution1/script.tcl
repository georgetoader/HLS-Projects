############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project HomeAlarm
set_top home_alarm
add_files HomeAlarm/solution1/home_alarm.h
add_files HomeAlarm/solution1/home_alarm.cpp
add_files -tb HomeAlarm/solution1/home_alarm_tb.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb HomeAlarm/solution1/home_alarm_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7a100t-csg324-1}
create_clock -period 10 -name default
#source "./HomeAlarm/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
