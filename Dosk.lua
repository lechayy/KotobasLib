local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lechayy/KotobasLib/refs/heads/main/Lib.lua"))()
Library:SetTitle("Название скрипта | RightShift")

local Tab = Library:CreateTab("Название вкладки")
local Section = Tab:CreateSection("Название секции")

Section:CreateButton("Название кнопки", function()
	print("Кнопка нажата")
end)

Section:CreateToggle("Название Toggle", function(value)
	print(value)
end)

local Label = Section:CreateLabel("Название Label", "Текст")

local Slider = Section:CreateSlider("Название Slider", 0, 100, 50, false, function(value)
	print(value)
end)

local ColorPicker = Section:CreateColorPicker("Название ColorPicker", Color3.fromRGB(255, 0, 0), function(color)
	print(color)
end)

local Dropdown = Section:CreateDropdown("Название Dropdown", {"Первый", "Второй", "Третий"}, 1, function(value)
	print(value)
end)

local Keybind = Section:CreateKeybind("Название Keybind", Enum.KeyCode.F, false, true, function(value)
	print(value)
end)
