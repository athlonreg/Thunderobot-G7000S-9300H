#### OpenCore Update Record

- 2020-04-13
	1. VoodooI2C updated to 2.4 (VoodooInput is integrated into the VoodooI2C plug-in)

	2. Update VirtualSMC family bucket

	3. Update TPXX hotpatch
	
	4. Update OpenCore to 0.5.8 previous version

- 2020-04-07
	1. Update AppleALC to 1.4.8

	2. Update VoodooInput to 1.0.4 ( Integrate VoodooInput to VoodooPS2 Plugln )

	3. Update VoodooPS2 to 2.1.3

	4. Update VoodooI2C to 2.3 ( Adjust VoodooInput load before VoodooI2C )

	5. Update Lilu to 1.4.3

	6. Update WhateverGreen to 1.3.8

	7. Update VirtualSMC to 1.1.2

	8. Update NVMeFix to 1.0.2

	9. Update CPUFriend and NoTouchID to use Lilu 1.4.3 APIs

	10. Update IntelBluetoothFirmware and IntelBluetoothInjector to 1.0.3

	11. Update OpenCore to 0.5.7 release


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

- 2020-04-07
	1. Update CLOVER to 5108.
	2. Please refer to OpenCore for other updates.

- 2020-03-30: Refer to OpenCore update.