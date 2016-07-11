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

# Circuit breakers
# Main
setlistener("/controls/electric/circuit-breakers/main/invr-cont", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/invr-cont-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/invr-cont-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/va", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/va-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/va-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/wing-insp-lt", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/wing-insp-lt-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/wing-insp-lt-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/c400-fail", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/c400-fail-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/c400-fail-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/beta-sys", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/beta-sys-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/beta-sys-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/start-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/start-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/start-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/start-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/start-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/start-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/r-gen-fail", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/r-gen-fail-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/r-gen-fail-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/l-gen-fail", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/l-gen-fail-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/l-gen-fail-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ign-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ign-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ign-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ign-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ign-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ign-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/l-t5-temp", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/l-t5-temp-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/l-t5-temp-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/r-t5-temp", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/r-t5-temp-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/r-t5-temp-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bleed-air-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bleed-air-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bleed-air-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bleed-air-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bleed-air-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bleed-air-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ws-wiper", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ws-wiper-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ws-wiper-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/int-defl", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/int-defl-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/int-defl-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/prop-deice", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/prop-deice-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/prop-deice-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/over-speed-gov", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/over-speed-gov-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/over-speed-gov-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/pitot-htr-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/pitot-htr-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/pitot-htr-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/pitot-htr-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/pitot-htr-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/pitot-htr-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/hyd-oil-pump", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/hyd-oil-pump-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/hyd-oil-pump-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fuel-xfeed", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fuel-xfeed-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fuel-xfeed-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/temp-comp-htr-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/temp-comp-htr-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/temp-comp-htr-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/temp-comp-htr-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/temp-comp-htr-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/temp-comp-htr-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/prop-auto-feath", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/prop-auto-feath-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/prop-auto-feath-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bst-pump-fwd-1", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-fwd-1-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-fwd-1-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bst-pump-fwd-2", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-fwd-2-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-fwd-2-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fuel-sov-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fuel-sov-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fuel-sov-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fuel-sov-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fuel-sov-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fuel-sov-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bst-pump-aft-1", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-aft-1-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-aft-1-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bst-pump-aft-2", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-aft-2-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-aft-2-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fuel-l-level-aft", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fuel-l-level-aft-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fuel-l-level-aft-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fuel-l-level-fwd", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fuel-l-level-fwd-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fuel-l-level-fwd-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bst-pump-press-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-press-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-press-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/bst-pump-press-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-press-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/bst-pump-press-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fire-ext-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fire-ext-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fire-ext-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fire-ext-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fire-ext-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fire-ext-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/oil-temp-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/oil-temp-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/oil-temp-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/oil-temp-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/oil-temp-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/oil-temp-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fire-det-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fire-det-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fire-det-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fire-det-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fire-det-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fire-det-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/oil-low-press-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/oil-low-press-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/oil-low-press-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/oil-low-press-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/oil-low-press-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/oil-low-press-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/stall-warn", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/stall-warn-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/stall-warn-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fire-det-fault-ind-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fire-det-fault-ind-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fire-det-fault-ind-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/fire-det-fault-ind-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/fire-det-fault-ind-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/fire-det-fault-ind-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/posn-lt", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/posn-lt-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/posn-lt-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/caut-lt-dim", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/caut-lt-dim-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/caut-lt-dim-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/anti-coll-lt", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/anti-coll-lt-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/anti-coll-lt-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/flt-comp-lt", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/flt-comp-lt-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/flt-comp-lt-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/pilot-eng-cons-trim-pnl-lt", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/pilot-eng-cons-trim-pnl-lt-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/pilot-eng-cons-trim-pnl-lt-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/copilot-rad-va-pnl-lt", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/copilot-rad-va-pnl-lt-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/copilot-rad-va-pnl-lt-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/cabin-ht-vent", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/cabin-ht-vent-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/cabin-ht-vent-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ldg-lt-l", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ldg-lt-l-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ldg-lt-l-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ldg-lt-r", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ldg-lt-r-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ldg-lt-r-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ail-trim-ind", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ail-trim-ind-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ail-trim-ind-pos", 0, 0.1);
    }
});

setlistener("/controls/electric/circuit-breakers/main/ail-trim-act", func(v) {
    if(v.getValue()){
        interpolate("/controls/electric/circuit-breakers/main/ail-trim-act-pos", 1, 0.1);
    }else{
        interpolate("/controls/electric/circuit-breakers/main/ail-trim-act-pos", 0, 0.1);
    }
});
