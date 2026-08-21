-- FRVGMXNT GUI2LUA CONVERTER 1.2. Like pls!
local LibGui = {
	LibGui = Instance.new("ScreenGui"),
	Main = Instance.new("Frame"),
	UIStroke = Instance.new("UIStroke"),
	I = Instance.new("Frame"),
	UIStroke_2 = Instance.new("UIStroke"),
	Name = Instance.new("TextLabel"),
	X = Instance.new("TextButton"),
	_ = Instance.new("TextButton"),
	V = Instance.new("Frame"),
	UIStroke_3 = Instance.new("UIStroke"),
	CT = Instance.new("Frame"),
	UIStroke_4 = Instance.new("UIStroke"),
	CTEXT = Instance.new("TextLabel"),
	UIStroke_5 = Instance.new("UIStroke"),
	TextButton = Instance.new("TextButton"),
	UIStroke_6 = Instance.new("UIStroke"),
	ToggleText = Instance.new("TextLabel"),
	Off = Instance.new("TextButton"),
	UIStroke_7 = Instance.new("UIStroke"),
	On = Instance.new("TextButton"),
	UIStroke_8 = Instance.new("UIStroke"),
	UIStroke_9 = Instance.new("UIStroke"),
	SliderText = Instance.new("TextLabel"),
	UIStroke_10 = Instance.new("UIStroke"),
	Bask = Instance.new("Frame"),
	Slider = Instance.new("Frame"),
	C = Instance.new("ScrollingFrame"),
	UIStroke_11 = Instance.new("UIStroke"),
	Tab = Instance.new("TextButton"),
	UIGridLayout = Instance.new("UIListLayout"),
	Tab1 = Instance.new("TextButton"),
}

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Повторный запуск не оставляет старую копию интерфейса и её обработчики.
local PreviousGui = PlayerGui:FindFirstChild("LibGui")
if PreviousGui then
	PreviousGui:Destroy()
end

LibGui.LibGui.Parent = PlayerGui
LibGui.Main.Parent = LibGui.LibGui
LibGui.UIStroke.Parent = LibGui.Main
LibGui.I.Parent = LibGui.Main
LibGui.UIStroke_2.Parent = LibGui.I
LibGui.Name.Parent = LibGui.I
LibGui.X.Parent = LibGui.I
LibGui._.Parent = LibGui.I
LibGui.V.Parent = LibGui.Main
LibGui.UIStroke_3.Parent = LibGui.V
LibGui.CT.Parent = LibGui.V
LibGui.UIStroke_4.Parent = LibGui.CT
LibGui.CTEXT.Parent = LibGui.CT
LibGui.UIStroke_5.Parent = LibGui.CTEXT
LibGui.TextButton.Parent = LibGui.CT
LibGui.UIStroke_6.Parent = LibGui.TextButton
LibGui.ToggleText.Parent = LibGui.CT
LibGui.Off.Parent = LibGui.ToggleText
LibGui.UIStroke_7.Parent = LibGui.Off
LibGui.On.Parent = LibGui.ToggleText
LibGui.UIStroke_8.Parent = LibGui.On
LibGui.UIStroke_9.Parent = LibGui.ToggleText
LibGui.SliderText.Parent = LibGui.CT
LibGui.UIStroke_10.Parent = LibGui.SliderText
LibGui.Bask.Parent = LibGui.SliderText
LibGui.Slider.Parent = LibGui.SliderText
LibGui.C.Parent = LibGui.Main   -- временно, позже перенесём в V
LibGui.UIStroke_11.Parent = LibGui.C
LibGui.Tab.Parent = LibGui.C
LibGui.UIGridLayout.Parent = LibGui.C
LibGui.Tab1.Parent = LibGui.C

LibGui.LibGui.Name = "LibGui"
LibGui.LibGui.ResetOnSpawn = false
LibGui.LibGui.IgnoreGuiInset = false
LibGui.LibGui.DisplayOrder = 1000
LibGui.LibGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

LibGui.Main.Name = "Main"
LibGui.Main.ZIndex = 1
LibGui.Main.Position = UDim2.new(0.353467554, 0, 0.209331647, 0)
LibGui.Main.Size = UDim2.new(0, 392, 0, 460)
LibGui.Main.BackgroundColor3 = Color3.fromRGB(13,13,13)
LibGui.Main.BackgroundTransparency = 0
LibGui.Main.Visible = true
LibGui.Main.AnchorPoint = Vector2.new(0, 0)
LibGui.Main.ClipsDescendants = true
LibGui.Main.BorderSizePixel = 0

LibGui.UIStroke.Name = "UIStroke"
LibGui.UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
LibGui.UIStroke.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke.Thickness = 2.9000000953674316
LibGui.UIStroke.Transparency = 0
LibGui.UIStroke.Enabled = true

LibGui.I.Name = "I"
LibGui.I.ZIndex = 1
LibGui.I.Position = UDim2.new(-0.00112432358, 0, 0.00063595979, 0)
LibGui.I.Size = UDim2.new(1, 0, 0, 37)
LibGui.I.BackgroundColor3 = Color3.fromRGB(9,9,9)
LibGui.I.BackgroundTransparency = 0
LibGui.I.Visible = true
LibGui.I.AnchorPoint = Vector2.new(0, 0)
LibGui.I.ClipsDescendants = false
LibGui.I.BorderSizePixel = 0

LibGui.UIStroke_2.Name = "UIStroke"
LibGui.UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
LibGui.UIStroke_2.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_2.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_2.Thickness = 2.9000000953674316
LibGui.UIStroke_2.Transparency = 0
LibGui.UIStroke_2.Enabled = true

