/*use<InFluMa_Holes.scad>

// Influenzmaschiene

// Bohrungen ====================================

DACO=8;     	//Diameter Axis Cut Out
DScDAS=3;   	//Diameter Screw Disc Attach Star
HoBearFit=7;	//Height of Bearing
DoBearFit=22;	//Diameter of Bearing

// Parameters ====================================

NoA=5;  // Number of Arms
//AbArm=360/NoA;  // Angle between Arms
//a=5;

// Dimensions ====================================

AHDC=DoBearFit*5; 		// Atach Hole Diameter Circle
HoDAS=25;   			//Height of DiscAttachStar
DoDD=120;
//DoDAS=DoBearFit*6;   	//Diameter of DiscAttachStar   AHDC*1.6 //of DiscAttachStar
HoBar=12;				//Height of Barrel 


DoBltDrf=9;		// Diameter of the Belt that drives the Disc

DoBar1=(DoBearFit+DoBltDrf/2)*1.5;	//diameter Barrel
DoBar2=(DoBearFit+DoBltDrf/2)*1.5;	//diameter Barrel
/*
DoBar1=DoBearFit*1.5;
DoBar2=DoBearFit*1.5;



echo(HoBar);
echo(DoBar1);
echo(DoBar2);


// Helping Parameters ====================================

MFN=12; // Main Faccette Number
Device_Prm=2;	// Parameter to tetermine a Parameter for diferent usecases of the Star module, either it is used in the Mount of the Disk or to Generate a Spokeweel for the Drive.
// ====================================

// Canvas ====================================

Star(NoA,HoDAS,DoDD,HoBar,DoBar1,DoBar2);

// Testing ====================================
/*
difference(){
//ArmCut_Tips_2(Device_Prm);
//Star(NoA,Device_Prm);
	translate([-50,-5,-50]){
		cube([200,10,200],center=true);
	//}
	//echo(AbArm);
	}
}
translate([10,-5,0]){
cube(HoDAS);
}


// Parts ====================================
*/

// Influenzmaschiene

// Modules
//use<Influenzmaschine_Star.scad>
//use<Influenzmaschine_Star_Drive.scad>
//use<disc.scad>
use<InFluMa_Holes.scad>
//use<InFluMa_drive.scad>
//use<InFluMa_Eaqualizer.scad>
//use<InFluMa_Crank.scad>
//use<InFluMa_Frame.scad>

// Frame		====================================
BaseX=15;		// Thickness of the Plywood
BaseY=450;		// Dimension Y
BaseZ=300;		// Dimension Z

// Equalizer	====================================
HoBarEQR=10;	// Heiht of Barrel of Equalizer
HoBeam=5;		// Heigt of Eqalizer of EqualizerBeam
Clear_EQR=2;	// Clearance Eaqualizer vs Disc

// Bearing		====================================
HoBearFit=7;	//Height of Bearing
DoBearFit=22;	//Diameter of Bearing

// Belt Drive	====================================
DoBltDrf=3;		// Diameter of the Belt that drives the Disc
DoBar1=(DoBearFit+DoBltDrf/2)*1.5;	//diameter Barrel
DoBar2=(DoBearFit+DoBltDrf/2)*1.5;	//diameter Barrel
DoDD=120;   	//Diameter of Drive Disc
HoBar=12;		// Height of Barrel that becomes atatched at the DiscAttachStar in Z-Axis (HoDAS)

// Crank		====================================


// Star Atach	====================================
HoDAS=15;   	// Height of DiscAttachStar Value should be smaler than 46mm
DoDAS=DoBearFit*6;	//Diameter of DiscAttachStar   AHDC*1.6
NoA=5;			// Number of Arms

// Bohrungen	====================================
DACO=8;     	//Diameter Axis Cut Out
DACO_Drive=DACO;// Diameter Axis Cut Out Dirve
DScDAS=3;		//Diameter Screw Disc Attach Star
AHDC=100;		//Diameter of Holes of attach Screws

// Disc			====================================
DoDX=300;			// Diameter of Disc
DoDY=300;			// Diameter of Disc
HoDZ=5;			// Thicknes of Disc
HoDZPosZ=HoDZ;		// 

//// El5
whith_y=DoDY-DoDY*0.25;

// =====================================================================
// Frame Position								========================
// =====================================================================

// Position of Devices in the Whole konstruction (Absolut xyz)

MntSpce=HoWshr+HoDZ+HoDAS+HoBar+HoWshr+HoBarEQR+HoWshr;
												// 		Mount Space between Frame
												// 		Adds up on the z-dimension of all
												//		parts.
												
HoWshr=1;										//		Distance between Rotating and non
												//		rotating Parts, is a Whascher put on
												//		the threded rod that will be the axis

