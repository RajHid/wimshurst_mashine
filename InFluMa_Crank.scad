
DoCrBase=35;
DoCrTip=20;
HoCr=7.5;

LENoCr=100;	// Lenght of Crank Center to Center Cylinder

NoHol=2;

$fn=12;

Crank();
module Crank (){
	difference(){
		hull(){
			cylinder(h=HoCr,d1=DoCrBase,d2=DoCrBase,center=true);
			translate([LENoCr,0,0]){
				cylinder(h=HoCr,d1=DoCrTip,d2=DoCrTip,center=true);
			}
		}
		Crank_Arm_Cut();
	}
	translate([LENoCr,0,0]){
		cylinder(h=60,d1=DoCrTip-DoCrTip*0.1,d2=DoCrTip-DoCrTip*0.1);
	}
}


#Crank_Arm_Cut();	
module Crank_Arm_Cut(){
	step=LENoCr-DoCrBase/2-DoCrTip/2;
	echo(step);
	translate([DoCrBase/2,0,0]){
		for(i=[0:1:NoHol-1]){
		//for(i=[DoCrBase/2:LENoCr/NoHol:LENoCr]){
			translate([step/NoHol*i,0,0]){
				scale([1,1,1]){	
					//echo(i);
					echo(i);
					echo(LENoCr/NoHol);
					//cylinder(h=HoCr+0.01,d1=DoCrBase/2,d2=DoCrBase/2);
					hull(){
						cylinder(h=HoCr+0.01,d1=(DoCrBase/2)/(i+1),d2=(DoCrBase/2)/(i+1),center=true);
						translate([(LENoCr-DoCrBase/2-DoCrTip/2)/NoHol-20,0,0]){ 
							cylinder(h=HoCr+0.01,d1=(DoCrTip/2)/(i+1),d2=(DoCrTip/2)/(i+1),center=true);
						}
					}
				}
			}
		}
	}
}

//LENoCr-DoCrBase/2-DoCrTip/2
//step/NoHol-DoCrBase/2