LibGui.Name.Name = "Name"
LibGui.Name.ZIndex = 1
LibGui.Name.Position = UDim2.new(0, 0, -0.00790652726, 0)
LibGui.Name.Size = UDim2.new(0, 298, 0, 37)
LibGui.Name.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.Name.BackgroundTransparency = 1
LibGui.Name.Text = "Name"  -- по умолчанию, потом изменим в конце
LibGui.Name.TextScaled = true
LibGui.Name.TextSize = 14
LibGui.Name.Font = Enum.Font.FredokaOne
LibGui.Name.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.Name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.Name.TextStrokeTransparency = 1
LibGui.Name.TextWrapped = true
LibGui.Name.TextXAlignment = Enum.TextXAlignment.Center
LibGui.Name.TextYAlignment = Enum.TextYAlignment.Center
LibGui.Name.TextTransparency = 0
LibGui.Name.Visible = true
LibGui.Name.AnchorPoint = Vector2.new(0, 0)
LibGui.Name.ClipsDescendants = false

LibGui.X.Name = "X"
LibGui.X.ZIndex = 1
LibGui.X.Position = UDim2.new(0.903061211, 0, -0.0270270277, 0)
LibGui.X.Size = UDim2.new(0, 38, 0, 36)
LibGui.X.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.X.BackgroundTransparency = 1
LibGui.X.Text = "X"
LibGui.X.TextScaled = true
LibGui.X.TextSize = 14
LibGui.X.Font = Enum.Font.FredokaOne
LibGui.X.TextColor3 = Color3.fromRGB(255,0,0)
LibGui.X.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.X.TextStrokeTransparency = 1
LibGui.X.TextWrapped = true
LibGui.X.TextXAlignment = Enum.TextXAlignment.Center
LibGui.X.TextYAlignment = Enum.TextYAlignment.Center
LibGui.X.TextTransparency = 0
LibGui.X.Visible = true
LibGui.X.AnchorPoint = Vector2.new(0, 0)
LibGui.X.ClipsDescendants = false

LibGui._.Name = "-"
LibGui._.ZIndex = 1
LibGui._.Position = UDim2.new(0.806122422, 0, -0.0270270277, 0)
LibGui._.Size = UDim2.new(0, 38, 0, 36)
LibGui._.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui._.BackgroundTransparency = 1
LibGui._.Text = "-"
LibGui._.TextScaled = true
LibGui._.TextSize = 14
LibGui._.Font = Enum.Font.FredokaOne
LibGui._.TextColor3 = Color3.fromRGB(255,225,0)
LibGui._.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui._.TextStrokeTransparency = 1
LibGui._.TextWrapped = true
LibGui._.TextXAlignment = Enum.TextXAlignment.Center
LibGui._.TextYAlignment = Enum.TextYAlignment.Center
LibGui._.TextTransparency = 0
LibGui._.Visible = true
LibGui._.AnchorPoint = Vector2.new(0, 0)
LibGui._.ClipsDescendants = false

LibGui.V.Name = "V"
LibGui.V.ZIndex = 1
LibGui.V.Position = UDim2.new(0, 0, 0, 37)
LibGui.V.Size = UDim2.new(1, 0, 1, -37)
LibGui.V.BackgroundColor3 = Color3.fromRGB(9,9,9)
LibGui.V.BackgroundTransparency = 0
LibGui.V.Visible = true
LibGui.V.AnchorPoint = Vector2.new(0, 0)
LibGui.V.ClipsDescendants = false
LibGui.V.BorderSizePixel = 0

LibGui.UIStroke_3.Name = "UIStroke"
LibGui.UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
LibGui.UIStroke_3.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_3.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_3.Thickness = 2.9000000953674316
LibGui.UIStroke_3.Transparency = 0
LibGui.UIStroke_3.Enabled = true

LibGui.CT.Name = "CT"
LibGui.CT.ZIndex = 1
LibGui.CT.Position = UDim2.new(0.0488505736, 0, 0.035502959, 0)
LibGui.CT.Size = UDim2.new(0, 131, 0, 133)
LibGui.CT.BackgroundColor3 = Color3.fromRGB(7,7,7)
LibGui.CT.BackgroundTransparency = 0
LibGui.CT.Visible = true
LibGui.CT.AnchorPoint = Vector2.new(0, 0)
LibGui.CT.ClipsDescendants = false
LibGui.CT.BorderSizePixel = 0

LibGui.UIStroke_4.Name = "UIStroke"
LibGui.UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
LibGui.UIStroke_4.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_4.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_4.Thickness = 2.9000000953674316
LibGui.UIStroke_4.Transparency = 0
LibGui.UIStroke_4.Enabled = true

LibGui.CTEXT.Name = "CTEXT"
LibGui.CTEXT.ZIndex = 1
LibGui.CTEXT.Position = UDim2.new(0, 0, 0, 0)
LibGui.CTEXT.Size = UDim2.new(0, 131, 0, 16)
LibGui.CTEXT.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.CTEXT.BackgroundTransparency = 1
LibGui.CTEXT.Text = "CT"
LibGui.CTEXT.TextScaled = false
LibGui.CTEXT.TextSize = 14
LibGui.CTEXT.Font = Enum.Font.FredokaOne
LibGui.CTEXT.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.CTEXT.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.CTEXT.TextStrokeTransparency = 1
LibGui.CTEXT.TextWrapped = false
LibGui.CTEXT.TextXAlignment = Enum.TextXAlignment.Center
LibGui.CTEXT.TextYAlignment = Enum.TextYAlignment.Center
LibGui.CTEXT.TextTransparency = 0
LibGui.CTEXT.Visible = true
LibGui.CTEXT.AnchorPoint = Vector2.new(0, 0)
LibGui.CTEXT.ClipsDescendants = false

LibGui.UIStroke_5.Name = "UIStroke"
LibGui.UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LibGui.UIStroke_5.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_5.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_5.Thickness = 2.9000000953674316
LibGui.UIStroke_5.Transparency = 0
LibGui.UIStroke_5.Enabled = true

