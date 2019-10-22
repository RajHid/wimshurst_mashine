// Lydener Bottle

HoLydBottle=180;
WalloLydBottle=4;
OutDoLydBottle=80;
InDoLydBottle=OutDoLydBottle-2*WalloLydBottle;


LydBottleCapTop=OutDoLydBottle;
HoLydBottleCapTop=7;
LydBottleCapIn=InDoLydBottle;
HoLydBottleCapIn=10;

translate([0,0,(HoLydBottleCapTop+HoLydBottleCapIn)/2+HoLydBottle]){
	Lydener_Bottle_Cap();
}
translate([0,0,HoLydBottle/2]){
	Lydener_Bottle();
}

module Lydener_Bottle(){
	difference(){
		cylinder(h=HoLydBottle,d1=OutDoLydBottle,d2=OutDoLydBottle,center=true);
		cylinder(h=HoLydBottle+0.01,d1=InDoLydBottle,d2=InDoLydBottle,center=true);
	}
}

module Lydener_Bottle_Cap(){
	cylinder(h=HoLydBottleCapIn,d1=LydBottleCapIn,d2=LydBottleCapIn,center=true);
	translate([0,0,HoLydBottleCapIn]){
		cylinder(h=HoLydBottleCapTop,d1=LydBottleCapTop,d2=LydBottleCapTop,center=true);
	}
}