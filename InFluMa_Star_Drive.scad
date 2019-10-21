use<InFluMa_Holes.scad>

// Influenzmaschiene

// Bohrungen ====================================

DACO=8;     //Diameter Axis Cut Out
// DScDAS=3;   //Diameter Screw Disc Attach Star
HoBearFit=7;	//Height of Bearing
DoBearFit=22;	//Diameter of Bearing

// Parameters ====================================

NoA=4;  // Number of Arms
//AbArm=360/NoA;  // Angle between Arms
//a=5;

// Dimensions ====================================

//AHDC=DoBearFit*5; // Atach Hole Diameter Circle
HoDAS=5;   //Height of DiscAttachStar
DoDD=120;   //Diameter of Drive Disc

//DoBltDrf=3;			// Diameter of the Belt that drives the Disc
//HoDD=DoBltDrf*3/2;		// Height of Drive Disc
//HoBarDD=12;			// Height of Barrel of Disc Drive

//HoBar=20;
//DoBar=DoBearFit*1.5;	//Diameter of Barrel

//DoBarDD=DoBearFit*1;		// Diameter of Barel of Disc Drive

// Belt Drive	====================================
DoBltDrf=3;			// Diameter of the Belt that drives the Disc 
					// (Crosssection, not the length)
DoDD=120;   		// Diameter of Drive Disc
HoDD=DoBltDrf*3/2;	// Height of Drive Disc
HoBarDD=12;			// Height of Barrel of Disc Drive
DoBarDD=20;			// Diameter of Barel of Disc Drive

// Helping Parameters ====================================

MFN=12; // Main Faccette Number
Device_Prm=2;	// Parameter to tetermine a Parameter for diferent usecases of the Star module, either it is used in the Mount of the Disk or to Generate a Spokeweel for the Drive.
// ====================================

// Canvas ====================================
Drive_Disc();
module Drive_Disc(){
	union(){
		Star_Dri(NoA,HoDD,HoBarDD,DoDD,DoBarDD);
		mirror([0,0,1]){
			//Star_Dri(NoA,HoDD,HoBarDD,DoDD,DoBarDD);
		//echo(AbArm);
		}
	}
}
// Parts ====================================
module Star_Dri(NoA,HoDD,HoBarDD,DoDD,DoBarDD,BDinpPosZ){
translate([0,0,HoDD/2]){
		union(){
			difference(){    
				union(){
					cylinder(h=HoDD,d1=DoDD,d2=DoDD,center=true,$fn=MFN);
				}
				//~DISABLED_FOR_PERFORMANCE~ArmCutouts_Dri(NoA);
				translate([0,0,HoDD/4]){
				}	
			}
			translate([0,0,HoDD/2+HoBarDD/2]){
				Barrel_Dri(HoBarDD,DoBarDD);
			}
		}
	}
}

// Cut Outs ====================================
module AxisCutOut_Dri(){
    cylinder(h=HoDD*3,d1=DACO,d2=DACO,center=true,$fn=MFN);
}
 module ArmCutouts_Dri(NoA){
	 AbArm=360/NoA;  				// Angle between Arms
         for(i=[0:AbArm:360]){
           rotate([0,0,i+AbArm/2]){
                translate([DoDD/3.5,0,0]){
                    ArmCut_Single_Dri();
                }
             }
         }
     }	      
 module ArmCut_Single_Dri(){
     hull(){
         cylinder(HoDD+0.01,DoDD*0.08,DoDD*0.15,center=true, $fn=MFN);
         translate([DoDD/16,-10,0]){
            cylinder(HoDD+0.01,DoDD/NoA*0.30,DoDD/NoA*0.40,center=true, $fn=MFN);
         }
		 translate([DoDD/16,10,0]){
            cylinder(HoDD+0.01,DoDD/NoA*0.30,DoDD/NoA*0.40,center=true, $fn=MFN);
         }
     }
 }

module ArmCut_Tips_Dri(Device_Prm,Cut_Help){
	if (false){
		difference(){
			cylinder(HoDD+0.01,d1=DoDD*1.1,d2=DoDD*1.1,center=true, $fn=MFN);
			cylinder(HoDD+0.02,d1=DoDD,d2=DoDD-(HoDD-0.02)*2,center=true, $fn=MFN);
		}
	}
	else if (true){
		difference(){
			 cylinder(HoDD+0.01+Cut_Help,d1=DoDD*1.1,d2=DoDD*1.1,center=true, $fn=MFN);
			 cylinder(HoDD+0.02+Cut_Help,d1=DoDD-(HoDD-0.02)*2,d2=DoDD-(HoDD-0.02)*2,center=true, $fn=MFN);
		 }
	}		
}
module ArmCut_Tips_2_Dri(Device_Prm){
     difference(){
         cylinder((HoDD+0.03)/2,d1=DoDD*1.1,d2=DoDD*1.1,center=true, $fn=MFN);
         cylinder((HoDD+0.04)/2,d1=DoDD,d2=DoBar,center=true, $fn=MFN); //D2=> was "DoDD-(HoDAS-0.02)*8+12"
     }
 }
module Barrel_Dri(HoBarDD,DoBarDD){
		cylinder(HoBarDD,d1=DoBarDD,d2=DoBarDD,center=true,$fn=MFN);
}