LibGui.TextButton.Name = "TextButton"
LibGui.TextButton.ZIndex = 1
LibGui.TextButton.Position = UDim2.new(0, 0, 0.172043011, 0)
LibGui.TextButton.Size = UDim2.new(0, 131, 0, 22)
LibGui.TextButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.TextButton.BackgroundTransparency = 1
LibGui.TextButton.Text = "Button"
LibGui.TextButton.TextScaled = false
LibGui.TextButton.TextSize = 14
LibGui.TextButton.Font = Enum.Font.FredokaOne
LibGui.TextButton.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.TextButton.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.TextButton.TextStrokeTransparency = 1
LibGui.TextButton.TextWrapped = false
LibGui.TextButton.TextXAlignment = Enum.TextXAlignment.Center
LibGui.TextButton.TextYAlignment = Enum.TextYAlignment.Center
LibGui.TextButton.TextTransparency = 0
LibGui.TextButton.Visible = true
LibGui.TextButton.AnchorPoint = Vector2.new(0, 0)
LibGui.TextButton.ClipsDescendants = false

LibGui.UIStroke_6.Name = "UIStroke"
LibGui.UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LibGui.UIStroke_6.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_6.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_6.Thickness = 2.9000000953674316
LibGui.UIStroke_6.Transparency = 0
LibGui.UIStroke_6.Enabled = true

LibGui.ToggleText.Name = "ToggleText"
LibGui.ToggleText.ZIndex = 1
LibGui.ToggleText.Position = UDim2.new(0, 0, 0.408602148, 0)
LibGui.ToggleText.Size = UDim2.new(0, 108, 0, 16)
LibGui.ToggleText.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.ToggleText.BackgroundTransparency = 1
LibGui.ToggleText.Text = "CT"
LibGui.ToggleText.TextScaled = false
LibGui.ToggleText.TextSize = 14
LibGui.ToggleText.Font = Enum.Font.FredokaOne
LibGui.ToggleText.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.ToggleText.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.ToggleText.TextStrokeTransparency = 1
LibGui.ToggleText.TextWrapped = false
LibGui.ToggleText.TextXAlignment = Enum.TextXAlignment.Center
LibGui.ToggleText.TextYAlignment = Enum.TextYAlignment.Center
LibGui.ToggleText.TextTransparency = 0
LibGui.ToggleText.Visible = true
LibGui.ToggleText.AnchorPoint = Vector2.new(0, 0)
LibGui.ToggleText.ClipsDescendants = false

LibGui.Off.Name = "Off"
LibGui.Off.ZIndex = 1
LibGui.Off.Position = UDim2.new(1, 0, 0, 0)
LibGui.Off.Size = UDim2.new(0, 16, 0, 16)
LibGui.Off.BackgroundColor3 = Color3.fromRGB(0,0,0)
LibGui.Off.BackgroundTransparency = 1
LibGui.Off.Text = "X"
LibGui.Off.TextScaled = true
LibGui.Off.TextSize = 14
LibGui.Off.Font = Enum.Font.FredokaOne
LibGui.Off.TextColor3 = Color3.fromRGB(255,0,0)
LibGui.Off.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.Off.TextStrokeTransparency = 1
LibGui.Off.TextWrapped = true
LibGui.Off.TextXAlignment = Enum.TextXAlignment.Center
LibGui.Off.TextYAlignment = Enum.TextYAlignment.Center
LibGui.Off.TextTransparency = 0
LibGui.Off.Visible = true
LibGui.Off.AnchorPoint = Vector2.new(0, 0)
LibGui.Off.ClipsDescendants = false

LibGui.UIStroke_7.Name = "UIStroke"
LibGui.UIStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LibGui.UIStroke_7.Color = Color3.fromRGB(30,30,30)
LibGui.UIStroke_7.LineJoinMode = Enum.LineJoinMode.Round
LibGui.UIStroke_7.Thickness = 2.9000000953674316
LibGui.UIStroke_7.Transparency = 0
LibGui.UIStroke_7.Enabled = true

LibGui.On.Name = "On"
LibGui.On.ZIndex = 1
LibGui.On.Position = UDim2.new(1, 0, 0, 0)
LibGui.On.Size = UDim2.new(0, 16, 0, 16)
LibGui.On.BackgroundColor3 = Color3.fromRGB(0,0,0)
LibGui.On.BackgroundTransparency = 1
LibGui.On.Text = "/"
LibGui.On.TextScaled = true
LibGui.On.TextSize = 14
LibGui.On.Font = Enum.Font.FredokaOne
LibGui.On.TextColor3 = Color3.fromRGB(55,255,0)
LibGui.On.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.On.TextStrokeTransparency = 1
LibGui.On.TextWrapped = true
LibGui.On.TextXAlignment = Enum.TextXAlignment.Center
LibGui.On.TextYAlignment = Enum.TextYAlignment.Center
LibGui.On.TextTransparency = 0
LibGui.On.Visible = true
LibGui.On.AnchorPoint = Vector2.new(0, 0)
LibGui.On.ClipsDescendants = false

LibGui.UIStroke_8.Name = "UIStroke"
LibGui.UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LibGui.UIStroke_8.Color = Color3.fromRGB(30,30,30)
LibGui.UIStroke_8.LineJoinMode = Enum.LineJoinMode.Round
LibGui.UIStroke_8.Thickness = 2.9000000953674316
LibGui.UIStroke_8.Transparency = 0
LibGui.UIStroke_8.Enabled = true

LibGui.UIStroke_9.Name = "UIStroke"
LibGui.UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LibGui.UIStroke_9.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_9.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_9.Thickness = 2.9000000953674316
LibGui.UIStroke_9.Transparency = 0
LibGui.UIStroke_9.Enabled = true

