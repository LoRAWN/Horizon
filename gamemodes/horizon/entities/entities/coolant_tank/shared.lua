ENT.Type = "anim"ENT.Base = "hzn_storage_ent" ENT.PrintName		= "Coolant Tank"ENT.Author			= "Bynari"ENT.Purpose			= "Coolant Storage"-- item descriptionlocal desc = {}	desc[1] = "Stores 1200 units of coolant."-- production requirementslocal req = {}	req["morphite"] = 0	req["nocxium"] = 0	req["isogen"] = 0	-- factory entrylocal Entry = {}	Entry.DisplayName = ENT.PrintName	Entry.Description = desc	Entry.ClassName = "coolant_tank"	Entry.BuildTime = 10	Entry.Costs = req	-- register entry with gamemodeGAMEMODE:RegisterFactoryEntry( Entry )