use <InFluMa_Holes.scad>


HoDAS=15;	//Height of DiscAttachStar
HoBar=20;	// Height of Barrel that becomes atatched at the DiscAttachStar in Z-Axis (HoDAS)

whith_y=250;	//
DoBar=35;
HoBarEQR=25;		// Heiht of Barrel Equalizerg

Beam_x=DoBar*2/3;
//Beam_y=150;
HoBeam=5;			// Heigt of Eqalizer Beam

Clear_EQR=12;		// Clearance Eaqualizer vs Disc
// Clearance Eaqualizer vs Disc



Arm_EQR(whith_y,HoBarEQR,DoBar);



module Arm_EQR(whith_y,HoBarEQR,DoBar){
	difference(){
		union(){		
			cylinder(h=HoBarEQR,d1=DoBar,d2=DoBar,center=false);
		}
		translate([0,0,0]){
				Beam_EQR(DoBar,whith_y,HoBeam,HoDAS,HoBar,Clear_EQR);
			}
		AxisCutOut(0,0,0,8);
	}
		//Beam_EQR(DoBar,whith_y,HoBeam);
}

Beam_EQR(DoBar,whith_y,HoBeam,HoDAS,HoBar,Clear_EQR);

module Beam_EQR(DoBar,whith_y,HoBeam,HoDAS,HoBar,Clear_EQR){
	union(){
		difference(){
			translate([0,0,HoBeam/2]){
			cube([2*DoBar/3,whith_y-HoDAS-HoBar+Clear_EQR*2,HoBeam],center=true);
			}
			AxisCutOut(0,0,0,8);
		}
		translate([-2*DoBar/6,whith_y/2-(HoDAS+HoBar)/2+Clear_EQR,-HoBar-HoDAS+Clear_EQR]){
			rotate([90,0,90]){
				Elbow_EQR(2*DoBar/3,HoBeam,HoBar+HoDAS-Clear_EQR);
			}
		}
		translate([2*DoBar/6,-whith_y/2+(HoDAS+HoBar)/2-Clear_EQR,-HoBar-HoDAS+Clear_EQR]){
			rotate([90,0,-90]){
				Elbow_EQR(2*DoBar/3,HoBeam,HoBar+HoDAS-Clear_EQR);
			}
		}
	}
}



module Elbow_EQR(DoBar_Elbow,HoBeam,RAD_EQR){
	intersection(){
		rotate_extrude(convexity = 10){
			translate([RAD_EQR, 0, 0])
				square([HoBeam,DoBar_Elbow],center=false);
			}
		cube(100);
	}
}
/*
rotate_extrude(angle=90, convexity=2){
	translate([2*DoBar+55,0,0]){
		rotate([0,0,0]){
			#square([100,3],center=true);
		}
	}
}

#square([20,5],center=true);

translate([0,0,-20]){
//resize([2,4,5]){ cube();
//}
}
*/