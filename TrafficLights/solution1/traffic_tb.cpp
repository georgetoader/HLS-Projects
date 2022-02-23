#include "traffic_tb.h"
#include <iostream>

int main() {
	int status = 0;
	bool stg, dr, sus, jos, ew[16], ns[16];
	bool ew_golden[16] = {1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1};
	bool ns_golden[16] = {0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0};

	int k = 0;
	for (int istg = 0; istg < 2; istg++) {
		for (int idr = 0; idr < 2; idr++) {
			for (int isus = 0; isus < 2; isus++) {
				for (int ijos = 0; ijos < 2; ijos++) {

					stg = (bool) istg;
					dr = (bool) idr;
					sus = (bool) isus;
					jos = (bool) ijos;

					traffic(stg, dr, sus, jos, &ew[k], &ns[k]);
					k++;
				}
			}
		}
	}

	for (int i = 0; i < 16; i++) {
		if ((ew[i] != ew_golden[i]) || (ns[i] != ns_golden[i])) {
			std::cout << "Eroare la " << i << " ew[ " << ew[i] << " ] si ns[ " << ns[i] << " ]" << std::endl;
			status = 1;
			break;
		} else {
			std::cout << "Data la " << i << " ew[ " << ew[i] << " ] si ns[ " << ns[i] << " ]" << std::endl;
		}
	}

	if (status == 0)
		std::cout<<"CORECT"<<std::endl;
	else
		std::cout<<"GRESIT"<<std::endl;

	return status;
}
