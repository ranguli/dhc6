# dhc6-300

Simulation of the DHC-6-300 Twin Otter for the Flight Gear flight simulator.

## Ideas and To-Do list
- [] Flight deck re-texturing
- [] Cabin re-texturing
- [] Implementation of [IntegratedSystems](https://wiki.flightgear.org/IntegratedSystems)
- [] Convert amphibious, ski, and float configurations to JSBSim
- [] Add tundra tire configuration
- [] Implement reverse thrusters in JSBSim

## Credits (Original)
* Syd Adams (syd_cyyf):             Initial model, 3D modelling, Textures, FDM, Sound, Systems,
                                    Nasal scripting, etc.
* Christian Thiriot (PATTEN):       Texturing, 3D Modelling, Instruments, etc.
* Bo Lan (lanbo64):                 Systems, Nasal scripting, FDM, Autopilot, Instruments, etc.
* Jonathan Schellhase (dg-505):     Current maintenance, 3D modelling, Systems, Checklists, Tutorials,
                                    Sound, Nasal, 2D panel, Artwork, etc.
* Tim Dicus (SurferTim):            Engine upgrade, autopilot, nasal, etc.

Other contributors:
Clément de l'Hamaide, (f-jjth), PAF Team, Zdenal, Erik, abassign, primtala2,
tauchergreg: Intensive bug hunting, Adam Swift (Mig29pilot): Artwork,
Sebastian (rollershutter), Adrian Serrano (asr), the whole FlightGear community

Special thanks to Thorsten Renk for giving us the wonderful effects of
the ALS framework and to the Cessna 172P development team for the
pioneering work they did regarding the securing procedures and the
environment sounds!

## Technical Data

- [Standard Operating Procedures](https://web.archive.org/web/20170224162942/https://www.blm.gov/style/medialib/blm/nifc/av.Par.70826.File.tmp/SOPA_otter.pdf)
- [FAA Type Certificate Data Sheet](https://web.archive.org/web/20231216223735/http://man.fas.org/dod-101/sys/ac/docs/a9ea.pdf)

### Performance data

| Aircraft Model | Document Link            |
|----------------|--------------------------|
| **DHC6-300 (this aircraft)**   | [PSM-1-63-1A (Section 4)](https://web.archive.org/web/20170324171425/http://www.caamsllc.com/Performance%20Data/DHC-6-300.pdf)    |
| DHC6-200       | [PSM-1-62-1A (Section 4)](https://web.archive.org/web/20170324040942/http://www.caamsllc.com:80/Performance%20Data/DHC-6-200.pdf) |
| DHC6-100       | [PSM-1-61-1A (Section 4)](https://web.archive.org/web/20170324100753/http://www.caamsllc.com:80/Performance%20Data/DHC-6-100.pdf) |