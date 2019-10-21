// Influenzmaschiene

// Modules from Other
use<InFluMa_Star.scad>
use<InFluMa_Star_Drive.scad>
use<InFluMa_disc.scad>
use<InFluMa_Holes.scad>
use<InFluMa_drive.scad>
use<InFluMa_Eaqualizer.scad>
use<InFluMa_Crank.scad>
use<InFluMa_Frame.scad>

// Frame		====================================
HoWshr=1;		//		Distance between Rotating and non rotating Parts,
				//		is a Whascher put on the threded rod that will be the axis
BaseX=15;		// Thickness of the Plywood
BaseY=450;		// Dimension Y
BaseZ=300;		// Dimension Z

SiPnl_Top=50;	// Dimension at the top of SidePanel Part is a Section cut of a Cylinder
SiPnl_Base=150;	// Dimension at the base of SidePanel Part is a Section cut of a Cylinder
HoSiPnl=300;		// Height of the sidepanel
SiPnl=15;		// Thickness of the Plywood of Sidepanel

//SP=15;
//SP_Top=50;
//SP_Base=150;
//HoSP=400;


// Equalizer	====================================
HoBarEQR=10;	// Heiht of Barrel of Equalizer
HoBeam=5;		// Heigt of Eqalizer of EqualizerBeam
Clear_EQR=2;	// Clearance Eaqualizer vs Disc

// Bearing		====================================
HoBearFit=7;	//Height of Bearing
DoBearFit=22;	//Diameter of Bearing

// Belt Drive	====================================
DoBltDrf=3;			// Diameter of the Belt that drives the Disc 
					// (Crosssection, not the length)
DoDD=120;   		// Diameter of Drive Disc
HoDD=DoBltDrf*3/2;	// Height of Drive Disc
HoBarDD=12;			// Height of Barrel of Disc Drive
DoBarDD=20;			// Diameter of Barel of Disc Drive

// Crank		====================================


// Star Atach	====================================
HoDAS=15;   						// Height of DiscAttachStar Value should be smaler than 46mm
DoDAS=DoBearFit*6;					// Diameter of DiscAttachStar   AHDC*1.6
NoA=6;								// Number of Arms
HoBar=22;							// Height of Barrel that becomes atatched
									// at the DiscAttachStar in Z-Axis (HoDAS)
DoBar1=(DoBearFit+DoBltDrf/2)*1.5;	//diameter Barrel Input
DoBar2=(DoBearFit+DoBltDrf/2)*1.5;	//diameter Barrel 


// Bohrungen	====================================
DACO=8;     	//Diameter Axis Cut Out
DACO_Drive=DACO;// Diameter Axis Cut Out Dirve
DScDAS=3;		//Diameter Screw Disc Attach Star
AHDC=100;		//Diameter of Holes of attach Screws

// Charge Disc	====================================
DoChrgDscX=300;		// Diameter of Disc
DoChrgDscY=300;		// Diameter of Disc
HoChrgDscZ=5;			// Thicknes of Disc

HoChrgDscZPosZ=HoChrgDscZ;	// 

//// El5
whith_y=DoChrgDscY-DoChrgDscY*0.25;

// =====================================================================
// Frame Position								========================
// =====================================================================

// Position of Devices in the Whole konstruction (Absolut xyz)

MntSpce=HoWshr+HoChrgDscZ+HoDAS+HoBar+HoWshr+HoBarEQR+HoWshr;
												// 		Mount Space between Frame
												// 		Adds up on the z-dimension of all
												//		parts.

HoBarDD1=HoChrgDscZ+HoDAS+HoBar/2-HoDD;				// first Barrel of Disc Drive
												// from the Origin source
HoBarDD2=MntSpce-HoBarDD1-2*HoDD-2*HoWshr;		// Second Barrel that matches up to Frame

echo("MntSpce",MntSpce);
echo("HoWshr",HoWshr);
echo("HoChrgDscZ",HoChrgDscZ);
echo("HoDAS",HoDAS);
echo("HoBar",HoBar);
echo("HoBarEQR",HoBarEQR);
echo("HoBarDD1",HoBarDD1);												// to the frame
echo("HoBarDD2",HoBarDD2);
echo("HoDD",HoDD);

echo("HoSiPnl",HoSiPnl);


blaFoo=HoChrgDscZ+HoDAS+HoBar-HoDD/2;					// Testing



// Crank 			-Pos-====================================
Spacing1=10;									// 		Spacing between Drive Axis and Disc (X-Axis)

// Input (Input ==> Krank, Output Rotating Discs )
// The Parts on the Rotating Discs determine the dimension of the Space
// between the Frame.
// Therfore the Dimensions of the input parts are set.
// The Drive_Disc (*_DD) is asymetrical

BDoutpPosX=0;									// 
BDoutpPosY=0;									//
BDoutpPosZ=HoBar/2+HoDAS;//-HoDD/2;//HoBar/2+HoDAS; // 
												// 		[X-Shift]
BDinpPosX=DoChrgDscX/2+DoBar1/2+Spacing1;				// Shifts position of the Crankaxis
BDinpPosY=0;									// 
BDinpPosZ=HoBar/2+HoDAS;						// Position of Belt in Z-Axis


CrPosX=BDinpPosX;								// 
CrPosY=0;										// 
CrPosZ=BDinpPosZ+HoBar+35;						// 


// Star Atach 		-Pos-==================================== 
StarPosZ=HoChrgDscZ;									// Disc Height

// Drive Input		-Pos-====================================
// MntSpce/2-DoBltDrf/2;

