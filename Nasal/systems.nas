####    DHC6 systems    ####
aircraft.livery.init("Aircraft/dhc6/Models/Liveries");
setprop("controls/armament/station[5]/release-all",1);
setprop("controls/armament/station[6]/release-all",0);
var C_volume = props.globals.initNode("sim/sound/cabin",0.3);
var D_volume = props.globals.initNode("sim/sound/doors",0.7);
var E1_volume = props.globals.initNode("sim/sound/engine[0]",0.0);
var E2_volume = props.globals.initNode("sim/sound/engine[1]",0.0);
var stall_volume = props.globals.initNode("sim/sound/stall-warning",0.0);
var hyd_pump_volume = props.globals.initNode("sim/sound/hyd-pump",0.0);
var ctn_counter=0;
Wiper=[];



var mousex =0;
var msx = 0;
var msxa = 0;
var mousey = 0;
var msy = 0;
var msya=0;
var lever_scale = getprop("controls/movement-scale");

var FHmeter = aircraft.timer.new("/instrumentation/clock/flight-meter-sec", 10);

### Set initial custom property ###
props.globals.initNode("controls/electric/aft-boost-pump", 0);
props.globals.initNode("controls/electric/fwd-boost-pump", 0);
props.globals.initNode("controls/engines/engine[0]/condition", 0.0);
props.globals.initNode("controls/engines/engine[1]/condition", 0.0);
props.globals.initNode("controls/engines/internal-engine-starter", 0.0);
props.globals.initNode("controls/electric/power-source",0);
props.globals.initNode("controls/switches/dme", 0);
props.globals.initNode("controls/switches/dme-gps-slave", 0);

###################################

var Startup = func{
	setprop("sim/model/equipment/ground-services/external-power/enable",1);
	setprop("sim/model/equipment/ground-services/fuel-truck/clean",0);
	setprop("sim/model/equipment/ground-services/fuel-truck/transfer",0);
	setprop("sim/model/equipment/ground-services/fuel-truck/connect-aft",0);
	setprop("sim/model/equipment/ground-services/fuel-truck/connect-fwd",0);
	setprop("sim/model/equipment/ground-services/fuel-truck/disconnect",1);
	setprop("sim/model/equipment/ground-services/fuel-truck/enable",0);
    setprop("controls/electric/avionics-switch",1);
    setprop("controls/electric/battery-switch",1);
    setprop("controls/electric/power-source",-1);
    setprop("controls/electric/inverter-switch",1);
    setprop("controls/electric/ammeter-switch",0);
    setprop("controls/lighting/instrument-lights",1);
    setprop("controls/lighting/cabin-lights",1);
    setprop("controls/lighting/beacon",1);
    setprop("controls/electric/aft-boost-pump",1);
    setprop("controls/electric/fwd-boost-pump",1);
    setprop("controls/engines/engine[0]/cutoff",0);
    setprop("controls/engines/engine[1]/cutoff",0);
    setprop("controls/engines/engine[0]/intake-deflector",1);
    setprop("controls/engines/engine[1]/intake-deflector",1);
    setprop("controls/engines/internal-engine-starter",1);
    setprop("controls/engines/engine[0]/throttle",0);
    setprop("controls/engines/engine[1]/throttle",0);
    setprop("controls/anti-ice/pitot-heat",1);
    setprop("controls/anti-ice/prop-heat",1);
    setprop("controls/anti-ice/window-heat",1);
    setprop("sim/model/equipment/left-pitot-cover",0);
    setprop("sim/model/equipment/right-pitot-cover",0);
    setprop("sim/model/equipment/left-tiedown-wheels",0);
    setprop("sim/model/equipment/right-tiedown-wheels",0);
    setprop("sim/model/equipment/rear-tiedown-wheels",0);
    setprop("sim/model/equipment/left-engine-cover",0);
    setprop("sim/model/equipment/right-engine-cover",0);
    setprop("sim/model/equipment/left-chock-fwd",0);
    setprop("sim/model/equipment/left-chock-aft",0);
    setprop("sim/model/equipment/right-chock-fwd",0);
    setprop("sim/model/equipment/right-chock-aft",0);
    screen.log.write("Starting the engines. Please wait...", 1, 1, 1);
    
    var check_loop1 = func {
    
        if (getprop("controls/engines/internal-engine-starter") != 0) {
    
        if (getprop("engines/engine[0]/running") == 0 and getprop("engines/engine[1]/running") == 0) {
        }
        
        if (getprop("engines/engine[0]/n2") > 12.0) {
            setprop("controls/engines/engine[0]/condition",1);
            setprop("controls/engines/engine[0]/mixture",1);
            
        }
    
        if (getprop("engines/engine[0]/running") == 1 and getprop("engines/engine[1]/running") == 0) {
        setprop("controls/engines/internal-engine-starter",-1);
        }    
        if (getprop("engines/engine[1]/n2") > 12.0) {
            setprop("controls/engines/engine[1]/condition",1);
            setprop("controls/engines/engine[1]/mixture",1);
            
        }
        if (getprop("engines/engine[0]/running") == 1 and getprop("engines/engine[1]/running") == 1 and getprop("engines/engine[1]/rpm") > 200) {
			setprop("sim/model/equipment/ground-services/external-power/enable",0);
            setprop("controls/engines/internal-engine-starter",0);
            setprop("controls/electric/ammeter-switch",1);
    		setprop("controls/electric/power-source",1);
            setprop("controls/engines/engine[0]/propeller-pitch",1);
            setprop("controls/engines/engine[1]/propeller-pitch",1);
            setprop("controls/lighting/no-smoking",1);
            setprop("controls/lighting/seat-belt",1);
            setprop("controls/electric/engine[0]/generator",1);
            setprop("controls/electric/engine[1]/generator",1);
            setprop("controls/lighting/landing-light[0]",1);
            setprop("controls/lighting/landing-light[1]",1);
            setprop("controls/lighting/nav-lights",1);
            setprop("controls/lighting/strobe",1);
            setprop("controls/engines/auto-feather",1);
            setprop("controls/flight/flaplever",0.25);
            setprop("controls/flight/flaps",0.25);
            setprop("controls/gear/parkingbrake-lever",0);
            setprop("controls/flight/elevator-trim",-0.2);
            setprop("controls/flight/rudder-trim",0.12);
            screen.log.write("Startup procedure finished. - You are now ready for Take Off!", 1, 1, 1);
        }
        settimer(check_loop1, 1);
        }
    }
    check_loop1();
}

