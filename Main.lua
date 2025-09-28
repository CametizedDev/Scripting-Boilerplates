local base = plugin:CreateToolbar("ScriptUtils")
local triab = plugin:CreateToolbar("TRIAUtils")
local note = "hey! if you wanna help on this plugin, go to https://github.com/CametizedDev/Scripting-Utils"

local functionbase = base:CreateButton("Insert Function", "Inserts the base of a function at your cursor.", "")
local triabase = triab:CreateButton("Insert a TRIA GetButtonEvent", "Inserts a button function for TRIA.os", "")

local function insertFunc()
	return [[

local function funcName()
	print("Hello World")
end

]]
end

functionbase.Click:Connect(function()
	print(note)
	local ses = game:GetService("ScriptEditorService")
	local editor = ses:FindScriptDocument(plugin:GetSelectedScript())

	if editor then
		editor:InsertText(insertFunc())
	else
		warn("open script dum")
	end
end)
