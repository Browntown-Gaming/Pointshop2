local function initAddon()
	LibK.InitializeAddon{
		addonName = "KInventory",             --Name of the addon
		author = "Kamshak",                   --Name of the author
		luaroot = "kinv",                     --Folder that contains the client/shared/server structure relative to the lua folder,
		loadAfterGamemode = false,
	}
	LibK.addReloadFile( "autorun/ps2_kinv_init.lua" )
end
if CLIENT then 
	initAddon() 
elseif SERVER then
	KINV_LOADED = false
	hook.Add("Think","KINV.InitAddonOnThink",function()
		if not KINV_LOADED then
			print("Loading Pointshop2")
			KINV_LOADED = true
			initAddon()
		end
	end)
end