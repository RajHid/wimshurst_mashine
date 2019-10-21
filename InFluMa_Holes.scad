NoA=3;

// Bohrungen ====================================

DACO=8;     //Diameter Axis Cut Out
DScDAS=3;   //Diameter Screw Disc Attach Star
DScDASHAD=DScDAS*4;// Diameter Screw Head Disc Attach Star
DoBearFit=22;	//Diameter of Bearing

Pos_X=0;
Pos_Y=0;
Pos_Z=0;

// Dimensions ====================================

HoDAS=15;   //Height of DiscAttachStar

AHDC=100; // Atach Hole Diameter Circle

//AxisCutOut();

// Helping Parameters ====================================

MFN=12; // Main Faccette Number

// ====================================

AxisCutOut(Pos_X,Pos_Y,Pos_Z,DACO);
AttachScrews(NoA,AHDC);

module AxisCutOut(Pos_X,Pos_Y,Pos_Z,DACO){
	translate([Pos_X,Pos_Y,Pos_Z]){
		cylinder(h=HoDAS*20,d1=DACO,d2=DACO,center=true,$fn=MFN);
	}
}

module AttachScrews(NoA,AHDC){
AbArm=360/NoA;  // Angle between Arms
     for(i=[0:AbArm:360]){
        rotate([0,0,i]){
            translate([AHDC/2,0,0]){
                cylinder(66,d1=DScDAS,d2=DScDAS,center=true,$fn=MFN);
				AttachScrewsRest();				
/*				translate([0,0,HoDAS/2.3]){
					hull(){
						cylinder(HoDAS,d1=DScDAS*3,d2=DScDAS*3,center=true,$fn=MFN);
						translate([DScDAS*3,0,0]){
							cylinder(HoDAS,d1=DScDAS*3,d2=DScDAS*3,center=true,$fn=MFN);
						}
					}
				}*/
            }
         }
     }
 }
 
module AttachScrewsRest(){
translate([0,0,HoDAS/2]){
	hull(){
		cylinder(HoDAS,d1=DScDASHAD,d2=DScDASHAD,center=true,$fn=MFN);
			translate([DScDAS*3,0,0]){
				cylinder(HoDAS,d1=DScDASHAD,d2=DScDASHAD,center=true,$fn=MFN);
			}
		}
	}
}