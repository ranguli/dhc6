####  turboprop engine electrical system    #### 
####    Syd Adams    ####

var ammeter_ave = 0.0;
var outPut = "systems/electrical/outputs/";
var BattVolts = props.globals.getNode("systems/electrical/batt-volts",1);
var Volts = props.globals.getNode("/systems/electrical/volts",1);
var Amps = props.globals.getNode("/systems/electrical/amps",1);
var EXT  = props.globals.getNode("/controls/electric/external-power",1);
var switch_list=[];
var output_list=[];
var serv_list=[];
var servout_list=[];
var increasing_counter0 = 0.0;
var increasing_counter1 = 0.0;
var fuel_rich0 = 0.0;
var fuel_rich1 = 0.0;

# Initial custom internal value #



#strobe_switch = props.globals.getNode("controls/lighting/strobe", 1);
#aircraft.light.new("controls/lighting/strobe-state", [0.05, 1.30], strobe_switch);
#beacon_switch = props.globals.getNode("controls/lighting/beacon", 1);
#aircraft.light.new("controls/lighting/beacon-state", [1.0, 1.0], beacon_switch);

var navLight = aircraft.light.new("/sim/model/lights/nav-lights", [0], "/controls/lighting/nav-lights");
var landingLightL = aircraft.light.new("/sim/model/lights/landing-light[0]", [0], "/controls/lighting/landing-light[0]");
var landingLightR = aircraft.light.new("/sim/model/lights/landing-light[1]", [0], "/controls/lighting/landing-light[1]");
var taxiLight = aircraft.light.new("/sim/model/lights/taxi-lights", [0], "/controls/lighting/taxi-lights");
var strobeLight = aircraft.light.new("/sim/model/lights/strobe", [0.08, 2.5], "/controls/lighting/strobe");
var beaconLight = aircraft.light.new("/sim/model/lights/beacon", [0.08, 0.08, 0.08, 2.5], "/controls/lighting/beacon");


#var battery = Battery.new(switch-prop,volts,amps,amp_hours,charge_percent,charge_amps);
Battery = {
    new : func(swtch,vlt,amp,hr,chp,cha){
    m = { parents : [Battery] };
            m.switch = props.globals.getNode(swtch,1);
            m.switch.setBoolValue(0);
            m.ideal_volts = vlt;
            m.ideal_amps = amp;
            m.amp_hours = hr;
            m.charge_percent = chp; 
            m.charge_amps = cha;
    return m;
    },
    apply_load : func(load,dt) {
        if(me.switch.getValue()){
        var amphrs_used = load * dt / 3600.0;
        var percent_used = amphrs_used / me.amp_hours;
        me.charge_percent -= percent_used;
        if ( me.charge_percent < 0.0 ) {
            me.charge_percent = 0.0;
        } elsif ( me.charge_percent > 1.0 ) {
        me.charge_percent = 1.0;
        }
        var output =me.amp_hours * me.charge_percent;
        return output;
        }else return 0;
    },

    get_output_volts : func {
        if(me.switch.getValue()){
            var x = 1.0 - me.charge_percent;
            var tmp = -(3.0 * x - 1.0);
            var factor = (tmp*tmp*tmp*tmp*tmp + 32) / 32;
            var output =me.ideal_volts * factor;
            return output;
        }else return 0;
    },

    get_output_amps : func {
        if(me.switch.getValue()){
            var x = 1.0 - me.charge_percent;
            var tmp = -(3.0 * x - 1.0);
            var factor = (tmp*tmp*tmp*tmp*tmp + 32) / 32;
            var output =me.ideal_amps * factor;
            return output;
        }else return 0;
    }
};

# var alternator = Alternator.new(num,switch,rpm_source,rpm_threshold,volts,amps);
Alternator = {
    new : func (num,switch,src,thr,vlt,amp){
        m = { parents : [Alternator] };
        m.switch =  props.globals.getNode(switch,1);
        m.switch.setBoolValue(0);
        m.meter =  props.globals.getNode("systems/electrical/gen-load["~num~"]",1);
        m.meter.setDoubleValue(0);
        m.gen_output =  props.globals.getNode("engines/engine["~num~"]/amp-v",1);
        m.gen_output.setDoubleValue(0);
        m.meter.setDoubleValue(0);
        m.rpm_source =  props.globals.getNode(src,1);
        m.rpm_threshold = thr;
        m.ideal_volts = vlt;
        m.ideal_amps = amp;
        return m;
    },

    apply_load : func(load) {
        var cur_volt=me.gen_output.getValue();
        var cur_amp=me.meter.getValue();
        if(cur_volt >1){
            var factor=1/cur_volt;
            gout = (load * factor);
            if(gout>1)gout=1;
        }else{
            gout=0;
        }
        if(cur_amp > gout)me.meter.setValue(cur_amp - 0.01);
        if(cur_amp < gout)me.meter.setValue(cur_amp + 0.01);
    },

    get_output_volts : func {
        var out = 0;
        if(me.switch.getBoolValue()){
            var factor = me.rpm_source.getValue() / me.rpm_threshold;
            if ( factor > 1.0 )factor = 1.0;
            var out = (me.ideal_volts * factor);
        }
        me.gen_output.setValue(out);
        if (out > 1) return out;
        return 0;
    },

    get_output_amps : func {
        var ampout =0;
        if(me.switch.getBoolValue()){
            var factor = me.rpm_source.getValue() / me.rpm_threshold;
            if ( factor > 1.0 ) {
                factor = 1.0;
            }
            ampout = me.ideal_amps * factor;
        }
        return ampout;
    }
};

