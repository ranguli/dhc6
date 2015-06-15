var Radio = gui.Dialog.new("/sim/gui/dialogs/radios/dialog",
        "Aircraft/dhc6/systems/tranceivers.xml");
#var ap_settings = gui.Dialog.new("/sim/gui/dialogs/autopilot/dialog",
#        "Aircraft/dhc6/systems/autopilot.xml");
var options = gui.Dialog.new("/sim/gui/dialogs/options/dialog",
        "Aircraft/dhc6/systems/options.xml");
var throttles = gui.Dialog.new("/sim/gui/dialogs/throttles/dialog",
        "Aircraft/dhc6/systems/throttles.xml");
gui.menuBind("radio", "dialogs.Radio.open()");
#gui.menuBind("autopilot-settings", "dialogs.ap_settings.open()");