###########################################################################
# Copyright (C) 2021  by Simworld2020
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.														
###########################################################################

# Nasal functions for KMA20 audio panel

# State variables

var COM1Noise  	= ("instrumentation/comm/add-noise");
var COM1Sig 	= ("instrumentation/comm/cutoff-signal-quality");
var COM2Noise  	= ("instrumentation/comm[1]/add-noise");
var COM2Sig 	= ("instrumentation/comm[1]/cutoff-signal-quality");
var nav1Audio	= ("instrumentation/nav/audio-btn");
var nav2Audio	= ("instrumentation/nav[1]/audio-btn");
var adfAudio	= ("instrumentation/adf/ident-audible");
var dmeAudio	= ("instrumentation/dme/ident");
var mkrAudio	= ("instrumentation/marker-beacon/audio-btn");
var knob		= ("instrumentation/kma20/knob");
var auto		= ("instrumentation/kma20/auto");
var com1		= ("instrumentation/kma20/com1");
var com2		= ("instrumentation/kma20/com2");
var nav1		= ("instrumentation/kma20/nav1");
var nav2		= ("instrumentation/kma20/nav2");
var adf			= ("instrumentation/kma20/adf");
var dme			= ("instrumentation/kma20/dme");
var mkr			= ("instrumentation/kma20/mkr");
var ptt0		= ("instrumentation/comm/ptt");
var ptt1		= ("instrumentation/comm[1]/ptt");

# Functions

var COM1Mute = func {
	setprop(COM1Noise, 0);
	setprop(COM1Sig, 1111);
}

var COM1Unmute = func {
	setprop(COM1Noise, 1);
	setprop(COM1Sig, 0.4);
}

var COM2Mute = func {
	setprop(COM2Noise, 0);
	setprop(COM2Sig, 1111);
}

var COM2Unmute = func {
	setprop(COM2Noise, 1);
	setprop(COM2Sig, 0.4);
}

var autoOn = func {
	if (getprop(knob) == -1){
		COM2Mute();
		COM1Unmute();
		}
		else if (getprop(knob) == 0){
			COM1Mute();
			COM2Unmute();
			}
		else if (getprop(knob) == 1){
			COM1Mute();
			COM2Mute();
			}
}

var autoOff = func {
	if (getprop(com1) != 0){
		COM1Unmute();
		}
		else {
			COM1Mute();
			}
	if (getprop(com2) != 0){
		COM2Unmute();
		}
		else {
			COM2Mute();
			}
}

var autoFunction = func {
	if ((getprop(ptt0)) or (getprop(ptt1))){
		COM1Mute();
		COM2Mute();
		}
		else {
			if (getprop(auto) != 0){
			autoOn();
			}
			else {
				autoOff();
				}
		}
}

var init = func {
	if (!getprop(nav1)) {
		setprop(nav1Audio, 0);
		}else{
			septrop(nav1Audio, 1);
			}
	if (!getprop(nav2)) {
		setprop(nav2Audio, 0);
		}else{
			septrop(nav2Audio, 1);
			}
	if (!getprop(adf)) {
		setprop(adfAudio, 0);
		}else{
			septrop(adfAudio, 1);
			}
	if (!getprop(dme)) {
		setprop(dmeAudio, 0);
		}else{
			septrop(dmeAudio, 1);
			}
	if (!getprop(mkr)) {
		setprop(mkrAudio, 0);
		}else{
			septrop(mkrAudio, 1);
			}
	autoFunction();
}

# Listeners
setlistener("sim/signals/fdm-initialized",			init);
setlistener("instrumentation/comm/serviceable", 	init);
setlistener("instrumentation/comm/selected-mhz",	init);
setlistener("instrumentation/comm/standby-mhz",		init);
setlistener("instrumentation/comm[1]/serviceable", 	init);
setlistener("instrumentation/comm[1]/selected-mhz",	init);
setlistener("instrumentation/comm[1]/standby-mhz",	init);
setlistener("instrumentation/nav/serviceable", 		init);
setlistener("instrumentation/nav/selected-mhz",		init);
setlistener("instrumentation/nav/standby-mhz",		init);
setlistener("instrumentation/nav[1]/serviceable", 	init);
setlistener("instrumentation/nav[1]/selected-mhz",	init);
setlistener("instrumentation/nav[1]/standby-mhz",	init);
setlistener("instrumentation/adf/serviceable", 		init);
setlistener("instrumentation/adf/selected-khz",		init);
setlistener("instrumentation/adf/standby-khz",		init);
setlistener("instrumentation/adf[1]/serviceable", 	init);
setlistener("instrumentation/adf[1]/selected-khz",	init);
setlistener("instrumentation/adf[1]/standby-khz",	init);
setlistener("instrumentation/dme/power-btn", 		init);
setlistener("instrumentation/dme/selected-mhz",		init);
setlistener("instrumentation/dme/source",			init);
setlistener("instrumentation/mkr[1]/serviceable", 	init);
setlistener("instrumentation/mkr[1]/selected-mhz",	init);
setlistener("instrumentation/mkr[1]/standby-mhz",	init);
setlistener("instrumentation/comm/ptt", 			autoFunction);
setlistener("instrumentation/comm[1]/ptt", 			autoFunction);
setlistener("instrumentation/kma20/knob",			autoFunction);
setlistener("instrumentation/kma20/auto",			autoFunction);
setlistener("instrumentation/kma20/com1",			autoFunction);
setlistener("instrumentation/kma20/com2",			autoFunction);

print("KMA20 Audio Panel helpers loaded.");

#end
