local toolbar = plugin:CreateToolbar("Boilerplates")
local bps = {
	{
		name = "LocalScriptboiler",
		description = "Boilerplate for a LocalScript",
		icon = "rbxassetid://119721896667567",
		class = "LocalScript",
		template = [[
local players = game:GetService("Players")
local player = players.LocalPlayer or players.PlayerAdded:Wait()
		]],
	},
	{
		name = "ModuleScriptboiler",
		description = "Boilerplate for a ModuleScript",
		icon = "rbxassetid://126332848203937",
		class = "ModuleScript",
		template = [[
local module = {}
function module.baseModule()
	print("Hello, world! (From a Module)")
end
return module
		]],
	},
	{
		name = "Scriptboiler",
		description = "Boilerplate for a Regular Script",
		icon = "rbxassetid://126371099514790",
		class = "Script",
		template = [[
print("Script running from: " .. script:GetFullName())
		]],
	},
}
local function folder()
	local db = false
	if db == false then
		db = true
		local fldr = Instance.new("Folder")
		fldr.Parent = game.ServerScriptService
		fldr.Name = "Boilerplates"
	end
end
local function insertBP(info)
	local selection = game:GetService("Selection")
	local selec = selection:Get()[1]
	local scInst = Instance.new(info.class)
	scInst.Name = info.name
	scInst.Source = info.template
	scInst.Parent = game.ServerScriptService:FindFirstChild("Boilerplates")
end
for _, bp in ipairs(bps) do
	local btn = toolbar:CreateButton(bp.name, bp.description, bp.icon)
	btn.Click:Connect(function()
		insertBP(bp)
	end)
end
folder()
--[[
	Boilerplates by Cametized
	Version 1.0.0
	https://cametizeddev.neocities.com/
]]