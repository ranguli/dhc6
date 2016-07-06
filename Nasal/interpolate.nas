# Smooth animation of switches
# June 2016 by Jonathan Schellhase (Dg-505)
# Taken form "Douglas-Dc3/Nasal/interpolate.nas"

setlistener("/controls/electric/battery-switch", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/battery-switch-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/battery-switch-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/power-source", func(v) {
    interpolate("/controls/electric/power-source-pos", v.getValue(), 0.1);
});

setlistener("/controls/engines/internal-engine-starter", func(v) {
    interpolate("/controls/engines/internal-engine-starter-pos", v.getValue(), 0.1);
});

setlistener("/controls/lighting/landing-light[0]", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/landing-light-pos[0]", 1, 0.1);
    }else{
        interpolate("/controls/lighting/landing-light-pos[0]", 0, 0.1);
    }
});

setlistener("/controls/lighting/landing-light[1]", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/landing-light-pos[1]", 1, 0.1);
    }else{
        interpolate("/controls/lighting/landing-light-pos[1]", 0, 0.1);
    }
});

setlistener("/controls/electric/wipers/switch", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/wipers/switch-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/wipers/switch-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/wipers/delay-sec", func(v) {
    interpolate("/controls/electric/wipers/delay-sec-pos", v.getValue(), 0.1);
});

setlistener("/controls/anti-ice/window-heat", func(v) {
    if(v.getValue()){
        interpolate("/controls/anti-ice/window-heat-pos", 1, 0.1);
    }else{
        interpolate("/controls/anti-ice/window-heat-pos", 0, 0.1);
    }
});

setlistener("/controls/anti-ice/prop-heat", func(v) {
    if(v.getValue()){
        interpolate("/controls/anti-ice/prop-heat-pos", 1, 0.1);
    }else{
        interpolate("/controls/anti-ice/prop-heat-pos", 0, 0.1);
    }
});

setlistener("/controls/engines/engine[0]/intake-deflector", func(v) {
    interpolate("/controls/engines/engine[0]/intake-deflector-pos", v.getValue(), 0.1);
});

setlistener("/controls/engines/engine[1]/intake-deflector", func(v) {
    interpolate("/controls/engines/engine[1]/intake-deflector-pos", v.getValue(), 0.1);
});

setlistener("/controls/lighting/instrument-lights", func(v) {
    interpolate("/controls/lighting/instrument-lights-pos", v.getValue(), 0.1);
});

setlistener("/controls/lighting/cabin-lights", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/cabin-lights-pos", 1, 0.1);
    }else{
        interpolate("/controls/lighting/cabin-lights-pos", 0, 0.1);
    }
});

setlistener("/controls/lighting/strobe", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/strobe-pos", 1, 0.1);
    }else{
        interpolate("/controls/lighting/strobe-pos", 0, 0.1);
    }
});

setlistener("/controls/lighting/nav-lights", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/nav-lights-pos", 1, 0.1);
    }else{
        interpolate("/controls/lighting/nav-lights-pos", 0, 0.1);
    }
});

setlistener("/controls/lighting/no-smoking", func(v) {
    interpolate("/controls/lighting/no-smoking-pos", v.getValue(), 0.1);
});

setlistener("/controls/lighting/seat-belt", func(v) {
    interpolate("/controls/lighting/seat-belt-pos", v.getValue(), 0.1);
});

setlistener("/controls/lighting/beacon", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/beacon-pos", 1, 0.1);
    }else{
        interpolate("/controls/lighting/beacon-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/caution-test", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/caution-test-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/caution-test-pos", 0, 0.1);
    }
});

setlistener("/controls/lighting/taxi-lights", func(v) {
    if(v.getValue()){
        interpolate("/controls/lighting/taxi-lights-pos", 1, 0.1);
    }else{
        interpolate("/controls/lighting/taxi-lights-pos", 0, 0.1);
    }
});

setlistener("/controls/anti-ice/pitot-heat", func(v) {
    if(v.getValue()){
        interpolate("/controls/anti-ice/pitot-heat-pos", 1, 0.1);
    }else{
        interpolate("/controls/anti-ice/pitot-heat-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/engine[0]/generator", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/engine[0]/generator-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/engine[0]/generator-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/engine[1]/generator", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/engine[1]/generator-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/engine[1]/generator-pos", 0, 0.1);
    }
});

setlistener("/controls/flight/flaplever", func(v) {
    interpolate("/controls/flight/flaplever-pos", v.getValue(), 0.1);
});

