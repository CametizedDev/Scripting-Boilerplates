local toolbar = plugin:CreateToolbar("Boilerplates")

local bps = {
	{
		name = "LocalScript Plate",
		description = "Boilerplate for a LocalScript",
		icon = "rbxassetid://6023462962",
		class = "LocalScript",
		template = [[
local players = game:GetService("Players")
local player = players.LocalPlayer or players.PlayerAdded:Wait()
		]],
	},

	{
		name = "ModuleScript Plate",
		description = "Boilerplate for a ModuleScript",
		icon = "rbxassetid://6023462962",
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
		name = "Server Script Plate",
		description = "Boilerplate for a Regular Script",
		icon = "rbxassetid://6023462962",
		class = "Script",
		template = [[
print("Script running from: " .. script:GetFullName())
		]],
	},
}

local function insertBP(info)
	local selection = game:GetService("Selection")
	local selec = selection:Get()[1]

	local scInst = Instance.new(info.class)
	scInst.Name = info.name
	scInst.Source = info.template
	scInst.Parent = selec or game:GetService("ServerScriptService")
end

for _, bp in ipairs(bps) do
	local btn = toolbar:CreateButton(bp.name, bp.description, bp.icon)
	btn.Click:Connect(function()
		insertBP(bp)
	end)
end
--[[
	Boilerplates by Cametized
	Version 1.0.0
	https://cametizeddev.neocities.com/
]]