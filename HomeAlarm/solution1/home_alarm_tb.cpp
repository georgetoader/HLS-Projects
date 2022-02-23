#include "home_alarm_tb.h"
#include <iostream>

void home_alarm_tb(
		ap_uint<16> switches,
		ap_uint<8>  &sg_data,
		ap_uint<4>  &sg_enable) {

	if (switches.range(15, 12) == 0b1011) {
		if (switches.range(2, 0) == 0b000 && switches.range(7, 6) == 0b00) {
			// nu sunt probleme cu senzorii
			sg_data = seven_sg_code[0];
			sg_enable = 0b0000;
		} else {
			// exista o problema
			if (switches[0]) {
				sg_data = seven_sg_code[1];
				sg_enable = 0b1110;
			}
			if (switches[1]) {
				sg_data = seven_sg_code[2];
				sg_enable = 0b1110;
			}
			if (switches[2]) {
				sg_data = seven_sg_code[3];
				sg_enable = 0b1110;
			}
			if (switches[6]) {
				sg_data = seven_sg_code[1];
				sg_enable = 0b1101;
			}
			if (switches[7]) {
				sg_data = seven_sg_code[2];
				sg_enable = 0b1101;
			}
		}
	}
}

int main() {

	int status = 0;
	ap_uint<3> window_sensors;
	ap_uint<2> motion_sensors;
	ap_uint<16> switches;
	ap_uint<4>  switch_code;
	ap_uint<8>  sg_data_1;
	ap_uint<4>  sg_enable_1;
	ap_uint<8>  sg_data_2;
	ap_uint<4>  sg_enable_2;

	for (int i = 0; (i < 8) && (status==0); i++) {
		for (int j = 0; (j < 4) && (status==0); j++) {
			for (int k = 0; (k < 16) && (status==0); k++) {
				switch_code = (ap_uint<4>)0b1011;
				for (int l = 0; (l < 32) && (status==0); l++) {
					window_sensors = i;
					motion_sensors = j;
					switches = (switch_code, (ap_int<4>)0, motion_sensors, (ap_int<3>)0, window_sensors);
					home_alarm(switches, sg_data_1, sg_enable_1);
					home_alarm_tb(switches, sg_data_2, sg_enable_2);
					if (sg_data_1 != sg_data_2 || sg_enable_1 != sg_enable_2) {
						status = -1;
						break;
					}
				}
			}
		}
	}

	if (status == 0) {
		std::cout << "SUCCES!" << std::endl;
	} else {
		std::cout << "INSUCCES!" << std::endl;
	}

	return status;
}
