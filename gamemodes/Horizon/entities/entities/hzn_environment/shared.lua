ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Horizon hzn_environment"
ENT.Author			= "Bynari"
ENT.IsHZN = true

//DeriveGamemode( "sandbox" )

function ENT:SetupDataTables( )
	
	self:DTVar("Int", 0, "Radius");
	self:DTVar("Float", 0, "Gravity");
	self:DTVar("Int", 1, "Priority");
	self:DTVar("Int", 2, "Temp");
	self:DTVar("Bool",0, "Breathable");
	self:DTVar("Float",1, "Minerals");
	

end


