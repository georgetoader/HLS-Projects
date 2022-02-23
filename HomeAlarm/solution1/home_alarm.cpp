#include "home_alarm.h"
#include <iostream>

void check_sensors(
		ap_uint<3> window_sensors,
		ap_uint<2> motion_sensors,
		ap_uint<8> &sg_data,
		ap_uint<4> &sg_enable) {

	sg_data = seven_sg_code[5];
	sg_enable = 0b0000;

	if (window_sensors != 0b000) {
		if (window_sensors[0]) {
			sg_data   = seven_sg_code[1];
			sg_enable = 0b1110;
		} else if (window_sensors[1]) {
			sg_data   = seven_sg_code[2];
			sg_enable = 0b1110;
		} else if (window_sensors[2]) {
			sg_data   = seven_sg_code[3];
			sg_enable = 0b1110;
		}
	}
	if (motion_sensors != 0b00) {
		if (motion_sensors[0]) {
			sg_data   = seven_sg_code[1];
			sg_enable = 0b1101;
		} else if (motion_sensors[1]) {
			sg_data   = seven_sg_code[2];
			sg_enable = 0b1101;
		}
	}
}

void home_alarm(
		ap_uint<16> switches,
		ap_uint<8>  &sg_data,
		ap_uint<4>  &sg_enable) {

#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=slide_switches
#pragma HLS INTERFACE mode=ap_none port=sg_data
#pragma HLS INTERFACE mode=ap_none port=sg_enable

	ap_uint<3> window_sensors = switches.range(2, 0);
	ap_uint<2> motion_sensors = switches.range(7, 6);
	ap_uint<4> switch_code = switches.range(15, 12);

	if (switch_code == 0b1011) {	// alarma se activeaza pe 1011, range 15-12
		sg_data = seven_sg_code[0];  // afiseaza O de la OPEN
		sg_enable = 0b0000;
		if ((window_sensors != 0b000) || (motion_sensors != 0b00)) {	// verificare ca nu sunt probleme
			check_sensors(window_sensors, motion_sensors, sg_data, sg_enable);
		}
	}

}
