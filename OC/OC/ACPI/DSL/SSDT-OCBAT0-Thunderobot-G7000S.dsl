// battery for thunderobot g7000s
// In config ACPI, UPBI to XPBI
// Find:     5550424900
// Replace:  5850424900
//
// In config ACPI, UPBS to XPBS
// Find:     5550425300
// Replace:  5850425300
//
// In config ACPI, _Q35 to XQ35
// Find:     5f51333500
// Replace:  5851333500
//
// In config ACPI, _Q37 to XQ37
// Find:     5f51333700
// Replace:  5851333700
//
DefinitionBlock ("", "SSDT", 2, "ACDT", "BAT0", 0)
{
    External (_SB.BAT0, DeviceObj)
    External (_SB.PCI0.LPCB.EC, DeviceObj)
    External (_SB.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB.PCI0.LPCB.EC.BAT0, DeviceObj)
    //
    External (P80H, FieldUnitObj)
    External (NVBB, FieldUnitObj)
    External (GPSL, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC.BBST, FieldUnitObj)
    //
    External (_SB.AC.ADJP, MethodObj)
    External (_SB.BAT0.IVBI, MethodObj)
    External (_SB.BAT0.IVBS, MethodObj)
    External (_SB.BAT0.XQ35, MethodObj)
    External (_SB.BAT0.XQ37, MethodObj)
    External (_SB.BAT0.XPBI, MethodObj)
    External (_SB.BAT0.XPBS, MethodObj)
    External (_SB.PCI0.LPCB.EC.WNTY, MethodObj)
    //
    External (_SB.BAT0.PBIF, PkgObj)
    External (_SB.BAT0.PBST, PkgObj)
    //
    External (_SB.AC.ACFG, IntObj)
    External (_SB.BAT0.BFCC, IntObj)
    External (_SB.PCI0.LPCB.EC.B15C, IntObj)
    External (_SB.PCI0.LPCB.EC.SLFG, IntObj)
    
    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }
    
    Method (B1B4, 4, NotSerialized)
    {
        Store(Arg3, Local0)
        Or(Arg2, ShiftLeft(Local0, 8), Local0)
        Or(Arg1, ShiftLeft(Local0, 8), Local0)
        Or(Arg0, ShiftLeft(Local0, 8), Local0)
        Return(Local0)
    }

    Scope (_SB.PCI0.LPCB.EC)
    {
        OperationRegion (BRAM, SystemMemory, 0xFF500100, 0x0400)
		Field (BRAM, ByteAcc, Lock, Preserve)
		{
			Offset (0x10), 
			,    1, 
			,   1, 
			,   1, 
			,   1, 
				,   3, 
			,   1, 
			,   8, 
			,   32, 
			DC00,8,DC01,8,DC02,8,DC03,8, //BDC0,   32, 
			FC00,8,FC01,8,FC02,8,FC03,8, //BFC0,   32, 
			,   32, 
			DV00,8,DV01,8,DV02,8,DV03,8, //BDV0,   32, 
			ST00,8,ST01,8,ST02,8,ST03,8, //BST0,   32, 
			PR00,8,PR01,8,PR02,8,PR03,8, //BPR0,   32, 
			RC00,8,RC01,8,RC02,8,RC03,8, //BRC0,   32, 
			PV00,8,PV01,8,PV02,8,PV03,8, //BPV0,   32, 
			,   16, 
			,   16, 
			CW00,8,CW01,8,CW02,8,CW03,8, //BCW0,   32, 
			C000,8,C001,8,C002,8,C003,8, //BCL0,   32, 
			Offset (0xC7), 
			,   8, 
			,   8, 
			,   8, 
			EM30,8,EM31,8, //OEM3,   16, 
		}
    }
    
    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q35, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                P80H = 0x35
                If ((B1B2 (EM30, EM31) & 0x8000))
                {
                    SLFG = One
                    WNTY (0xDE, 0xDE)
                }
                Else
                {
                    SLFG = Zero
                    WNTY (0xDF, 0xDF)
                }

                ^^^^AC.ADJP (Zero)
            }
            Else
            {
                \_SB.BAT0.XQ35 ()
            }
        }
            
        Method (_Q37, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                P80H = 0x37
                Local0 = B1B2 (EM30, EM31)
                If ((Local0 & 0x2000))
                {
                    B15C = One
                }
                Else
                {
                    B15C = Zero
                }

                If ((NVBB & 0xFFFF))
                {
                    If ((Local0 & 0x2000))
                    {
                        Local1 = (((NVBB >> 0x08) & 0xFF) + (NVBB & 0xFF
                            ))
                        Local1--
                    }
                    Else
                    {
                        Local1 = (NVBB & 0x0F)
                    }

                    BBST = (((NVBB >> 0x04) & 0xF0) | Local1)
                    If (GPSL)
                    {
                        If (CondRefOf (\_SB.PCI0.PEG0.PEGP))
                        {
                            Notify (^^^PEG0.PEGP, (Local1 | 0xD0))
                        }
                    }
                }

                ^^^^AC.ADJP (Zero)
            }
            Else
            {
                \_SB.BAT0.XQ37 ()
            }
        }
    }
    
    Scope (_SB.BAT0)
    {
        Method (UPBI, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (^^PCI0.LPCB.EC.BAT0)
                {
                    Local0 = (B1B4 (^^PCI0.LPCB.EC.DC00,^^PCI0.LPCB.EC.DC01,^^PCI0.LPCB.EC.DC02,^^PCI0.LPCB.EC.DC03) & 0xFFFF)
                    PBIF [One] = Local0
                    Local0 = (B1B4 (^^PCI0.LPCB.EC.FC00,^^PCI0.LPCB.EC.FC01,^^PCI0.LPCB.EC.FC02,^^PCI0.LPCB.EC.FC03) & 0xFFFF)
                    PBIF [0x02] = Local0
                    BFCC = Local0
                    Local0 = (B1B4 (^^PCI0.LPCB.EC.DV00,^^PCI0.LPCB.EC.DV01,^^PCI0.LPCB.EC.DV02,^^PCI0.LPCB.EC.DV03) & 0xFFFF)
                    PBIF [0x04] = Local0
                    Local0 = (B1B4 (^^PCI0.LPCB.EC.CW00,^^PCI0.LPCB.EC.CW01,^^PCI0.LPCB.EC.CW02,^^PCI0.LPCB.EC.CW03) & 0xFFFF)
                    PBIF [0x05] = Local0
                    Local0 = (B1B4 (^^PCI0.LPCB.EC.C000,^^PCI0.LPCB.EC.C001,^^PCI0.LPCB.EC.C002,^^PCI0.LPCB.EC.C003) & 0xFFFF)
                    PBIF [0x06] = Local0
                    PBIF [0x09] = "BAT"
                    PBIF [0x0A] = "0001"
                    PBIF [0x0B] = "LION"
                    PBIF [0x0C] = "Notebook"
                }
                Else
                {
                    IVBI ()
                }
            }
            Else
            {
                \_SB.BAT0.XPBI()
            }
        }
            
        Method (UPBS, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (^^PCI0.LPCB.EC.BAT0)
                {
                    Local0 = Zero
                    Local1 = Zero
                    If (^^AC.ACFG)
                    {
                        If (((B1B4 (^^PCI0.LPCB.EC.ST00,^^PCI0.LPCB.EC.ST01,^^PCI0.LPCB.EC.ST02,^^PCI0.LPCB.EC.ST03) & 0x02) == 0x02))
                        {
                            Local0 |= 0x02
                            Local1 = (B1B4 (^^PCI0.LPCB.EC.PR00,^^PCI0.LPCB.EC.PR01,^^PCI0.LPCB.EC.PR02,^^PCI0.LPCB.EC.PR03) & 0xFFFF)
                        }
                    }
                    Else
                    {
                        Local0 |= One
                        Local1 = (B1B4 (^^PCI0.LPCB.EC.PR00,^^PCI0.LPCB.EC.PR01,^^PCI0.LPCB.EC.PR02,^^PCI0.LPCB.EC.PR03) & 0xFFFF)
                    }

                    Local7 = (Local1 & 0x8000)
                    If ((Local7 == 0x8000))
                    {
                        Local1 ^= 0xFFFF
                    }

                    Local2 = (B1B4 (^^PCI0.LPCB.EC.RC00,^^PCI0.LPCB.EC.RC01,^^PCI0.LPCB.EC.RC02,^^PCI0.LPCB.EC.RC03) & 0xFFFF)
                    Local3 = (B1B4 (^^PCI0.LPCB.EC.PV00,^^PCI0.LPCB.EC.PV01,^^PCI0.LPCB.EC.PV02,^^PCI0.LPCB.EC.PV03) & 0xFFFF)
                    PBST [Zero] = Local0
                    PBST [One] = Local1
                    PBST [0x02] = Local2
                    PBST [0x03] = Local3
                    If ((BFCC != B1B4 (^^PCI0.LPCB.EC.FC00,^^PCI0.LPCB.EC.FC01,^^PCI0.LPCB.EC.FC02,^^PCI0.LPCB.EC.FC03)))
                    {
                        Notify (BAT0, 0x81)
                    }
                }
                Else
                {
                    IVBS ()
                }
            }
            Else
            {
                \_SB.BAT0.XPBS()
            }
        }
    }
}

