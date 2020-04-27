//Disables DGPU
DefinitionBlock("", "SSDT", 2, "hack", "NDGP", 0)
{
    External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj)
    
    Device(DGPU)
    {
        Name(_HID, "DGPU1000")
        Method(_INI)
        {
            If (_OSI ("Darwin"))
            {
                \_SB.PCI0.PEG0.PEGP._OFF ()
            }
        }
        
        Method (_STA)
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
    }
}
//EOF