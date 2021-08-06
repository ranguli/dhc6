props.globals.initNode("/systems/electrical/outputs/flight-comp-lights-dim-factor", 0.0, "DOUBLE");
props.globals.initNode("/systems/electrical/outputs/flight-comp-lights", 0.0, "DOUBLE");

var fltcompLight = func {   
    var cab_lgt_output = getprop("/systems/electrical/outputs/flight-comp-lights") / 23;
    var dim_factor = 0.0;
    if (cab_lgt_output > 1) {
        dim_factor = 1;
    } else {
        dim_factor = cab_lgt_output;
    }
    setprop("/systems/electrical/outputs/flight-comp-lights-dim-factor", dim_factor);
    settimer(fltcompLight, 0.1);
};
setlistener("sim/signals/fdm-initialized", fltcompLight);
