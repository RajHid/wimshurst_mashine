use<Influenzmaschine_Star.scad>

DoBearFit=22;	//Diameter of Bearing
DoBar=DoBearFit*1.5;

DoBltDrf=3;

#Belt_Drive_Cut(32);

// Position of Beltdrives in the Whole konstruction (Absolut)

BDPosX=0;
BDPosY=0;
BDPosZ=20;

MFN=12;

module Belt_Drive_InPut (BDPosX,BDPosY,BDPosZ,DoBar,DoBltDrf){
	translate([BDPosX,BDPosY,BDPosZ]){
		Belt_Drive_Cut(DoBar,DoBltDrf);
	}
}

module Belt_Drive_OutPut (DoBar,DoBltDrf){
		Belt_Drive_Cut(DoBar,DoBltDrf);
}
module Belt_Drive_Cut(DoBar,DoBltDrf){
		rotate_extrude(angle = 360, convexity = 2,$fn=MFN) {
			translate([DoBar/2,0,0]){
				circle(d=DoBltDrf,$fn=MFN);
		}
	}
}

//Star(5);
