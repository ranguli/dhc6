var birds_eye_view = func {

    if (getprop("/sim/current-view/view-number-raw") == 105) {
        setprop("/sim/current-view/pitch-offset-deg", 0);
        setprop("/sim/current-view/x-offset-deg", 0);
        setprop("/sim/current-view/y-offset-deg", 500);
        setprop("/sim/current-view/xz-offset-deg", -0.0001);
    }


    settimer(birds_eye_view, 0);

}

setlistener("/sim/signals/fdm-initialized", birds_eye_view);