#### OpenCore Update Record
- 2020-03-23
	1. Update the AppleALC fake layout-id in config.plst to 66 to make the sound driver more stable.
    
	2. Close the TPXX hot patch of ACPI in config.plst and its related patches. Although using TPXX can make the touch pad experience the interruption of APIC, it will make the CPU and temperature extremely high. If you need it, you can turn it on, but I don't recommend you to do so.

</br>

------------

</br>

#### Clover Update Record
- None~