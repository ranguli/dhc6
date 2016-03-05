setprop("/tooltips-custom/radar-alt", 0.0);

var RadarAlt = func {
    var gear_alt = getprop("position/gear-agl-ft");
    if (gear_alt >= 2500) {
        setprop("/tooltips-custom/radar-alt", 2500.0);
    } else {
        setprop("/tooltips-custom/radar-alt", gear_alt);
    }
    settimer(RadarAlt, 0.3);
}
setlistener("/sim/signals/fdm-initialized", RadarAlt);