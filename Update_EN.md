#### OpenCore Update Record

- 2020-03-30
	1. Clean up useless ACPI files.

	2. Fix CPU frequency fo Catalina 10.15.4.


- 2020-03-25
	1. Update the TPXX hot patch of GPI0 interrupt and ACPI interrupt, but the problem of APIC interrupt is still not fixed (no more repair, waste time), and it is not recommended to use APIC interrupt. (GPI0 interrupt patch and APIC interrupt patch cannot coexist. When GPI0 is turned on, APIC must be turned off. The same is true for APIC.)

	2. Update I2C related drivers.


- 2020-03-23
	1. Update the AppleALC fake layout-id in config.plst to 66 to make the sound driver more stable.
    
	2. Turn off the TPXX hotfix in config.plst and its related patches. Although using TPXX can make the touch pad experience the interruption of APIC, it will make the CPU and temperature extremely high. If you need it, you can turn it on, but I don't recommend you to do so.

</br>

------------

</br>

#### Clover Update Record

- 2020-03-30: Refer to OpenCore update.