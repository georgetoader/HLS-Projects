#pragma once
#include "home_alarm.h"

void home_alarm(
		ap_uint<16> switches,
		ap_uint<8>  &sg_data,
		ap_uint<4>  &sg_enable);

