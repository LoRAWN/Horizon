ENT.Type = "anim"ENT.Base = "hzn_storage_ent" ENT.PrintName		= "Air Tank"ENT.Author			= "Bynari"ENT.Purpose			= "Air Storage"-- item descriptionlocal desc = {}	desc[1] = "Air Tank"	desc[2] = "----------------------"	desc[3] = "Stores air."	desc[6] = ""	desc[7] = "Required resources:"	desc[8] = ""	desc[9] = "[0] Morphite"	desc[10] = "[0] Nocxium"	desc[11] = "[0] Isogen"-- production requirementslocal req = {}	req["morphite"] = 0	req["nocxium"] = 0	req["isogen"] = 0	-- factory entrylocal Entry = {}	Entry.DisplayName = ENT.PrintName	Entry.Description = desc	Entry.ClassName = "air_tank"	Entry.BuildTime = 10	Entry.Costs = req	-- register entry with gamemodeGAMEMODE:RegisterFactoryEntry( Entry )