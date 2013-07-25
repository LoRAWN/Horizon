AddCSLuaFile()

DEFINE_BASECLASS( "player_sandbox" )

local PLAYER = {} 

-- Suit values
PLAYER.MaxSuitPower			= 200
PLAYER.SuitPower 			= 10
PLAYER.MaxSuitAir			= 200
PLAYER.SuitAir				= 10
PLAYER.MaxSuitCoolant		= 200
PLAYER.SuitCoolant			= 10
-- Environment values
PLAYER.CurrentEnv = nil

-- Called when the class object is created (shared)
function PLAYER:Init()
	self.Player.SuitPower		= PLAYER.SuitPower
	self.Player.SuitAir			= PLAYER.SuitAir
	self.Player.SuitCoolant		= PLAYER.SuitCoolant
	self.Player.SuitAirLast		= self.Player.SuitAir
	self.Player.SuitCoolantLast	= self.Player.SuitCoolant
	self.Player.SuitPowerLast	= self.Player.SuitPower
	self.Player.CurrentEnv		= PLAYER.CurrentEnv
	self.Player.Habitable		= PLAYER.Habitable
end

-- Getters and Setters for Suit

function PLAYER:GetSuitPower()
	return self.Player.SuitPower
end

function PLAYER:GetSuitAir()
	return self.Player.SuitAir
end

function PLAYER:GetSuitCoolant()
	return self.Player.SuitCoolant
end

function PLAYER:SetSuitPower( amount )
	amount = math.abs( amount )
	if amount > PLAYER.MaxSuitPower then amount = PLAYER.MaxSuitPower end
	self.Player.SuitPower = amount
end

function PLAYER:SetSuitAir( amount )
	amount = math.abs( amount )
	if amount > PLAYER.MaxSuitAir then amount = PLAYER.MaxSuitAir end
	self.Player.SuitAir = amount
end

function PLAYER:SetSuitCoolant( amount )
	amount = math.abs( amount )
	if amount > PLAYER.MaxSuitCoolant then amount = PLAYER.MaxSuitCoolant end
	self.Player.SuitCoolant = amount
end

function PLAYER:TransmitResources( energy, air, coolant )
	self:SetSuitAir( self:GetSuitAir() + air )
	self:SetSuitPower( self:GetSuitPower() + energy )
	self:SetSuitCoolant( self:GetSuitCoolant() + coolant )
end

-- Getters and Setter -- END

-- Sends suit updates to the clients
local function onPlayerSuitUpdate()
	for k, v in pairs( player.GetAll() ) do
		if ( v.SuitAir != v.SuitAirLast or v.SuitCoolant != v.SuitCoolantLast or v.SuitPower != v.SuitPowerLast ) then
			v.SuitAirLast		= v.SuitAir
			v.SuitCoolantLast	= v.SuitCoolant
			v.SuitPowerLast		= v.SuitPower
			-- send info
			net.Start('hznSuit')
				net.WriteUInt(v.SuitAir, 8)
				net.WriteUInt(v.SuitCoolant, 8)
				net.WriteUInt(v.SuitPower, 8)
			net.Send(v)
		end
	end
end
hook.Add( "Think", "PlayerSuitUpdate", onPlayerSuitUpdate )

-- Set up the network table accessors
function PLAYER:SetupDataTables()
	BaseClass:SetupDataTables( self )
end

-- Set up the players loadout
function PLAYER:Loadout()
	BaseClass:Loadout()
end

-- Called when the player spawns
function PLAYER:Spawn()
	BaseClass:Spawn()
end

-- Clientside only
function PLAYER:CalcView( view ) end		-- Setup the player's view
function PLAYER:CreateMove( cmd ) end		-- Creates the user command on the client
function PLAYER:ShouldDrawLocal() end		-- Return true if we should draw the local player

-- Shared
function PLAYER:StartMove( cmd, mv ) end	-- Copies from the user command to the move
function PLAYER:Move( mv ) end				-- Runs the move (can run multiple times for the same client)
function PLAYER:FinishMove( mv ) end		-- Copy the results of the move back to the Player

-- Desc: Called before the viewmodel is being drawn (clientside)
-- Arg1: Entity|viewmodel|The viewmodel
-- Arg2: Entity|weapon|The weapon
function PLAYER:PreDrawViewModel( vm, weapon )
end

-- Desc: Called after the viewmodel has been drawn (clientside)
-- Arg1: Entity|viewmodel|The viewmodel
-- Arg2: Entity|weapon|The weapon
function PLAYER:PostDrawViewModel( vm, weapon )
	if ( weapon.UseHands || !weapon:IsScripted() ) then
		local hands = self.Player:GetHands()
		if ( IsValid( hands ) ) then
			hands:DrawModel()
		end
	end
end

-- Desc: Called when the player changes their weapon to another one causing their viewmodel model to change
-- Arg1: Entity|viewmodel|The viewmodel that is changing
-- Arg2: string|old|The old model
-- Arg3: string|new|The new model
function PLAYER:ViewModelChanged( vm, old, new )
end

player_manager.RegisterClass( "player_horizon", PLAYER, "player_sandbox" )