LibGui.SliderText.Name = "SliderText"
LibGui.SliderText.ZIndex = 1
LibGui.SliderText.Position = UDim2.new(0, 0, 0.580645144, 0)
LibGui.SliderText.Size = UDim2.new(0, 131, 0, 16)
LibGui.SliderText.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.SliderText.BackgroundTransparency = 1
LibGui.SliderText.Text = "Slider"
LibGui.SliderText.TextScaled = false
LibGui.SliderText.TextSize = 14
LibGui.SliderText.Font = Enum.Font.FredokaOne
LibGui.SliderText.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.SliderText.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.SliderText.TextStrokeTransparency = 1
LibGui.SliderText.TextWrapped = false
LibGui.SliderText.TextXAlignment = Enum.TextXAlignment.Center
LibGui.SliderText.TextYAlignment = Enum.TextYAlignment.Center
LibGui.SliderText.TextTransparency = 0
LibGui.SliderText.Visible = true
LibGui.SliderText.AnchorPoint = Vector2.new(0, 0)
LibGui.SliderText.ClipsDescendants = false

LibGui.UIStroke_10.Name = "UIStroke"
LibGui.UIStroke_10.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LibGui.UIStroke_10.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_10.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_10.Thickness = 2.9000000953674316
LibGui.UIStroke_10.Transparency = 0
LibGui.UIStroke_10.Enabled = true

LibGui.Bask.Name = "Bask"
LibGui.Bask.ZIndex = 1
LibGui.Bask.Position = UDim2.new(0, 0, 1, 0)
LibGui.Bask.Size = UDim2.new(0, 131, 0, 10)
LibGui.Bask.BackgroundColor3 = Color3.fromRGB(25,25,25)
LibGui.Bask.BackgroundTransparency = 0
LibGui.Bask.Visible = true
LibGui.Bask.AnchorPoint = Vector2.new(0, 0)
LibGui.Bask.ClipsDescendants = false
LibGui.Bask.BorderSizePixel = 0

LibGui.Slider.Name = "Slider"
LibGui.Slider.ZIndex = 1
LibGui.Slider.Position = UDim2.new(0, 0, 1, 0)
LibGui.Slider.Size = UDim2.new(0, 55, 0, 10)
LibGui.Slider.BackgroundColor3 = Color3.fromRGB(255,0,0)
LibGui.Slider.BackgroundTransparency = 0
LibGui.Slider.Visible = true
LibGui.Slider.AnchorPoint = Vector2.new(0, 0)
LibGui.Slider.ClipsDescendants = false
LibGui.Slider.BorderSizePixel = 0

LibGui.C.Name = "C"
LibGui.C.ZIndex = 1
LibGui.C.Position = UDim2.new(0, 0, 0, 0)
LibGui.C.Size = UDim2.new(1, 0, 0, 34)
LibGui.C.BackgroundColor3 = Color3.fromRGB(9,9,9)
LibGui.C.BackgroundTransparency = 0
LibGui.C.Visible = true
LibGui.C.AnchorPoint = Vector2.new(0, 0)
LibGui.C.ClipsDescendants = false
LibGui.C.BorderSizePixel = 0
LibGui.C.CanvasSize = UDim2.new(0, 0, 0, 0)
LibGui.C.AutomaticCanvasSize = Enum.AutomaticSize.X
LibGui.C.ScrollingDirection = Enum.ScrollingDirection.X
LibGui.C.ScrollBarThickness = 2
LibGui.C.ScrollBarImageColor3 = Color3.fromRGB(255,0,0)

LibGui.UIStroke_11.Name = "UIStroke"
LibGui.UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
LibGui.UIStroke_11.Color = Color3.fromRGB(0,0,0)
LibGui.UIStroke_11.LineJoinMode = Enum.LineJoinMode.Miter
LibGui.UIStroke_11.Thickness = 2.9000000953674316
LibGui.UIStroke_11.Transparency = 0
LibGui.UIStroke_11.Enabled = true

LibGui.Tab.Name = "Tab"
LibGui.Tab.ZIndex = 1
LibGui.Tab.Position = UDim2.new(0, 0, 0, 0)
LibGui.Tab.Size = UDim2.new(0, 87, 0, 34)
LibGui.Tab.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.Tab.BackgroundTransparency = 1
LibGui.Tab.Text = "Tab"
LibGui.Tab.TextScaled = true
LibGui.Tab.TextSize = 14
LibGui.Tab.Font = Enum.Font.FredokaOne
LibGui.Tab.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.Tab.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.Tab.TextStrokeTransparency = 1
LibGui.Tab.TextWrapped = true
LibGui.Tab.TextXAlignment = Enum.TextXAlignment.Center
LibGui.Tab.TextYAlignment = Enum.TextYAlignment.Center
LibGui.Tab.TextTransparency = 0
LibGui.Tab.Visible = true
LibGui.Tab.AnchorPoint = Vector2.new(0, 0)
LibGui.Tab.ClipsDescendants = false

LibGui.UIGridLayout.Name = "UIGridLayout"
LibGui.UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
LibGui.UIGridLayout.Padding = UDim.new(0, 4)
LibGui.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
LibGui.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
LibGui.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center

LibGui.Tab1.Name = "Tab1"
LibGui.Tab1.ZIndex = 1
LibGui.Tab1.Position = UDim2.new(0, 0, 0, 0)
LibGui.Tab1.Size = UDim2.new(0, 87, 0, 34)
LibGui.Tab1.BackgroundColor3 = Color3.fromRGB(255,255,255)
LibGui.Tab1.BackgroundTransparency = 1
LibGui.Tab1.Text = "Tab1"
LibGui.Tab1.TextScaled = true
LibGui.Tab1.TextSize = 14
LibGui.Tab1.Font = Enum.Font.FredokaOne
LibGui.Tab1.TextColor3 = Color3.fromRGB(255,255,255)
LibGui.Tab1.TextStrokeColor3 = Color3.fromRGB(0,0,0)
LibGui.Tab1.TextStrokeTransparency = 1
LibGui.Tab1.TextWrapped = true
LibGui.Tab1.TextXAlignment = Enum.TextXAlignment.Center
LibGui.Tab1.TextYAlignment = Enum.TextYAlignment.Center
LibGui.Tab1.TextTransparency = 0
LibGui.Tab1.Visible = true
LibGui.Tab1.AnchorPoint = Vector2.new(0, 0)
LibGui.Tab1.ClipsDescendants = false