var Shutdown = func{
    setprop("controls/electric/engine[0]/generator",0);
    setprop("controls/electric/engine[1]/generator",0);
    setprop("controls/electric/avionics-switch",0);
    setprop("controls/electric/battery-switch",0);
    setprop("controls/electric/inverter-switch",0);
    setprop("controls/lighting/instrument-lights",0);
    setprop("controls/lighting/nav-lights",0);
    setprop("controls/lighting/beacon",0);
    setprop("controls/lighting/strobe",0);
    setprop("controls/engines/engine[0]/throttle",0);
    setprop("controls/engines/engine[1]/throttle",0);
    setprop("controls/engines/engine[0]/mixture",0);
    setprop("controls/engines/engine[1]/mixture",0);
    setprop("controls/engines/engine[0]/propeller-pitch",0);
    setprop("controls/engines/engine[1]/propeller-pitch",0);
    setprop("controls/engines/engine[0]/condition",0);
    setprop("controls/engines/engine[1]/condition",0);
    setprop("controls/engines/engine[0]/internal-condition",0);
    setprop("controls/engines/engine[1]/internal-condition",0);
    setprop("controls/engines/engine[0]/cutoff",0);
    setprop("controls/engines/engine[1]/cutoff",0);
    setprop("engines/engine[0]/running",0);
    setprop("engines/engine[1]/running",0);
    setprop("controls/electric/aft-boost-pump",0);
    setprop("controls/electric/fwd-boost-pump",0);
    setprop("controls/electric/power-source",0);
    setprop("controls/engines/internal-engine-starter",0);
    setprop("controls/lighting/landing-light[0]",0);
    setprop("controls/lighting/landing-light[1]",0);
    setprop("controls/flight/flaplever",0);
    setprop("controls/flight/flaps",0);
    setprop("controls/gear/parkingbrake-lever",1);
    setprop("controls/engines/engine[0]/intake-deflector",0);
    setprop("controls/engines/engine[1]/intake-deflector",0);
    setprop("controls/lighting/cabin-lights",0);
    setprop("controls/lighting/no-smoking",0);
    setprop("controls/lighting/seat-belt",0);
    setprop("controls/anti-ice/pitot-heat",0);
    setprop("controls/anti-ice/prop-heat",0);
    setprop("controls/anti-ice/window-heat",0);
    setprop("controls/flight/elevator-trim",-0.2);
    setprop("controls/flight/rudder-trim",0.12);
    setprop("sim/model/equipment/left-pitot-cover",1);
    setprop("sim/model/equipment/right-pitot-cover",1);
    setprop("sim/model/equipment/left-tiedown-wheels",1);
    setprop("sim/model/equipment/right-tiedown-wheels",1);
    setprop("sim/model/equipment/rear-tiedown-wheels",1);
    setprop("sim/model/equipment/left-engine-cover",1);
    setprop("sim/model/equipment/right-engine-cover",1);
    setprop("sim/model/equipment/left-chock-fwd",1);
    setprop("sim/model/equipment/left-chock-aft",1);
    setprop("sim/model/equipment/right-chock-fwd",1);
    setprop("sim/model/equipment/right-chock-aft",1);
    setprop("sim/model/equipment/ground-services/external-power/enable",1);
}

