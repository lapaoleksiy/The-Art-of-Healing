//TheArtOfHealing.cpp

#include <iostream>
#include <string>

using namespace std;

//Class definitions
class Healing {
	public:
		string type;
		string purpose;
		
		Healing(string t, string p) {
			type = t;
			purpose = p;
		}
		
		void printData() {
			cout << "Type of healing: " << type << endl;
			cout << "Purpose of healing: " << purpose << endl;
		}
};

//Global variables declaration
Healing* allHealings[2000];
int numHealings = 0;

//Function prototypes
void printAllData();
void addHealing(string, string);

int main() {
	
	string t, p;
	
	//Add healings
	addHealing("Energy healing", "Healing physical, mental, and emotional concerns");
	addHealing("Reiki", "Purifying and healing the energy of the body");
	addHealing("Chakra healing", "Balancing energy through the chakras");
	addHealing("Chi healing", "Harnessing life-force energy to heal");
	addHealing("Ayurvedic healing", "Using plants and herbs to heal");
	
	//Print all healings
	printAllData();
	
	return 0;
}

//Print all healings
void printAllData() {
	cout << endl << "List of all healings:" << endl;
	for(int i = 0; i < numHealings; i++) {
		allHealings[i]->printData();
		cout << endl;
	}
}

//Add a Healing with a type and purpose
void addHealing(string t, string p) {
	Healing* newHealing = new Healing(t, p);
	allHealings[numHealings] = newHealing;
	numHealings++;
}