-- ===== LIBRARY API =====
-- Библиотека для лёгкого создания вкладок, секций и элементов

local UserInputService = game:GetService("UserInputService")

-- Стиль
local THEME = {
	Background = Color3.fromRGB(13, 13, 13),
	Section = Color3.fromRGB(9, 9, 9),
	Card = Color3.fromRGB(7, 7, 7),
	Element = Color3.fromRGB(12, 12, 12),
	Text = Color3.fromRGB(255, 255, 255),
	TextDim = Color3.fromRGB(100, 100, 100),
	Accent = Color3.fromRGB(255, 0, 0),
	Stroke = Color3.fromRGB(0, 0, 0),
	StrokeLight = Color3.fromRGB(30, 30, 30),
	Font = Enum.Font.FredokaOne,
}

-- Удаляем демонстрационную CT-карточку целиком, чтобы она не занимала память.
LibGui.CT:Destroy()
LibGui.Tab:Destroy()
LibGui.Tab1:Destroy()

-- Включаем ClipsDescendants чтобы контент не вылезал
LibGui.V.ClipsDescendants = true

-- ===== ИСПРАВЛЕНИЕ БАГА: переносим контейнер вкладок (C) внутрь V и задаём ZIndex =====
LibGui.C.Parent = LibGui.V
LibGui.C.Position = UDim2.new(0, 0, 0, 0)
LibGui.C.Size = UDim2.new(1, 0, 0, 34)
LibGui.C.ZIndex = 10
LibGui.C.ClipsDescendants = true

-- Хелпер: создать UIStroke
local function makeStroke(parent, color, thickness)
	local s = Instance.new("UIStroke")
	s.Color = color or THEME.Stroke
	s.Thickness = thickness or 2.9
	s.Parent = parent
	return s
end

-- Система вкладок
local tabsData = {}
local activeTabIndex = 1
local activeSlider = nil
local keybinds = {}

local function selectTab(index)
	activeTabIndex = index
	for i, data in ipairs(tabsData) do
		if i == index then
			data.button.TextColor3 = THEME.Text
			data.button.BackgroundTransparency = 0
			data.button.BackgroundColor3 = THEME.Element
			data.content.Visible = true
		else
			data.button.TextColor3 = THEME.TextDim
			data.button.BackgroundTransparency = 1
			data.content.Visible = false
		end
	end
end

-- Один общий набор обработчиков для всех слайдеров и биндов.
-- Благодаря этому большое количество элементов не создаёт сотни Connect.
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	for _, binding in ipairs(keybinds) do
		if binding.listening and input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.Escape then
				binding.button.Text = binding.key.Name
			else
				binding.key = input.KeyCode
				binding.button.Text = input.KeyCode.Name
			end

			binding.button.TextColor3 = THEME.Text
			binding.listening = false
			return
		end
	end

	if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
		LibGui.LibGui.Enabled = not LibGui.LibGui.Enabled
		return
	end

	if gameProcessed then
		return
	end

	for _, binding in ipairs(keybinds) do
		if binding.key ~= Enum.KeyCode.Unknown and input.KeyCode == binding.key then
			if binding.toggleMode then
				binding.active = not binding.active
				binding.button.BackgroundColor3 = binding.active
					and Color3.fromRGB(20, 60, 20)
					or Color3.fromRGB(40, 40, 40)
				if binding.callback then binding.callback(binding.active) end
			else
				if binding.callback then binding.callback(true) end
			end
		end
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if activeSlider and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then
		activeSlider.setFromX(input.Position.X)
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		activeSlider = nil
	end

	if gameProcessed then
		return
	end

	for _, binding in ipairs(keybinds) do
		if not binding.toggleMode
			and binding.key ~= Enum.KeyCode.Unknown
			and input.KeyCode == binding.key then
			if binding.callback then binding.callback(false) end
		end
	end
end)

-- ===== ОБЪЕКТ БИБЛИОТЕКИ =====
local Library = {}