var Wiper = {
    new : func (wiper_prop,power_prop){
        m = { parents : [Wiper] };
        m.direction = 0;
        m.delay_count = 0;
        m.spd_factor = 0;
        m.node = props.globals.initNode(wiper_prop);
        m.power = props.globals.initNode(power_prop,0.0,"DOUBLE");
        m.spd = m.node.initNode("arc-sec",1.0,"DOUBLE");
        m.delay = m.node.initNode("delay-sec",0.0,"DOUBLE");
        m.position = m.node.initNode("position-norm",0.0,"DOUBLE");
        m.switch = m.node.initNode("switch",0,"BOOL");
        return m;
    },
    active: func{
    if(me.power.getValue()<=5)return;
    var spd_factor = 1/me.spd.getValue();
    var pos = me.position.getValue();
    if(!me.switch.getValue()){
        if(pos <= 0.000)return;
        }
    if(pos >=1.000){
        me.direction=-1;
        }elsif(pos <=0.000){
        me.direction=0;
        me.delay_count+=getprop("/sim/time/delta-sec");
        if(me.delay_count >= me.delay.getValue()){
            me.delay_count=0;
            me.direction=1;
            }
        }
    var wiper_time = spd_factor*getprop("/sim/time/delta-sec");
    pos +=(wiper_time * me.direction);
    me.position.setValue(pos);
    }
};

