//Disc Influenzmaschine
use<InFluMa_Holes.scad>

DoDX=300;
DoDY=300;
HoDZ=5;
NumPads=27;

disc(DoDX,DoDY,HoDZ);
module disc(DoDX,DoDY,HoDZ){
Step=360/NumPads;
	translate([0,0,HoDZ/2]){
		color( c = [0.1,0.1,0.8], alpha = 0.28 ) {
			cylinder(h=HoDZ,d1=DoDX,d2=DoDY,center=true, $fn=64);
		}
		translate([0,0,HoDZ]){
			for(i=[0:Step:360]){
				rotate([0,0,i]){
					translate([(DoDX*0.95)/2-35,10,0]){
						Charge_Divider_Pads();
					}
				}
			}
		}
	}
}
module Charge_Divider_Pads(){
	hull(){
	cylinder(h=0.01,d1=10,d2=10,center=true);	
		translate([25,0,0]){
			cylinder(h=0.01,d1=20,d2=20,center=true);	
		}
	}
}