setlistener("/controls/engines/auto-feather", func(v) {
    interpolate("/controls/engines/auto-feather-pos", v.getValue(), 0.1);
});

setlistener("/controls/engines/engine[0]/cutoff", func(v) {
    if(v.getValue()){
        interpolate("/controls/engines/engine[0]/cutoff-pos", 1, 0.1);
    }else{
        interpolate("/controls/engines/engine[0]/cutoff-pos", 0, 0.1);
    }
});

setlistener("/controls/engines/engine[1]/cutoff", func(v) {
    if(v.getValue()){
        interpolate("/controls/engines/engine[1]/cutoff-pos", 1, 0.1);
    }else{
        interpolate("/controls/engines/engine[1]/cutoff-pos", 0, 0.1);
    }
});

setlistener("/controls/engines/fire-test", func(v) {
    if(v.getValue()){
        interpolate("/controls/engines/fire-test-pos", 1, 0.1);
    }else{
        interpolate("/controls/engines/fire-test-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/aft-boost-pump", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/aft-boost-pump-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/aft-boost-pump-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/fwd-boost-pump", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/fwd-boost-pump-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/fwd-boost-pump-pos", 0, 0.1);
    }
});

setlistener("/controls/fuel/tank-selector", func(v) {
    interpolate("/controls/fuel/tank-selector-pos", v.getValue(), 0.1);
});

setlistener("/controls/fuel/ind-test", func(v) {
    if(v.getValue()){
        interpolate("/controls/fuel/ind-test-pos", 1, 0.1);
    }else{
        interpolate("/controls/fuel/ind-test-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/ammeter-switch", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/ammeter-switch-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/ammeter-switch-pos", 0, 0.1);
    }
});

setlistener("/controls/switches/firebell-switch-cover", func(v) {
    if(v.getValue()){
        interpolate("/controls/switches/firebell-switch-cover-pos", 1, 0.1);
    }else{
        interpolate("/controls/switches/firebell-switch-cover-pos", 0, 0.1);
    }
});

setlistener("/controls/switches/firebell-switch", func(v) {
    if(v.getValue()){
        interpolate("/controls/switches/firebell-switch-pos", 1, 0.1);
    }else{
        interpolate("/controls/switches/firebell-switch-pos", 0, 0.1);
    }
});

setlistener("/controls/gear/parkingbrake-lever", func(v) {
    if(v.getValue()){
        interpolate("/controls/gear/parkingbrake-lever-pos", 1, 0.1);
    }else{
        interpolate("/controls/gear/parkingbrake-lever-pos", 0, 0.1);
    }
});

setlistener("/controls/armament/station[5]/release-all", func(v) {
    if(v.getValue()){
        interpolate("/controls/armament/station[5]/release-all-pos", 1, 0.1);
    }else{
        interpolate("/controls/armament/station[5]/release-all-pos", 0, 0.1);
    }
});

setlistener("/controls/armament/station[6]/release-all", func(v) {
    if(v.getValue()){
        interpolate("/controls/armament/station[6]/release-all-pos", 1, 0.1);
    }else{
        interpolate("/controls/armament/station[6]/release-all-pos", 0, 0.1);
    }
});

setlistener("/instrumentation/dme/switch-position", func(v) {
    interpolate("/instrumentation/dme/switch-position-pos", v.getValue(), 0.1);
});

setlistener("/instrumentation/dme[0]/power-btn", func(v) {
    if(v.getValue()){
        interpolate("/instrumentation/dme[0]/power-btn-pos", 1, 0.1);
    }else{
        interpolate("/instrumentation/dme[0]/power-btn-pos", 0, 0.1);
    }
});

setlistener("/instrumentation/dme/switch-min-kts", func(v) {
    if(v.getValue()){
        interpolate("/instrumentation/dme/switch-min-kts-pos", 1, 0.1);
    }else{
        interpolate("/instrumentation/dme/switch-min-kts-pos", 0, 0.1);
    }
});

setlistener("/instrumentation/transponder/inputs/ident-btn", func(v) {
    if(v.getValue()){
        interpolate("/instrumentation/transponder/inputs/ident-btn-pos", 1, 0.1);
    }else{
        interpolate("/instrumentation/transponder/inputs/ident-btn-pos", 0, 0.1);
    }
});

setlistener("/instrumentation/elt/on", func(v) {
    if(v.getValue()){
        interpolate("/instrumentation/elt/on-pos", 1, 0.1);
    }else{
        interpolate("/instrumentation/elt/on-pos", 0, 0.1);
    }
});