// Crank 			-Pos-====================================
Spacing1=10;									// 		Spacing between Drive Axis and Disc
												// 		[X-Shift]
BDinpPosX=DoDX/2+DoBar1/2+Spacing1;				// Shifts position of the Crankaxis
BDinpPosY=0;									// 
BDinpPosZ=HoBar/2+HoDAS;						// Position of Belt

BDoutpPosX=0;									// 
BDoutpPosY=0;									//
BDoutpPosZ=HoBar/2+HoDAS;						// 

CrPosX=BDinpPosX;								// 
CrPosY=0;										// 
CrPosZ=BDinpPosZ+HoBar+35;						// 


// Star Atach 		-Pos-==================================== 
StarPosZ=HoDZ;									// Disc Height


// =====================================================================
// Helping Parameters								====================
// =====================================================================

MFN=12; 												// Main Faccette Number
$fn=12;

// =====================================================================
// Testing 											====================
// =====================================================================

//a();
//b();
//Cut_Test(0,0,0);

// =====================================================================
// Stageing											====================
// =====================================================================

Star(NoA,HoDAS,DoDAS,HoBar,DoBar1,DoBar2);


module Star(NoA,HoDAS,DoDAS,HoBar,DoBar1,DoBar2){
translate([0,0,HoDAS/2]){
		union(){
			difference(){    
				cylinder(h=HoDAS,d1=DoDD,d2=DoDD,center=true,$fn=MFN);
				translate([0,0,-HoDAS/2+HoBearFit/2]){
					BearCut();
				}
				AxisCutOut();//
				//AttachScrews(NoA,AHDC); //derived from InFluMa_Holes
				
				//~DISABLED_FOR_PERFORMANCE~ArmCutouts(NoA);
				ArmCut_Tips(DoDAS,DoBar1,DoBar2);
				translate([0,0,HoDAS/4]){
					ArmCut_Tips_2(DoBar1,DoBar2,HoDAS);
				}	
			}
			translate([0,0,HoDAS/2+HoBar/2]){
				Barrel(HoBar,DoBar1,DoBar2);
			}
		}
	}
}

// Cut Outs ====================================
module AxisCutOut(){
    cylinder(h=HoDAS*3,d1=DACO,d2=DACO,center=true,$fn=MFN);
}
module ArmCutouts(NoA){
AbArm=360/NoA;  // Angle between Arms
	for(i=[0:AbArm:360]){
		rotate([0,0,i+AbArm/2]){
			translate([DoBearFit*2,0,0]){
				ArmCut_Single();
			}
		}
	}
} 
 module ArmCut_Single(){
     hull(){
         cylinder(HoDAS+0.01,DoDAS*0.1,DoDAS*0.15,center=true, $fn=MFN);
         translate([DoDAS*0.1,-20,0]){
            cylinder(HoDAS+0.01,DoDAS/NoA*0.35,DoDAS/NoA*0.65,center=true, $fn=MFN);
         }
		 translate([DoDAS*0.1,20,0]){
            cylinder(HoDAS+0.01,DoDAS/NoA*0.35,DoDAS/NoA*0.65,center=true, $fn=MFN);
         }
	}
}
module ArmCut_Tips(DoDAS,DoBar1,DoBar2){
	if (true){
		difference(){
			cylinder(HoDAS+0.01/2,d1=DoDAS*1.1,d2=DoDAS*1.1,center=true, $fn=MFN);
			cylinder(HoDAS+0.02/2,d1=DoDAS-(DoDAS*0.1),d2=DoDAS-(DoDAS*0.2),center=true, $fn=MFN); 
		}
	}		
}
translate([0,0,30]){
difference(){
	//ArmCut_Tips_2();
	//cube(100);
	}
}
module ArmCut_Tips_2(DoBar1,DoBar2,HoDAS){
	difference(){
		cylinder((HoDAS+0.01)/2,d1=DoDD*1.1,d2=DoDD*1.1,center=true, $fn=MFN);
		cylinder((HoDAS+0.01)/2,d1=DoDD,d2=DoBar1,center=true, $fn=MFN);
	}
}
 module BearCut(){
	 difference(){
		 cylinder(HoBearFit+0.01,d1=DoBearFit,d2=DoBearFit,center=true, $fn=MFN);
		 AxisCutOut();
	 }
}
module Barrel(HoBar,DoBar1,DoBar2){
	difference(){
		cylinder(HoBar,d1=DoBar1,d2=DoBar2,center=true,$fn=MFN);
		translate([0,0,HoBar/2-HoBearFit/2]){
			BearCut();
			AxisCutOut();
		}
	}
}