DefinitionBlock("", "SSDT", 2, "ACDT", "I2C-TPXX", 0)
{
    External(_SB.PCI0.I2C0, DeviceObj)
    External(TPDM, FieldUnitObj)
    External(GPDI, FieldUnitObj)
    External(TPDT, FieldUnitObj)
    External(TPDH, FieldUnitObj)
    External(TPDS, FieldUnitObj)
    External(TPDB, FieldUnitObj)
    External(_SB.SHPO, MethodObj)
    External(_SB.GNUM, MethodObj)
    External(_SB.INUM, MethodObj)
    External(_SB.PCI0.HIDD, MethodObj)
    External(_SB.PCI0.TP7D, MethodObj)
    External(_SB.PCI0.HIDG, IntObj)
    External(_SB.PCI0.TP7G, IntObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            TPDT = 0
        }
    }
    
    //path:_SB.PCI0.I2C0
    Scope (_SB.PCI0.I2C0)
    {
        Device (TPXX)
        {
            Name (HID2, Zero)
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0020, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                    0x00, ResourceConsumer, _Y2B, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y2C)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PCI0.I2C0.TPXX._Y2B._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PCI0.I2C0.TPXX._Y2B._SPE, SPED)  // _SPE: Speed
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PCI0.I2C0.TPXX._Y2C._INT, INT2)  // _INT: Interrupts
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                INT1 = GNUM (GPDI)
                INT2 = INUM (GPDI)
                If ((TPDM == Zero))
                {
                    SHPO (GPDI, One)
                }

                If (One)
                {
                    _HID = "SYNA1202"
                    HID2 = TPDH /* \TPDH */
                    BADR = TPDB /* \TPDB */
                    If ((TPDS == Zero))
                    {
                        SPED = 0x000186A0
                    }

                    If ((TPDS == One))
                    {
                        SPED = 0x00061A80
                    }

                    If ((TPDS == 0x02))
                    {
                        SPED = 0x000F4240
                    }

                    Return (Zero)
                }
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If ((Arg0 == TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                //Return (ConcatenateResTemplate (SBFB, SBFG))
                Return (ConcatenateResTemplate (SBFB, SBFI))
            }
        }
    }
}
//EOF