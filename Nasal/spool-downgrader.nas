
var spoolDowngrade = func {

    var throttle_fwd0 = getprop("/controls/engines/engine[0]/throttle-fwd");
    var throttle_fwd1 = getprop("/controls/engines/engine[1]/throttle-fwd");
    interpolate("/controls/engines/engine[0]/internal-throttle-fwd",throttle_fwd0,2.4);
    interpolate("/controls/engines/engine[1]/internal-throttle-fwd",throttle_fwd1,2.4);

    settimer(spoolDowngrade,0);
}
setlistener("/sim/signals/fdm-initialized", spoolDowngrade);