function Library:CreateTab(name)
	-- Кнопка вкладки
	local tabBtn = Instance.new("TextButton")
	tabBtn.Text = name
	tabBtn.Font = THEME.Font
	tabBtn.TextScaled = false
	tabBtn.TextSize = 14
	tabBtn.TextColor3 = THEME.Text
	tabBtn.Size = UDim2.new(0, math.clamp(#tostring(name) * 9 + 28, 80, 150), 0, 34)
	tabBtn.LayoutOrder = #tabsData + 1
	tabBtn.ZIndex = 11
	tabBtn.AutoButtonColor = false
	tabBtn.BackgroundTransparency = 1
	tabBtn.Parent = LibGui.C

	-- Контент вкладки (ScrollingFrame) - теперь с учётом высоты вкладок (34px)
	local content = Instance.new("ScrollingFrame")
	content.Size = UDim2.new(1, 0, 1, -34)   -- занимает всю V, кроме области вкладок
	content.Position = UDim2.new(0, 0, 0, 34) -- сдвиг вниз на высоту вкладок
	content.BackgroundTransparency = 1
	content.BorderSizePixel = 0
	content.ScrollBarThickness = 4
	content.ScrollBarImageColor3 = THEME.Accent
	content.CanvasSize = UDim2.new(0, 0, 0, 0)
	content.AutomaticCanvasSize = Enum.AutomaticSize.Y
	content.Visible = false
	content.ZIndex = 2
	content.Parent = LibGui.V

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 8)
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.Parent = content

	local tabData = { button = tabBtn, content = content, name = name }
	table.insert(tabsData, tabData)
	local tabIndex = #tabsData

	tabBtn.MouseButton1Click:Connect(function()
		selectTab(tabIndex)
	end)

	if tabIndex == 1 then
		selectTab(1)
	end

	-- ===== ОБЪЕКТ ВКЛАДКИ =====
	local Tab = {}

	function Tab:CreateSection(sectionName)
		local section = Instance.new("Frame")
		section.Size = UDim2.new(0, 330, 0, 0)
		section.BackgroundColor3 = THEME.Card
		section.BorderSizePixel = 0
		section.AutomaticSize = Enum.AutomaticSize.Y
		section.Parent = content
		makeStroke(section)

		local sLayout = Instance.new("UIListLayout")
		sLayout.Padding = UDim.new(0, 4)
		sLayout.Parent = section

		local padding = Instance.new("UIPadding")
		padding.PaddingTop = UDim.new(0, 4)
		padding.PaddingBottom = UDim.new(0, 4)
		padding.PaddingLeft = UDim.new(0, 4)
		padding.PaddingRight = UDim.new(0, 4)
		padding.Parent = section

		-- Заголовок секции
		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, 0, 0, 24)
		title.BackgroundTransparency = 1
		title.Text = sectionName
		title.Font = THEME.Font
		title.TextSize = 14
		title.TextColor3 = THEME.Text
		title.TextXAlignment = Enum.TextXAlignment.Center
		title.Parent = section

		-- ===== ОБЪЕКТ СЕКЦИИ =====
		local Section = {}

		function Section:CreateButton(text, callback)
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 28)
			btn.BackgroundColor3 = THEME.Element
			btn.BorderSizePixel = 0
			btn.Text = text
			btn.Font = THEME.Font
			btn.TextSize = 14
			btn.TextColor3 = THEME.Text
			btn.Parent = section
			makeStroke(btn, THEME.StrokeLight)

			btn.MouseButton1Click:Connect(function()
				if callback then callback() end
			end)
			return btn
		end

		function Section:CreateLabel(name, text)
			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, 0, 0, 24)
			label.BackgroundTransparency = 1
			label.Text = name .. ": " .. text
			label.Font = THEME.Font
			label.TextSize = 14
			label.TextColor3 = THEME.Text
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.Parent = section
			return label
		end

		function Section:CreateToggle(name, callback)
			local state = false

			local row = Instance.new("Frame")
			row.Size = UDim2.new(1, 0, 0, 28)
			row.BackgroundColor3 = THEME.Element
			row.BorderSizePixel = 0
			row.Parent = section
			makeStroke(row, THEME.StrokeLight)

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, -40, 1, 0)
			label.BackgroundTransparency = 1
			label.Text = name
			label.Font = THEME.Font
			label.TextSize = 14
			label.TextColor3 = THEME.Text
			label.TextXAlignment = Enum.TextXAlignment.Center
			label.Parent = row

			local toggleBtn = Instance.new("TextButton")
			toggleBtn.Size = UDim2.new(0, 28, 0, 22)
			toggleBtn.Position = UDim2.new(1, -32, 0.5, -11)
			toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			toggleBtn.BorderSizePixel = 0
			toggleBtn.Text = "X"
			toggleBtn.Font = THEME.Font
			toggleBtn.TextScaled = true
			toggleBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
			toggleBtn.Parent = row
			makeStroke(toggleBtn, THEME.StrokeLight)

			local function update(runCallback)
				if state then
					toggleBtn.Text = "/"
					toggleBtn.TextColor3 = Color3.fromRGB(55, 255, 0)
					toggleBtn.BackgroundColor3 = Color3.fromRGB(20, 60, 20)
				else
					toggleBtn.Text = "X"
					toggleBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
					toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end
				if runCallback and callback then callback(state) end
			end

			toggleBtn.MouseButton1Click:Connect(function()
				state = not state
				update(true)
			end)

			-- На загрузке только рисуем состояние, не запускаем тяжёлый callback.
			update(false)
			return { get = function() return state end, set = function(v) state = v; update(true) end }
		end

		function Section:CreateSlider(name, minVal, maxVal, default, _, callback)
			local container = Instance.new("Frame")
			container.Size = UDim2.new(1, 0, 0, 40)
			container.BackgroundColor3 = THEME.Element
			container.BorderSizePixel = 0
			container.Parent = section
			makeStroke(container, THEME.StrokeLight)

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, 0, 0, 18)
			label.BackgroundTransparency = 1
			label.Text = name .. ": " .. tostring(default)
			label.Font = THEME.Font
			label.TextSize = 12
			label.TextColor3 = THEME.Text
			label.TextXAlignment = Enum.TextXAlignment.Center
			label.Parent = container

			local track = Instance.new("Frame")
			track.Size = UDim2.new(1, -12, 0, 14)
			track.Position = UDim2.new(0, 6, 0, 22)
			track.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			track.BorderSizePixel = 0
			track.Parent = container

			local fill = Instance.new("Frame")
			fill.Size = UDim2.new(0, 0, 1, 0)
			fill.BackgroundColor3 = THEME.Accent
			fill.BorderSizePixel = 0
			fill.Parent = track

			local value = default

			local function setValue(v, runCallback)
				value = math.clamp(math.floor(v), minVal, maxVal)
				local pct = (value - minVal) / (maxVal - minVal)
				fill.Size = UDim2.new(pct, 0, 1, 0)
				label.Text = name .. ": " .. tostring(value)
				if runCallback and callback then callback(value) end
			end

			local function getPct(mouseX)
				local pct = (mouseX - track.AbsolutePosition.X) / track.AbsoluteSize.X
				return math.clamp(pct, 0, 1)
			end

			local sliderController = {
				setFromX = function(mouseX)
					local pct = getPct(mouseX)
					setValue(minVal + (maxVal - minVal) * pct, true)
				end,
			}

			track.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					activeSlider = sliderController
					sliderController.setFromX(input.Position.X)
				end
			end)

			setValue(default, false)
			return {
				get = function() return value end,
				set = function(v) setValue(v, true) end,
			}
		end

		function Section:CreateColorPicker(name, defaultColor, callback)
			local row = Instance.new("Frame")
			row.Size = UDim2.new(1, 0, 0, 28)
			row.BackgroundColor3 = THEME.Element
			row.BorderSizePixel = 0
			row.Parent = section
			makeStroke(row, THEME.StrokeLight)

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, -40, 1, 0)
			label.BackgroundTransparency = 1
			label.Text = name
			label.Font = THEME.Font
			label.TextSize = 14
			label.TextColor3 = THEME.Text
			label.TextXAlignment = Enum.TextXAlignment.Center
			label.Parent = row

			local colorBox = Instance.new("TextButton")
			colorBox.Size = UDim2.new(0, 28, 0, 22)
			colorBox.Position = UDim2.new(1, -32, 0.5, -11)
			colorBox.BackgroundColor3 = defaultColor
			colorBox.BorderSizePixel = 0
			colorBox.Text = ""
			colorBox.Parent = row
			makeStroke(colorBox, THEME.StrokeLight)

			local popup
			local popupOpen = false

			local function closePopup()
				if popup then popup:Destroy() popup = nil end
				popupOpen = false
			end

			local function openPopup()
				closePopup()
				popupOpen = true

				popup = Instance.new("Frame")
				popup.Size = UDim2.new(0, 150, 0, 120)
				popup.Position = UDim2.new(1, 5, 0, 0)
				popup.BackgroundColor3 = THEME.Card
				popup.BorderSizePixel = 0
				popup.ZIndex = 10
				popup.Parent = row
				makeStroke(popup)

				local gl = Instance.new("UIGridLayout")
				gl.CellSize = UDim2.new(0, 28, 0, 28)
				gl.CellPadding = UDim2.new(0, 2, 0, 2)
				gl.Parent = popup

				local colors = {
					Color3.fromRGB(255,0,0), Color3.fromRGB(255,128,0), Color3.fromRGB(255,255,0),
					Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,128), Color3.fromRGB(0,255,255),
					Color3.fromRGB(0,128,255), Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255),
					Color3.fromRGB(255,0,255), Color3.fromRGB(255,0,128), Color3.fromRGB(255,255,255),
					Color3.fromRGB(128,128,128), Color3.fromRGB(0,0,0), Color3.fromRGB(255,128,128),
					Color3.fromRGB(128,255,128), Color3.fromRGB(128,128,255), Color3.fromRGB(255,255,128),
				}

				for _, c in ipairs(colors) do
					local swatch = Instance.new("TextButton")
					swatch.BackgroundColor3 = c
					swatch.Text = ""
					swatch.BorderSizePixel = 0
					swatch.ZIndex = 11
					swatch.Parent = popup
					makeStroke(swatch, THEME.Stroke, 1)

					swatch.MouseButton1Click:Connect(function()
						colorBox.BackgroundColor3 = c
						if callback then callback(c) end
						closePopup()
					end)
				end
			end

			colorBox.MouseButton1Click:Connect(function()
				if popupOpen then closePopup() else openPopup() end
			end)

			return { get = function() return colorBox.BackgroundColor3 end, set = function(c) colorBox.BackgroundColor3 = c end }
		end

		function Section:CreateDropdown(name, options, defaultIndex, callback)
			local current = options[defaultIndex] or options[1]
			local open = false

			local row = Instance.new("Frame")
			row.Size = UDim2.new(1, 0, 0, 28)
			row.BackgroundColor3 = THEME.Element
			row.BorderSizePixel = 0
			row.Parent = section
			makeStroke(row, THEME.StrokeLight)

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(0.6, 0, 1, 0)
			label.BackgroundTransparency = 1
			label.Text = name
			label.Font = THEME.Font
			label.TextSize = 14
			label.TextColor3 = THEME.Text
			label.TextXAlignment = Enum.TextXAlignment.Center
			label.Parent = row

			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(0, 80, 0, 22)
			btn.Position = UDim2.new(1, -84, 0.5, -11)
			btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			btn.BorderSizePixel = 0
			btn.Text = current
			btn.Font = THEME.Font
			btn.TextSize = 12
			btn.TextColor3 = THEME.Text
			btn.Parent = row
			makeStroke(btn, THEME.StrokeLight)

			local list

			local function closeList()
				if list then list:Destroy() list = nil end
				open = false
			end

			local function openList()
				closeList()
				open = true

				list = Instance.new("Frame")
				list.Size = UDim2.new(0, 100, 0, #options * 24 + 4)
				list.Position = UDim2.new(1, 5, 0, 0)
				list.BackgroundColor3 = THEME.Card
				list.BorderSizePixel = 0
				list.ZIndex = 10
				list.Parent = btn
				makeStroke(list)

				local l = Instance.new("UIListLayout")
				l.Padding = UDim.new(0, 2)
				l.Parent = list

				for _, opt in ipairs(options) do
					local item = Instance.new("TextButton")
					item.Size = UDim2.new(1, 0, 0, 22)
					item.BackgroundColor3 = (opt == current) and Color3.fromRGB(40,40,40) or Color3.fromRGB(20,20,20)
					item.BorderSizePixel = 0
					item.Text = opt
					item.Font = THEME.Font
					item.TextSize = 12
					item.TextColor3 = THEME.Text
					item.ZIndex = 11
					item.Parent = list

					item.MouseButton1Click:Connect(function()
						current = opt
						btn.Text = opt
						if callback then callback(opt) end
						closeList()
					end)
				end
			end

			btn.MouseButton1Click:Connect(function()
				if open then closeList() else openList() end
			end)

			return { get = function() return current end, set = function(v) current = v; btn.Text = v end }
		end

		function Section:CreateKeybind(name, defaultKey, _, toggleMode, callback)
			local key = defaultKey or Enum.KeyCode.Unknown

			local row = Instance.new("Frame")
			row.Size = UDim2.new(1, 0, 0, 28)
			row.BackgroundColor3 = THEME.Element
			row.BorderSizePixel = 0
			row.Parent = section
			makeStroke(row, THEME.StrokeLight)

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(0.6, 0, 1, 0)
			label.BackgroundTransparency = 1
			label.Text = name
			label.Font = THEME.Font
			label.TextSize = 14
			label.TextColor3 = THEME.Text
			label.TextXAlignment = Enum.TextXAlignment.Center
			label.Parent = row

			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(0, 60, 0, 22)
			btn.Position = UDim2.new(1, -64, 0.5, -11)
			btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			btn.BorderSizePixel = 0
			btn.Text = key.Name
			btn.Font = THEME.Font
			btn.TextSize = 12
			btn.TextColor3 = THEME.Text
			btn.Parent = row
			makeStroke(btn, THEME.StrokeLight)

			local binding = {
				key = key,
				active = false,
				listening = false,
				toggleMode = toggleMode == true,
				callback = callback,
				button = btn,
			}
			table.insert(keybinds, binding)

			btn.MouseButton1Click:Connect(function()
				for _, otherBinding in ipairs(keybinds) do
					if otherBinding ~= binding and otherBinding.listening then
						otherBinding.listening = false
						otherBinding.button.Text = otherBinding.key.Name
						otherBinding.button.TextColor3 = THEME.Text
					end
				end

				binding.listening = true
				btn.Text = "..."
				btn.TextColor3 = THEME.Accent
			end)

			return {
				get = function() return binding.key end,
				set = function(newKey)
					binding.key = newKey
					btn.Text = newKey.Name
				end,
			}
		end

		return Section
	end

	return Tab
end

-- ===== ДОБАВЛЯЕМ МЕТОД ДЛЯ УСТАНОВКИ ЗАГОЛОВКА =====
function Library:SetTitle(title)
	LibGui.Name.Text = title
end

function Library:SetVisible(visible)
	LibGui.LibGui.Enabled = visible == true
end

function Library:Toggle()
	LibGui.LibGui.Enabled = not LibGui.LibGui.Enabled
end

-- ===== ПЕРЕТАСКИВАНИЕ GUI =====
local guiDragging = false
local guiDragStart = nil
local guiStartPos = nil

LibGui.I.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		guiDragging = true
		guiDragStart = input.Position
		guiStartPos = LibGui.Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if guiDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - guiDragStart
		LibGui.Main.Position = UDim2.new(
			guiStartPos.X.Scale, guiStartPos.X.Offset + delta.X,
			guiStartPos.Y.Scale, guiStartPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		guiDragging = false
	end
end)

-- ===== ИЗМЕНЕНИЕ РАЗМЕРА ОКНА =====
local MIN_WIDTH = 250
local MIN_HEIGHT = 150

local resizeHandle = Instance.new("Frame")
resizeHandle.Name = "ResizeHandle"
resizeHandle.Size = UDim2.new(0, 16, 0, 16)
resizeHandle.Position = UDim2.new(1, -16, 1, -16)
resizeHandle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
resizeHandle.BorderSizePixel = 0
resizeHandle.ZIndex = 5
resizeHandle.Parent = LibGui.Main

local resizeStroke = Instance.new("UIStroke")
resizeStroke.Color = Color3.fromRGB(60, 60, 60)
resizeStroke.Thickness = 1
resizeStroke.Parent = resizeHandle

-- Диагональные полоски для индикатора
local line1 = Instance.new("Frame")
line1.Size = UDim2.new(0, 10, 0, 2)
line1.Position = UDim2.new(0.5, -5, 0.2, 0)
line1.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
line1.BorderSizePixel = 0
line1.Rotation = 45
line1.Parent = resizeHandle

local line2 = Instance.new("Frame")
line2.Size = UDim2.new(0, 7, 0, 2)
line2.Position = UDim2.new(0.5, -3, 0.5, -2)
line2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
line2.BorderSizePixel = 0
line2.Rotation = 45
line2.Parent = resizeHandle

local line3 = Instance.new("Frame")
line3.Size = UDim2.new(0, 4, 0, 2)
line3.Position = UDim2.new(0.5, -1, 0.8, -4)
line3.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
line3.BorderSizePixel = 0
line3.Rotation = 45
line3.Parent = resizeHandle

local resizing = false
local resizeStartPos = nil
local resizeStartSize = nil

resizeHandle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		resizing = true
		resizeStartPos = input.Position
		resizeStartSize = LibGui.Main.Size
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - resizeStartPos
		local newWidth = math.max(MIN_WIDTH, resizeStartSize.X.Offset + delta.X)
		local newHeight = math.max(MIN_HEIGHT, resizeStartSize.Y.Offset + delta.Y)
		LibGui.Main.Size = UDim2.new(0, newWidth, 0, newHeight)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		resizing = false
	end
end)

-- Кнопка закрытия (X)
LibGui.X.MouseButton1Click:Connect(function()
	LibGui.LibGui.Enabled = false
	print("[GUI] закрыт")
end)

-- Кнопка сворачивания (-)
local minimized = false
LibGui._.MouseButton1Click:Connect(function()
	minimized = not minimized
	LibGui.V.Visible = not minimized
	LibGui.C.Visible = not minimized
	if minimized then
		LibGui.Main.Size = UDim2.new(0, 392, 0, 37)
	else
		LibGui.Main.Size = UDim2.new(0, 392, 0, 460)
	end
end)

LibGui.Library = Library