// =====================================================================
// Helping Parameters								====================
// =====================================================================

MFN=15; 												// Main Faccette Number
$fn=15;

// =====================================================================
// Testing 											====================
// =====================================================================

//a();
//b();
//Cut_Test(0,0,0);

// =====================================================================
// Stageing											====================
// =====================================================================

//~~Belt_Drive_InPut(BDinpPosX,BDinpPosY,BDinpPosZ/*HoBarDD1*/,DoDD+230,DoBltDrf); // for Alignment testing


rotate([0,90,0]) {
	Assambly ();
	}
	
module Assambly (){
	Frame_Assambly ();
	translate([0,0,HoWshr]){
		Disc_Assambly ();
	}
	translate([0,0,HoWshr]){
		Disc_Drive_Assembly();
		Crank_Output();
	}
}
module Disc_Drive_Assembly(){
	Crank_Assembly();
}
module Frame_Assambly (){
		translate([-(DoBar1),0,HoWshr+HoChrgDscZ+HoDAS+HoBar+HoWshr+HoBarEQR+HoWshr]){
		Frame(SiPnl,SiPnl_Top,SiPnl_Base,HoSiPnl,2*MntSpce);
	}
	translate ([HoSiPnl-DoBar1,0,0]){
		Base_Plate(SiPnl,MntSpce);
	}
}
module Disc_Assambly (){
	difference(){
		//disc(DoChrgDscX,DoChrgDscY,HoChrgDscZ);
		AxisCutOut(0,0,0,DACO);
		translate([0,0,HoChrgDscZ]){		// Schifts Scew rest over Disc
			AttachScrews(NoA,AHDC);
		}
	}
	translate([0,0,HoWshr]){
		Star_Arms();
		Equalizer();
		Charge_Divider_Disc();
		//b();
		//Drive_Inp();
	}
	/*translate([0,0,-HoWshr]){
		mirror([0,0,1]){
			Star_Arms();
			Equalizer();
			Charge_Divider_Disc()
			Drive_Inp();
		}
	}*/
}
module Star_Arms(){
	difference (){
		union(){
			translate([0,0,HoChrgDscZ]){
				Star(NoA,HoDAS,DoDAS,HoBar,DoBar1,DoBar2);	// Star	
			}
		}
		translate([0,0,HoChrgDscZ+HoDAS/2]){
					AttachScrews(NoA,AHDC);	//InFluMa_Holes.scad 	
		}
		translate([0,0,HoChrgDscZ+HoDAS+HoBar/2]){
			#Belt_Drive_OutPut(DoBar1,DoBltDrf);
		}
		//Cut_Test(200,100,600);	// For Checking the inner assembly
		//Detach_Help ();	// Provides an edge to detach the pece of the Heatbed
		AxisCutOut(0,0,0,DACO);
	}
}
module Equalizer(){
	translate([0,0,HoChrgDscZ+HoDAS+HoBar+HoWshr]){
		difference(){
			Arm_EQR(whith_y,HoBarEQR,DoBar1);		// Eaqualizer Arm
			AxisCutOut(0,0,0,DACO);
		}
	Beam_EQR (DoBar1,whith_y,HoBeam,HoDAS,HoBar,Clear_EQR);
	Beam_EQR (DoBar1,whith_y,HoBeam);
	}
}

module Charge_Divider_Disc(){
	difference(){
		color( c = [0.1,0.1,0.8], alpha = 0.28 ) {
			disc(DoChrgDscX,DoChrgDscY,HoChrgDscZ);
		}
		AxisCutOut(0,0,0,DACO);
		translate([0,0,HoChrgDscZ]){		// Schifts Scew rest over Disc
			AttachScrews(NoA,AHDC);
		}
	}
}

module Cut_Test(x,y,z){
	translate([0,y/2,0]){
		cube([x,y,z],center=true);
	}
}

//Drive_Inp();


module Disc_Drive_Assembly(){
	translate([0,0,0]){
		difference(){
			union(){
				translate ([BDinpPosX,0,HoChrgDscZ+HoDAS+HoBar/2]){
					mirror([0,0,1]){
						Star_Dri(NoA,HoDD,HoBarDD1,DoDD,DoBarDD,BDinpPosZ);
						translate ([0,0,+(HoChrgDscZ+HoDAS+HoBar/2)]){
							//cylinder(h=HoDD/2,d1=21.1,d2=21.1,center=false);
						}
					}
				}
				translate([BDinpPosX,BDinpPosY,HoChrgDscZ+HoDAS+HoBar/2/*BDinpPosZ*/]){
					echo(HoBarDD2);
					Star_Dri(NoA,HoDD,HoBarDD2,DoDD,DoBarDD,BDinpPosZ);
				}
				
			}
			#AxisCutOut(BDinpPosX,BDinpPosY,BDinpPosZ,DACO_Drive);
			translate ([0,0,HoChrgDscZ+HoDAS+HoBar/2]){
				Belt_Drive_InPut(BDinpPosX,BDinpPosY,BDinpPosZ-BDinpPosZ,DoDD,DoBltDrf);
				#Belt_Drive_InPut(BDinpPosX,BDinpPosY,BDinpPosZ-BDinpPosZ,DoDD+220,DoBltDrf);
				
			}
		}
	}
}
module Crank_Output(){
	translate([CrPosX,CrPosY,CrPosZ]){
					Crank ();
	}
}
module Detach_Help (){
	translate([62,0,0]){
		rotate([0,-45,0]){
			cube([50,20,10],center=true);
		}
	}
}