var Caution_panel = {
    new : func (prop){
        m = { parents : [Caution_panel] };
        m.count=0;
        m.volts=0;
        m.caution_test=0;
        m.node = props.globals.initNode(prop);
        m.test = props.globals.initNode("systems/electrical/outputs/caution-test");
        m.power = props.globals.initNode("systems/electrical/volts");
        
        m.l_gen_oheat=m.node.initNode("gen-oheat[0]",0,"BOOL");
        m.r_gen_oheat=m.node.initNode("gen-oheat[1]",0,"BOOL");
        m.l_gen=m.node.initNode("gen[0]",0,"BOOL");
        m.r_gen=m.node.initNode("gen[1]",0,"BOOL");
        m.l_oil_psi=m.node.initNode("oil[0]",0,"BOOL");
        m.r_oil_psi=m.node.initNode("oil[1]",0,"BOOL");
        m.l_cycle400=m.node.initNode("cycle400[0]",0,"BOOL");
        m.r_cycle400=m.node.initNode("cycle400[1]",0,"BOOL");
        m.hydr_press=m.node.initNode("hydr-press",0,"BOOL");
        m.prop_reset=m.node.initNode("prop-reset",0,"BOOL");
        m.fwd_fuel=m.node.initNode("low-fuel[0]",0,"BOOL");
        m.aft_fuel=m.node.initNode("low-fuel[1]",0,"BOOL");
        m.fwd_boost1=m.node.initNode("fwd-boost[0]",0,"BOOL");
        m.fwd_boost2=m.node.initNode("fwd-boost[1]",0,"BOOL");
        m.aft_boost1=m.node.initNode("aft-boost[0]",0,"BOOL");
        m.aft_boost2=m.node.initNode("aft-boost[1]",0,"BOOL");
        m.doors=m.node.initNode("doors",0,"BOOL");
        m.duct=m.node.initNode("duct-oheat",0,"BOOL");
        return m;
    },
    update: func{
        
        if(me.power.getValue()>5.0)me.volts=1 else me.volts=0;
        if(me.test.getValue()>5.0)me.caution_test=1 else me.caution_test=0;
        if(me.volts == 0){me.reset();return;} 
        if(me.caution_test == 1){me.lamp_test();return;}
        
        if(me.count==0)me.left_bank() else me.right_bank();
    },

    left_bank: func{
        if(!getprop("controls/electric/engine/generator"))me.l_gen.setValue(me.volts) else me.l_gen.setValue(0);
        me.l_gen_oheat.setValue(0);
        me.l_cycle400.setValue(0);
        me.duct.setValue(0);
        if(getprop("engines/engine[0]/n2")<30){
            me.l_oil_psi.setValue(me.volts);
            me.hydr_press.setValue(me.volts);
            
        }else{
            me.l_oil_psi.setValue(0);
            me.hydr_press.setValue(0);
        }
        if(getprop("engines/engine[0]/n2")<30 and getprop("controls/electric/fwd-boost-pump") == 0) {
            me.fwd_boost1.setValue(me.volts);
            me.fwd_boost2.setValue(me.volts);
        } else {
            me.fwd_boost1.setValue(0);
            me.fwd_boost2.setValue(0);      
        }
        if(getprop("consumables/fuel/tank/indicated-level-lbs")<75)me.fwd_fuel.setValue(me.volts) else me.fwd_fuel.setValue(0);
        var lfdoor=getprop("controls/doors/LF-door/position-norm");
        var rfdoor=getprop("controls/doors/RF-door/position-norm");
        var rrdoor=getprop("controls/doors/RR-door/position-norm");
        if(lfdoor>0.001 or rfdoor>0.001 or rrdoor>0.001)me.doors.setValue(me.volts) else me.doors.setValue(0);

        me.count=1-me.count;
    },

    right_bank: func{
    if(!getprop("controls/electric/engine[1]/generator"))me.r_gen.setValue(me.volts) else me.r_gen.setValue(0);
    me.r_gen_oheat.setValue(0);
    me.r_cycle400.setValue(0);
    me.prop_reset.setValue(0);
        if(getprop("engines/engine[1]/n2")<30){
            me.r_oil_psi.setValue(me.volts);
            me.hydr_press.setValue(me.volts);
        }else{
            me.r_oil_psi.setValue(0);
            me.hydr_press.setValue(0);
        }
        if(getprop("engines/engine[1]/n2")<30 and getprop("controls/electric/aft-boost-pump") == 0) {
            me.aft_boost1.setValue(me.volts);
            me.aft_boost2.setValue(me.volts);
        } else {
            me.aft_boost1.setValue(0);
            me.aft_boost2.setValue(0);      
        }
        if(getprop("consumables/fuel/tank[1]/indicated-level-lbs")<75)me.aft_fuel.setValue(me.volts) else me.aft_fuel.setValue(0);
        
        me.count=1-me.count;
    },

    reset: func{
        me.l_gen_oheat.setValue(0);
        me.r_gen_oheat.setValue(0);
        me.l_gen.setValue(0);
        me.r_gen.setValue(0);
        me.l_oil_psi.setValue(0);
        me.r_oil_psi.setValue(0);
        me.l_cycle400.setValue(0);
        me.r_cycle400.setValue(0);
        me.hydr_press.setValue(0);
        me.prop_reset.setValue(0);
        me.fwd_fuel.setValue(0);
        me.aft_fuel.setValue(0);
        me.fwd_boost1.setValue(0);
        me.fwd_boost2.setValue(0);
        me.aft_boost1.setValue(0);
        me.aft_boost2.setValue(0);
        me.doors.setValue(0);
        me.duct.setValue(0);
    },
    lamp_test: func{
        me.l_gen_oheat.setValue(me.caution_test);
        me.r_gen_oheat.setValue(me.caution_test);
        me.l_gen.setValue(me.caution_test);
        me.r_gen.setValue(me.caution_test);
        me.l_oil_psi.setValue(me.caution_test);
        me.r_oil_psi.setValue(me.caution_test);
        me.l_cycle400.setValue(me.caution_test);
        me.r_cycle400.setValue(me.caution_test);
        me.hydr_press.setValue(me.caution_test);
        me.prop_reset.setValue(me.caution_test);
        me.fwd_fuel.setValue(me.caution_test);
        me.aft_fuel.setValue(me.caution_test);
        me.fwd_boost1.setValue(me.caution_test);
        me.fwd_boost2.setValue(me.caution_test);
        me.aft_boost1.setValue(me.caution_test);
        me.aft_boost2.setValue(me.caution_test);
        me.doors.setValue(me.caution_test);
        me.duct.setValue(me.caution_test);
    }
};



    var wiper = Wiper.new("controls/electric/wipers","systems/electrical/volts");

    var Ctn_panel=Caution_panel.new("instrumentation/caution-panel");