var battery = Battery.new("/controls/electric/battery-switch",24,30,34,1.0,7.0);
var alternator1 = Alternator.new(0,"controls/electric/engine[0]/generator","/engines/engine[0]/n2",30.0,28.0,60.0);
var alternator2 = Alternator.new(1,"controls/electric/engine[1]/generator","/engines/engine[1]/n2",30.0,28.0,60.0);

#####################################
setlistener("/sim/signals/fdm-initialized", func {
    BattVolts.setDoubleValue(0);
    init_switches();
    settimer(update_electrical,5);
    print("Electrical System ... ok");

});

init_switches = func() {
    var tprop=props.globals.getNode("controls/electric/ammeter-switch",1);
    tprop.setBoolValue(1);
    tprop=props.globals.getNode("controls/cabin/fan",1);
    tprop.setBoolValue(0);
    tprop=props.globals.getNode("controls/cabin/heat",1);
    tprop.setBoolValue(0);
    tprop=props.globals.getNode("controls/electric/external-power",1);
    tprop.setBoolValue(0);

    setprop("controls/lighting/instruments-norm",0.8);
    setprop("controls/lighting/engines-norm",0.8);
    setprop("controls/lighting/efis-norm",0.8);
    setprop("controls/lighting/panel-norm",0.8);

    append(switch_list,"controls/anti-ice/prop-heat");
    append(output_list,"prop-heat");
    append(switch_list,"controls/electric/caution-test");
    append(output_list,"caution-test");
    append(switch_list,"controls/anti-ice/pitot-heat");
    append(output_list,"pitot-heat");
    append(switch_list,"controls/lighting/landing-light[0]");
    append(output_list,"landing-light[0]");
    append(switch_list,"controls/lighting/landing-light[1]");
    append(output_list,"landing-light[1]");
    append(switch_list,"controls/lighting/beacon");
    append(output_list,"beacon");
    append(switch_list,"controls/lighting/nav-lights");
    append(output_list,"nav-lights");
    append(switch_list,"controls/lighting/cabin-lights");
    append(output_list,"cabin-lights");
    append(switch_list,"controls/lighting/wing-lights");
    append(output_list,"wing-lights");
    append(switch_list,"controls/lighting/recog-lights");
    append(output_list,"recog-lights");
    append(switch_list,"controls/lighting/logo-lights");
    append(output_list,"logo-lights");
    append(switch_list,"controls/lighting/strobe");
    append(output_list,"strobe");
    append(switch_list,"controls/lighting/taxi-lights");
    append(output_list,"taxi-lights");
    append(switch_list,"controls/electric/wipers/switch");
    append(output_list,"wipers");
    append(switch_list,"controls/electric/aft-boost-pump");
    append(output_list,"aft-boost-pump");
    append(switch_list,"controls/electric/fwd-boost-pump");
    append(output_list,"fwd-boost-pump");
    append(switch_list,"controls/anti-ice/window-heat");
    append(output_list,"window-heat");


    append(serv_list,"instrumentation/adf/serviceable");
    append(servout_list,"adf");
    append(serv_list,"instrumentation/dme/serviceable");
    append(servout_list,"dme");
    append(serv_list,"instrumentation/gps/serviceable");
    append(servout_list,"gps");
    append(serv_list,"instrumentation/heading-indicator/serviceable");
    append(servout_list,"DG");
    append(serv_list,"instrumentation/transponder/inputs/serviceable");
    append(servout_list,"transponder");
#    append(serv_list,"instrumentation/mk-viii/serviceable");
#    append(servout_list,"mk-viii");
    append(serv_list,"instrumentation/tacan/serviceable");
    append(servout_list,"tacan");
    append(serv_list,"instrumentation/turn-indicator/serviceable");
    append(servout_list,"turn-coordinator");
    append(serv_list,"instrumentation/comm/serviceable");
    append(servout_list,"comm");
    append(serv_list,"instrumentation/comm[1]/serviceable");
    append(servout_list,"comm[1]");
    append(serv_list,"instrumentation/nav/serviceable");
    append(servout_list,"nav");
    append(serv_list,"instrumentation/nav[1]/serviceable");
    append(servout_list,"nav[1]");
#    append(serv_list,"instrumentation/kns-80/serviceable");
#    append(servout_list,"KNS80");

    for(var i=0; i<size(serv_list); i+=1) {
        var tmp = props.globals.getNode(serv_list[i],1);
        tmp.setBoolValue(1);
    }

    for(var i=0; i<size(switch_list); i+=1) {
        var tmp = props.globals.getNode(switch_list[i],1);
        tmp.setBoolValue(0);
    }
}

