ENT.Type = "anim"ENT.Base = "hzn_production_ent" ENT.PrintName		= "Water Pump"ENT.Author			= "Bynari"ENT.AutomaticFrameAdvance = true -- item descriptionlocal desc = {}	desc[1] = "Water Pump"	desc[2] = "----------------------"	desc[3] = "Pumps water out of a lake or ocean."	desc[6] = ""	desc[7] = "Required resources:"	desc[8] = ""	desc[9] = "[0] Morphite"	desc[10] = "[0] Nocxium"	desc[11] = "[0] Isogen"-- production requirementslocal req = {}	req["morphite"] = 0	req["nocxium"] = 0	req["isogen"] = 0	-- factory entrylocal Entry = {}	Entry.DisplayName = ENT.PrintName	Entry.Description = desc	Entry.ClassName = "water_pump"	Entry.BuildTime = 10	Entry.Costs = req	-- register entry with gamemodeGAMEMODE:RegisterFactoryEntry( Entry )