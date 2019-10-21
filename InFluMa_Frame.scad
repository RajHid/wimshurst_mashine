SiPnl_Top=50;	// Dimension at the top
SiPnl_Base=150;	// Dimension at the base
HoSiPnl=200;		// Height of the sidepanel
SiPnl=15;		// Thickness of the Plywood


BaseX=15;		// Thickness of the Plywood
BaseY=450;		// Dimension Y
BaseZ=300;		// Dimension Z

MntSpce=200;	//Mount Space Frame =HoWshr+HoDZ+HoDAS+HoBar+HoWshr+HoBarEQR+HoWshr

//=================================================
Frame(SiPnl,SiPnl_Top,SiPnl_Base,HoSiPnl,MntSpce);

//Frame();
module Frame(SiPnl,SiPnl_Top,SiPnl_Base,HoSiPnl,MntSpce){
	translate([0,0,SiPnl/2]){
		Wall(SiPnl_Top,SiPnl_Base,HoSiPnl);
	}
	translate([0,0,-MntSpce-SiPnl/2]){
		Wall(SiPnl_Top,SiPnl_Base,HoSiPnl);
	}
	translate([HoSiPnl,0,0]){
	//Base_Plate(SiPnl,MntSpce);
	}
}

//Wall();
module Wall (SiPnl_Top,SiPnl_Base,HoSiPnl,MntSpce){
	linear_extrude(height = SiPnl, center = true, convexity = 10, scale = 1.0, $fn = 16){
		projection(cut=true){
			rotate([0,90,0]){
				cylinder(h=HoSiPnl, d1=SiPnl_Top, d2= SiPnl_Base,center=false);
			}
		}
	}
}

//Base ();
module Base_Plate (SiPnl,MntSpce){	
	cube([BaseX,BaseY,2*(MntSpce+SiPnl)],center=true);
}