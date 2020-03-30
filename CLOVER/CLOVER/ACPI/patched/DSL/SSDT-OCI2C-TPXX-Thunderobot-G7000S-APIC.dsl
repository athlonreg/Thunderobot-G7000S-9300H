//
// Rename SSCN to XSCN
// Find:5353434e
// Replace:5853434e

// Rename FMCN to XMCN
// Find:464d434e
// Replace:584d434e
//
DefinitionBlock ("", "SSDT", 2, "ACDT", "I2C-TPXX", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments
    External (_SB_.INUM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GPI0._HID, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.HIDD, MethodObj)    // 5 Arguments
    External (_SB_.PCI0.HIDG, IntObj)
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C0.XMCN, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.I2C0.XSCN, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.TP7D, MethodObj)    // 6 Arguments
    External (_SB_.PCI0.TP7G, IntObj)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments
    External (FMD0, IntObj)
    External (FMH0, IntObj)
    External (FML0, IntObj)
    External (GPDI, FieldUnitObj)
    External (SSD0, IntObj)
    External (SSD1, IntObj)
    External (SSH0, IntObj)
    External (SSH1, IntObj)
    External (SSL0, IntObj)
    External (SSL1, IntObj)
    External (TPDB, FieldUnitObj)
    External (TPDH, FieldUnitObj)
    External (TPDM, FieldUnitObj)
    External (TPDS, FieldUnitObj)
    External (TPDT, FieldUnitObj)
    External (USTP, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            TPDT = Zero
            Method (XXEN, 0, NotSerialized)
            {
                If (((\_SB.PCI0.GPI0._HID () == "INT344B") || (\_SB.PCI0.GPI0._HID () == "INT345D")))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (PKGX, 3, Serialized)
            {
                Name (PKG, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                PKG [Zero] = Arg0
                PKG [One] = Arg1
                PKG [0x02] = Arg2
                Return (PKG) /* \PKGX.PKG_ */
            }
        }
    }

    Scope (_SB.PCI0.I2C0)
    {
        Method (SSCN, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (((CondRefOf (SSH0) && CondRefOf (SSL0)) && CondRefOf (SSD0)))
                {
                    Return (PKGX (SSH0, SSL0, SSD0))
                }

                If (\XXEN ())
                {
                    Return (PKGX (0x01B0, 0x01FB, 0x1E))
                }

                Return (PKGX (0x03F2, 0x043D, 0x62))
            }
            ElseIf (CondRefOf (\_SB.PCI0.I2C0.XSCN))
            {
                If (USTP)
                {
                    Return (\_SB.PCI0.I2C0.XSCN ())
                }
            }

            Return (Zero)
        }

        Method (FMCN, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (((CondRefOf (FMH0) && CondRefOf (FML0)) && CondRefOf (FMD0)))
                {
                    Return (PKGX (FMH0, FML0, FMD0))
                }

                If (\XXEN ())
                {
                    Return (PKGX (0x48, 0xA0, 0x1E))
                }

                Return (PKGX (0x0101, 0x012C, 0x62))
            }
            ElseIf (CondRefOf (\_SB.PCI0.I2C0.XMCN))
            {
                If (USTP)
                {
                    Return (\_SB.PCI0.I2C0.XMCN ())
                }
            }

            Return (Zero)
        }

        Device (TPXX)
        {
            Name (HID2, Zero)
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0020, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                    0x00, ResourceConsumer, _Y00, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0107
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y01)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PCI0.I2C0.TPXX._Y00._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PCI0.I2C0.TPXX._Y00._SPE, SPED)  // _SPE: Speed
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PCI0.I2C0.TPXX._Y01._INT, INT2)  // _INT: Interrupts
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
                    HID2 = TPDH /* External reference */
                    BADR = TPDB /* External reference */
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
                     0x00
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
                Return (ConcatenateResTemplate (SBFB, SBFI)) // Working mode: APIC
                // Return (ConcatenateResTemplate (SBFB, SBFG)) // Working mode: GPI0
            }
        }
    }
}