setlistener("/sim/signals/fdm-initialized", func {
    setprop("instrumentation/clock/flight-meter-hour",0);
    print("system  ...Check");
    Shutdown();
     settimer(update_systems, 1.1);
    settimer(annunciators, 1.2);
});


setlistener("/sim/signals/reinit", func {
    Shutdown();
});

setlistener("controls/fuel/tank-selector", func(tk){
var tnk = tk.getValue();
if(tnk == -1){
        setprop("consumables/fuel/tank[0]/selected",0);
        setprop("consumables/fuel/tank[1]/selected",1);
    }elsif(tnk == 0){
        setprop("consumables/fuel/tank[0]/selected",1);
        setprop("consumables/fuel/tank[1]/selected",1);
    }elsif(tnk == 1){
        setprop("consumables/fuel/tank[0]/selected",1);
        setprop("consumables/fuel/tank[1]/selected",0);
    }
});


setlistener("/sim/model/autostart", func(idle){
      if(idle.getBoolValue())Startup() else Shutdown();
},0,0);

setlistener("controls/engines/engine[0]/cutoff", func(c1){
      setprop("controls/engines/engine[0]/internal-condition",1-c1.getValue());
},0,0);

setlistener("controls/engines/engine[1]/cutoff", func(c1){
      setprop("controls/engines/engine[1]/internal-condition",1-c1.getValue());
},0,0);

setlistener("/gear/gear[1]/wow", func(gr){
    if(gr.getBoolValue()){
    FHmeter.stop();
    }else{FHmeter.start();}
},0,0);



var flight_meter = func{
var fmeter = getprop("/instrumentation/clock/flight-meter-sec");
var fminute = fmeter * 0.016666;
var fhour = fminute * 0.016666;
setprop("/instrumentation/clock/flight-meter-hour",fhour);
}

##### Main ###########


var annunciators = func {
    Ctn_panel.update();
    settimer(annunciators, 0.5);
    }

var update_eng_sound = func {
    var tst1 = (getprop("engines/engine[0]/n2") * 0.01)-0.5;
    var tst2 = (getprop("engines/engine[1]/n2") * 0.01)-0.5;
    tst1+=(getprop("engines/engine[0]/reverse") * 0.2);
    tst2+=(getprop("engines/engine[1]/reverse") * 0.2);
    E1_volume.setValue(tst1);
    E2_volume.setValue(tst2);
    }

var update_stall_sound = func {
    var stall = (getprop("orientation/alpha-deg"));
    stall_volume.setValue(stall);
    }

var update_hyd_pump_sound = func {
    var pressure = (getprop("systems/hydraulic/indicated-pressure"));
    hyd_pump_volume.setValue(pressure);
}

var update_throttles = func {
    var LHrvr=getprop("controls/engines/engine[0]/reverser");
    var RHrvr=getprop("controls/engines/engine[1]/reverser");
    var THR1 =getprop("controls/engines/engine[0]/throttle");
    var THR2 =getprop("controls/engines/engine[1]/throttle");
    var running1 = getprop("engines/engine[0]/running");
    var running2 = getprop("engines/engine[1]/running");
    if(LHrvr==1 and running1==0) {
        setprop("controls/engines/engine[0]/throttle-rvrs-norunning",THR1);
    } else if (LHrvr==1 and running1==1) {
        setprop("controls/engines/engine[0]/throttle-rvrs",THR1);
    } else {
        setprop("controls/engines/engine[0]/throttle-fwd",THR1);
    }

    if(RHrvr==1 and running2==0) {
        setprop("controls/engines/engine[1]/throttle-rvrs-norunning",THR2);
    } else if (RHrvr==1 and running2==1) {
        setprop("controls/engines/engine[1]/throttle-rvrs",THR2);
    } else {
        setprop("controls/engines/engine[1]/throttle-fwd",THR2);
    }
    
}

