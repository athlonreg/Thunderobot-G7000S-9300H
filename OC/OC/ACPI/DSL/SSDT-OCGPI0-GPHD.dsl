// GPI0 enable
DefinitionBlock("", "SSDT", 2, "ACDT", "GPI0", 0)
{
    External(GPHD, FieldUnitObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPHD = 0
        }
    }
}
//EOF