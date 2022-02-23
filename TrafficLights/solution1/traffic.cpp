/*
 * EW : green
 * NS : red
 */
bool rule_1(
		bool  stg,
		bool  dr,
		bool  sus,
		bool  jos) {

	return (stg && dr);
}

/*
 * EW : green
 * NS : red
 */
bool rule_2(
		bool  stg,
		bool  dr,
		bool  sus,
		bool  jos) {

	return (stg ^ dr) && !(sus && jos);
}

/*
 * EW : red
 * NS : green
 */
bool rule_3(
		bool  stg,
		bool  dr,
		bool  sus,
		bool  jos) {

	return !(stg && dr) && (sus && jos);
}


/*
 * EW : red
 * NS : green
 */
bool rule_4(
		bool  stg,
		bool  dr,
		bool  sus,
		bool  jos) {

	return !(stg || dr) && (sus ^ jos) ;
}

/*
 * EW : green
 * NS : red
 */
bool rule_5(
		bool  stg,
		bool  dr,
		bool  sus,
		bool  jos) {

	return !(stg || dr) && !(sus || jos);
}




void traffic(
		bool  stg,
		bool  dr,
		bool  sus,
		bool  jos,
		bool *ew,
		bool *ns) {

#pragma HLS INTERFACE mode=ap_none port=stg
#pragma HLS INTERFACE mode=ap_none port=dr
#pragma HLS INTERFACE mode=ap_none port=sus
#pragma HLS INTERFACE mode=ap_none port=jos
#pragma HLS INTERFACE mode=ap_none port=ew
#pragma HLS INTERFACE mode=ap_none port=ns
#pragma HLS INTERFACE mode=ap_ctrl_none port=return

	bool ew_rule_1 = rule_1(stg, dr, sus, jos);
	bool ew_rule_2 = rule_2(stg, dr, sus, jos);
	bool ns_rule_3 = rule_3(stg, dr, sus, jos);
	bool ns_rule_4 = rule_4(stg, dr, sus, jos);
	bool ew_rule_5 = rule_5(stg, dr, sus, jos);

	*ew = ew_rule_1 || ew_rule_2 ||  ew_rule_5;
	*ns = ns_rule_3 || ns_rule_4;
}
