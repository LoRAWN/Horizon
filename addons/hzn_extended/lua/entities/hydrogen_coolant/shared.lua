ENT.Type = "anim"ENT.Base = "hzn_production_ent" ENT.PrintName		= "Hydrogen Coolant Compressor"ENT.Author			= "Bynari"-- item descriptionlocal desc = {}	desc[1] = "This device converts hydrogen into coolant at at 1:4 rate."	desc[2] = "Requires a constant amount of energy (60 units per second)."-- production requirementslocal req = {}local req = {}	req["morphite"] = 100	req["nocxium"] = 100	req["isogen"] = 0-- factory entrylocal Entry = {}	Entry.DisplayName = ENT.PrintName	Entry.Description = desc	Entry.ClassName = "hydrogen_coolant"	Entry.BuildTime = 10	Entry.Costs = req	-- register entry with gamemodeGAMEMODE:RegisterFactoryEntry( Entry )