update_virtual_bus = func( dt ) {
    var PWR = getprop("systems/electrical/serviceable");
    var battery_volts = battery.get_output_volts();
    BattVolts.setValue(battery_volts);
    var alternator1_volts = alternator1.get_output_volts();
    var alternator2_volts = alternator2.get_output_volts();
    var external_volts = 28.0;
    var power_selector = getprop("controls/electric/power-source");
    var EXT_plugged = getprop("/sim/model/equipment/ground-services/external-power/enable");

    load = 0.0;
    bus_volts = 0.0;
    power_source = nil;
        
    if (power_selector == 1){
        bus_volts = battery_volts;
        power_source = "battery";
    }

    if (alternator1_volts > bus_volts) {
        bus_volts = alternator1_volts;
        power_source = "alternator1";
        }

    if (alternator2_volts > bus_volts) {
        bus_volts = alternator2_volts;
        power_source = "alternator2";
        }
        if (EXT_plugged == 1 and power_selector == -1){
        setprop("/controls/electric/external-power", 1);
        } else {
        setprop("/controls/electric/external-power", 0);
        }
    if ( EXT.getBoolValue() and ( external_volts > bus_volts) ) {
        power_source = "external";
        bus_volts = external_volts;
        }

    bus_volts *=PWR;

    load += electrical_bus(bus_volts);
    load += avionics_bus(bus_volts);

    ammeter = 0.0;
#    if ( bus_volts > 1.0 )load += 15.0;

    if ( power_source == "battery" ) {
        ammeter = -load;
        } else {
        ammeter = battery.charge_amps;
    }

    if ( power_source == "battery" ) {
        battery.apply_load( load, dt );
        } elsif ( bus_volts > battery_volts ) {
        battery.apply_load( -battery.charge_amps, dt );
        }

    ammeter_ave = 0.8 * ammeter_ave + 0.2 * ammeter;

   Amps.setValue(ammeter_ave);
   Volts.setValue(bus_volts);
    alternator1.apply_load(load);
    alternator2.apply_load(load);

return load;
}


