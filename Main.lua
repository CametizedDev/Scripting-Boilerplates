local toolbar = plugin:CreateToolbar("Boilerplates")

local bps = {
	{
		name = "LocalScript Plate",
		description = "Boilerplate for a LocalScript",
		icon = "rbxassetid://6023426926",
		template = [[
		local players = game:GetService("Players")
		local player = players.LocalPlayer or players.PlayerAdded:Wait()
		]]
	},
	{
		name = "ModuleScript Plate",
		description = "Boilerplate for a ModuleScript",
		icon = "rbxassetid://6023426926",
		template = [[
		local module = {}

		function module.baseModule()
			print("Hello, world! (From a Module)")
		end

		return module
			]]
	},
	{
		name = "Server Script Plate",
		description = "Boilerplate for a Regular Script",
		icon = "rbxassetid://6023426926",
		template = [[
		print("Script running from: " .. script:GetFullName())
			]]
	}
}

local function insertBP(info)
	local selec = game:GetService("Selection"):Get()[1]

	scInst = Instance.new(info.class)
	scInst.Name = info.name
	scInst.Source = info.code
	scInst.Parent = selec or game:GetService("ServerScriptService")
end

for _, bp in pairs(bps) do
	local btn = toolbar:CreateButton(bp.name, bp.description, "")
	btn.Click:Connect(function())
		insertBP(bp)
	end)
end