var update_systems = func {
    var lfdoor_pos = getprop("controls/doors/LF-door/position-norm");
    var rfdoor_pos = getprop("controls/doors/RF-door/position-norm");
    var rrdoor_pos = getprop("controls/doors/RR-door/position-norm");
    var lrdoorf_pos = getprop("controls/doors/LR-door-F/position-norm");
    var lrdoorr_pos = getprop("controls/doors/LR-door-R/position-norm");
    var baggdoor_pos = getprop("controls/doors/Baggage.door/position-norm");
    var power = getprop("/controls/switches/master-panel");
    flight_meter();
    wiper.active();
    var wind = getprop("velocities/airspeed-kt");
    if(wind>40){
        if(getprop("controls/doors/LF-door/open"))setprop("controls/doors/LF-door/open",0);
        if(getprop("controls/doors/RF-door/open"))setprop("controls/doors/RF-door/open",0);
        if(getprop("controls/doors/LR-door-F/open"))setprop("controls/doors/LR-door-F/open",0);
        if(getprop("controls/doors/LR-door-R/open"))setprop("controls/doors/LR-door-R/open",0);
        if(getprop("controls/doors/RR-door/open"))setprop("controls/doors/RR-door/open",0);
        if(getprop("controls/doors/Baggage.door/open"))setprop("controls/doors/Baggage.door/",0);
    }

    # Flap operation requires hydraulic presuure
    if(getprop("systems/hydraulic/indicated-pressure")<1000)setprop("controls/flight/flaps-serviceable", 0);
    if(getprop("systems/hydraulic/indicated-pressure")>1000)setprop("controls/flight/flaps-serviceable", 1);
    # 1000 is only an estimated value
    if(getprop("controls/flight/flaps-serviceable"))setprop("controls/flight/flaps", getprop("controls/flight/flaplever"));
    update_throttles();
    update_eng_sound();
    update_stall_sound();
    update_hyd_pump_sound();
    settimer(update_systems, 0);
}


# Thrust reverse info
var reverse_chg = func {
   if (getprop("/controls/engines/engine[0]/reverser")) {
      mess_e0="Left engine active"
   } else {
      mess_e0="Left engine inactive"
   }
   if (getprop("/controls/engines/engine[1]/reverser")) {
      mess_e1="Right engine active"
   } else {
      mess_e1="Right engine inactive"
   }
   gui.popupTip(sprintf("Thrust reverse:\n%s\n%s", mess_e0, mess_e1), 30, nil, {x: 1, y: 1});
}
setlistener("/controls/engines/engine[0]/reverser", reverse_chg);
setlistener("/controls/engines/engine[1]/reverser", reverse_chg);

controls.applyParkingBrake = func (v) {
    if (!v) {
        return;
    }

    var p = "/controls/gear/parkingbrake-lever";
    setprop(p, var i = !getprop(p));
    return i;
};

controls.flapsDown = func(step) {
    if(step == 0) return;
    if(props.globals.getNode("/sim/flaps") != nil and getprop("controls/flight/flaps-serviceable")) {
        stepProps("/controls/flight/flaplever", "/sim/flaps", step);
        return;
    }
    # Hard-coded flap lever movement in 8 equal steps:
    var val = 0.125 * step + getprop("/controls/flight/flaplever");
    setprop("/controls/flight/flaplever", val > 1 ? 1 : val < 0 ? 0 : val);
}

var DMEinit = func {
    ki266.new(0);
};

setlistener("/sim/signals/fdm-initialized", DMEinit );

var DMESources = {
  1 : "/instrumentation/nav[0]/frequencies/selected-mhz",
  2 : "/instrumentation/dme/frequencies/selected-mhz",
  3 : "/instrumentation/nav[1]/frequencies/selected-mhz"
};

setlistener( "/instrumentation/dme/switch-position", func(n) {
  var v = n.getValue();
  v == nil and return;
  n.getParent().getNode( "frequencies/source", 1 ).setValue(DMESources[v]);
}, 1, 0 );