electrical_bus = func(bv) {
    var bus_volts = bv;
    var load = 0.0;
    var srvc = 0.0;
    var starter_volts = 0.0;
    var starter_volts1 = 0.0;
    var start_n2_0 = 0.0;
    var start_n2_1 = 0.0;

    var internal_starter = getprop("controls/engines/internal-engine-starter");
    var if_engine0_running = getprop("engines/engine[0]/running");
    var if_engine1_running = getprop("engines/engine[1]/running");
    var if_engine0_serviceable = getprop("engines/engine[0]/serviceable");
    var if_engine1_serviceable = getprop("engines/engine[1]/serviceable");
    var if_engine0_cutoff = getprop("controls/engines/engine[0]/cutoff");    
    var if_engine1_cutoff = getprop("controls/engines/engine[1]/cutoff");
    var aft_boost = getprop("controls/electric/aft-boost-pump");
    var fwd_boost = getprop("controls/electric/fwd-boost-pump");
    var aft_boost_pumps_volts = bus_volts * aft_boost;
    var fwd_boost_pumps_volts = bus_volts * fwd_boost;
    
    if (internal_starter == 0) {
        increasing_counter0 = 0.0;
        increasing_counter1 = 0.0;
    }

    if (internal_starter < 0) {
       	internal_starter = -internal_starter;
	starter_volts1 = bus_volts * internal_starter;
    } else if (internal_starter > 0) {
       	starter_volts = bus_volts * internal_starter;
    }
    
    load += internal_starter * 5;
        start_n2_0 += starter_volts * 0.7;
    
    var increasing0 = func {
        if (getprop("engines/engine[0]/n2") < start_n2_0) {
            increasing_counter0 = increasing_counter0 + 0.0005;
       	    setprop("engines/engine[0]/n2", increasing_counter0);
	    settimer(increasing0, 0);
        }
    }

    if (getprop("engines/engine[0]/n2") < start_n2_0) {
        increasing0();
    }
    
    load += internal_starter * 5;
    start_n2_1 += starter_volts1 * 0.7;
    
    var increasing1 = func {
        if (getprop("engines/engine[1]/n2") < start_n2_1) {
            increasing_counter1 = increasing_counter1 + 0.0005;
       	    setprop("engines/engine[1]/n2", increasing_counter1);
	    settimer(increasing1, 0);
        }
    }

    if (getprop("engines/engine[1]/n2") < start_n2_1) {
        increasing1();
    }
    
    var internal_condition0 = getprop("controls/engines/engine[0]/condition");
    var internal_condition1 = getprop("controls/engines/engine[1]/condition");
    var min_n2_0 = getprop("engines/engine[0]/n2");
    var min_n2_1 = getprop("engines/engine[1]/n2");


    var fuel_rich_func0 = func {
        if (if_engine0_running == 0 and fuel_rich0 <= 200 and fuel_rich0>=0) {
            fuel_rich0 =  fuel_rich0 - min_n2_0 + (internal_condition0 * 20);
	    settimer(fuel_rich_func0, 1);
	}
    }

    var fuel_rich_func1 = func {
        if (if_engine1_running == 0 and fuel_rich1 <= 200 and fuel_rich1>=0) {
            fuel_rich1 =  fuel_rich1 - min_n2_1 + (internal_condition1 * 20);
	    settimer(fuel_rich_func1, 1);
	}
    }

    if (fuel_rich0 >200) {
        fuel_rich0 = 200;
    } else if (fuel_rich0 <0) {
        fuel_rich0 = 0;
    }

    
    if (fuel_rich1 >200) {
        fuel_rich1 = 200;
    } else if (fuel_rich1 <0) {
        fuel_rich1 = 0;
    }

    fuel_rich_func0();
    fuel_rich_func1();

    if_engine0_running = getprop("engines/engine[0]/running");
    if_engine1_running = getprop("engines/engine[1]/running");

    if (getprop("engines/engine[0]/n2") >= 12 and internal_condition0 > 0 and fuel_rich0 < 25 and fwd_boost != 0 and if_engine0_serviceable and if_engine0_cutoff==0 and internal_condition0>0.382 and !getprop("sim/model/equipment/left-engine-cover")) {
       setprop("controls/engines/engine[0]/internal-condition", 1);
    } else {
       setprop("controls/engines/engine[0]/internal-condition", 0);
    }

    if (getprop("engines/engine[1]/n2") >= 12 and internal_condition1 > 0 and fuel_rich1 < 25 and aft_boost != 0  and if_engine1_serviceable and if_engine1_cutoff==0 and internal_condition1>0.382 and !getprop("sim/model/equipment/right-engine-cover")) {
       setprop("controls/engines/engine[1]/internal-condition", 1);
    } else {
       setprop("controls/engines/engine[1]/internal-condition", 0);
    }
    
    var starter_total_volts = starter_volts + starter_volts1;
    
    setprop(outPut~"starter",starter_total_volts); 
    setprop(outPut~"aft-boost-pumps",aft_boost_pumps_volts); 
    setprop(outPut~"fwd-boost-pumps",fwd_boost_pumps_volts); 

    for(var i=0; i<size(switch_list); i+=1) {
        var srvc = getprop(switch_list[i]);
        load +=srvc;
        setprop(outPut~output_list[i],bus_volts * srvc);
    }
    setprop(outPut~"flaps",bus_volts);

    return load;
}

#### used in Instruments/source code 
# adf : dme : encoder : gps : DG : transponder  
# mk-viii : MRG : tacan : turn-coordinator
# nav[0] : nav [1] : comm[0] : comm[1]
####

avionics_bus = func(bv) {
    var bus_volts = bv;
    var load = 0.0;
    var srvc = 0.0;
INSTR_DIMMER = getprop("controls/lighting/instruments-norm");
var instr_lights=(bus_volts * getprop("controls/lighting/instrument-lights") ) * INSTR_DIMMER;
setprop(outPut~"instrument-lights",(instr_lights));
setprop(outPut~"instrument-lights-norm",0.0357 * instr_lights);


    for(var i=0; i<size(serv_list); i+=1) {
        var srvc = getprop(serv_list[i]);
        load +=srvc;
        setprop(outPut~servout_list[i],bus_volts * srvc);
    }

    return load;
}

update_electrical = func {
    var scnd = getprop("sim/time/delta-sec");
    update_virtual_bus( scnd );
settimer(update_electrical, 0);
}
