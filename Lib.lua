--[[
	Полная локальная версия скрипта на нашей GUI-библиотеке.
	Внешняя загрузка LinoriaLib, ThemeManager и SaveManager не используется.

	Управление окном:
	- RightShift: скрыть / показать GUI;
	- X: скрыть GUI (RightShift вернёт его);
	- кнопка "−": свернуть / развернуть;
	- верхняя панель: перетаскивание;
	- правый нижний угол: изменение размера.
]]

-- ===== SERVICES =====

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()

-- ===== OUR OPTIMIZED GUI LIBRARY =====

local previousGui = PlayerGui:FindFirstChild("OurLibGui")
if previousGui then
	previousGui:Destroy()
end

local THEME = {
	Background = Color3.fromRGB(13, 13, 13),
	Header = Color3.fromRGB(9, 9, 9),
	Section = Color3.fromRGB(7, 7, 7),
	Element = Color3.fromRGB(12, 12, 12),
	ElementSelected = Color3.fromRGB(24, 24, 24),
	Text = Color3.fromRGB(255, 255, 255),
	TextDim = Color3.fromRGB(120, 120, 120),
	Accent = Color3.fromRGB(255, 0, 0),
	Success = Color3.fromRGB(55, 255, 0),
	Stroke = Color3.fromRGB(0, 0, 0),
	StrokeLight = Color3.fromRGB(30, 30, 30),
	Font = Enum.Font.FredokaOne,
}

local function create(className, properties)
	local object = Instance.new(className)

	for property, value in pairs(properties or {}) do
		if property ~= "Parent" then
			object[property] = value
		end
	end

	if properties and properties.Parent then
		object.Parent = properties.Parent
	end

	return object
end

local function makeStroke(parent, color, thickness)
	return create("UIStroke", {
		Color = color or THEME.Stroke,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = parent,
	})
end

local function safeCall(callback, ...)
	if not callback then
		return
	end

	local success, message = pcall(callback, ...)
	if not success then
		warn("[OurLib] Callback error: " .. tostring(message))
	end
end

local ScreenGui = create("ScreenGui", {
	Name = "OurLibGui",
	ResetOnSpawn = false,
	IgnoreGuiInset = false,
	DisplayOrder = 1000,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	Parent = PlayerGui,
})

local Main = create("Frame", {
	Name = "Main",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(430, 500),
	BackgroundColor3 = THEME.Background,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	Active = true,
	Parent = ScreenGui,
})
makeStroke(Main, THEME.Stroke, 2)

local InterfaceScale = create("UIScale", {
	Name = "InterfaceScale",
	Scale = 1,
	Parent = Main,
})

local Header = create("Frame", {
	Name = "Header",
	Size = UDim2.new(1, 0, 0, 38),
	BackgroundColor3 = THEME.Header,
	BorderSizePixel = 0,
	Active = true,
	ZIndex = 20,
	Parent = Main,
})

local Title = create("TextLabel", {
	Name = "Title",
	Position = UDim2.fromOffset(10, 0),
	Size = UDim2.new(1, -92, 1, 0),
	BackgroundTransparency = 1,
	Text = "Advanced Script | RightShift",
	Font = THEME.Font,
	TextSize = 16,
	TextColor3 = THEME.Text,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextTruncate = Enum.TextTruncate.AtEnd,
	ZIndex = 21,
	Parent = Header,
})

local MinimizeButton = create("TextButton", {
	Name = "Minimize",
	Position = UDim2.new(1, -76, 0, 0),
	Size = UDim2.fromOffset(38, 38),
	BackgroundTransparency = 1,
	Text = "−",
	Font = THEME.Font,
	TextSize = 22,
	TextColor3 = Color3.fromRGB(255, 225, 0),
	ZIndex = 22,
	Parent = Header,
})

local CloseButton = create("TextButton", {
	Name = "Close",
	Position = UDim2.new(1, -38, 0, 0),
	Size = UDim2.fromOffset(38, 38),
	BackgroundTransparency = 1,
	Text = "X",
	Font = THEME.Font,
	TextSize = 17,
	TextColor3 = THEME.Accent,
	ZIndex = 22,
	Parent = Header,
})

local Body = create("Frame", {
	Name = "Body",
	Position = UDim2.fromOffset(0, 38),
	Size = UDim2.new(1, 0, 1, -38),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Parent = Main,
})

local TabBar = create("ScrollingFrame", {
	Name = "TabBar",
	Size = UDim2.new(1, 0, 0, 38),
	BackgroundColor3 = THEME.Header,
	BorderSizePixel = 0,
	CanvasSize = UDim2.fromOffset(0, 0),
	AutomaticCanvasSize = Enum.AutomaticSize.X,
	ScrollingDirection = Enum.ScrollingDirection.X,
	ScrollBarThickness = 2,
	ScrollBarImageColor3 = THEME.Accent,
	ClipsDescendants = true,
	ZIndex = 10,
	Parent = Body,
})

create("UIPadding", {
	PaddingLeft = UDim.new(0, 6),
	PaddingRight = UDim.new(0, 6),
	Parent = TabBar,
})

create("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 4),
	Parent = TabBar,
})

local ResizeHandle = create("TextButton", {
	Name = "ResizeHandle",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, 0, 1, 0),
	Size = UDim2.fromOffset(18, 18),
	BackgroundColor3 = Color3.fromRGB(20, 20, 20),
	BorderSizePixel = 0,
	Text = "◢",
	Font = Enum.Font.Code,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(110, 110, 110),
	AutoButtonColor = false,
	ZIndex = 30,
	Parent = Main,
})
makeStroke(ResizeHandle, Color3.fromRGB(60, 60, 60), 1)

local Library = {}
local libraryConnections = {}
local tabsData = {}
local keybinds = {}

local activeTabIndex = 0
local activeSlider = nil
local activeDropdown = nil
local destroyed = false

local dragging = false
local dragStart = nil
local startPosition = nil

local resizing = false
local resizeStart = nil
local startSize = nil

local minimized = false
local sizeBeforeMinimize = Main.Size

local MIN_WIDTH = 320
local MIN_HEIGHT = 220
local menuToggleKey = Enum.KeyCode.RightShift

local function connect(signal, callback)
	local connection = signal:Connect(callback)
	table.insert(libraryConnections, connection)
	return connection
end

local function selectTab(index)
	if not tabsData[index] then
		return
	end

	activeTabIndex = index

	for tabIndex, tabData in ipairs(tabsData) do
		local selected = tabIndex == index
		tabData.content.Visible = selected
		tabData.button.TextColor3 = selected and THEME.Text or THEME.TextDim
		tabData.button.BackgroundTransparency = selected and 0 or 1
		tabData.indicator.Visible = selected
	end
end

local function closeActiveDropdown()
	if activeDropdown then
		activeDropdown:Destroy()
		activeDropdown = nil
	end
end

connect(UserInputService.InputBegan, function(input, gameProcessed)
	for _, binding in ipairs(keybinds) do
		if binding.listening and input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.Escape then
				binding.button.Text = binding.key.Name
			else
				binding.key = input.KeyCode
				binding.button.Text = input.KeyCode.Name

				if binding.isMenuKey then
					menuToggleKey = input.KeyCode
					Title.Text = "Advanced Script | " .. input.KeyCode.Name
				end
			end

			binding.button.TextColor3 = THEME.Text
			binding.listening = false
			return
		end
	end

	if not gameProcessed and input.KeyCode == menuToggleKey then
		ScreenGui.Enabled = not ScreenGui.Enabled
		return
	end

	if gameProcessed then
		return
	end

	for _, binding in ipairs(keybinds) do
		if not binding.isMenuKey
			and binding.key ~= Enum.KeyCode.Unknown
			and input.KeyCode == binding.key then
			if binding.toggleMode then
				binding.active = not binding.active
				binding.button.BackgroundColor3 = binding.active
					and Color3.fromRGB(20, 60, 20)
					or Color3.fromRGB(40, 40, 40)
				safeCall(binding.callback, binding.active)
			else
				safeCall(binding.callback, true)
			end
		end
	end
end)

connect(UserInputService.InputChanged, function(input)
	local pointerMove = input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch

	if not pointerMove then
		return
	end

	if dragging and dragStart and startPosition then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end

	if resizing and resizeStart and startSize then
		local delta = input.Position - resizeStart
		local viewportSize = Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize
		local maxWidth = viewportSize and math.max(MIN_WIDTH, viewportSize.X - 20) or 1200
		local maxHeight = viewportSize and math.max(MIN_HEIGHT, viewportSize.Y - 20) or 900
		local width = math.clamp(startSize.X.Offset + delta.X, MIN_WIDTH, maxWidth)
		local height = math.clamp(startSize.Y.Offset + delta.Y, MIN_HEIGHT, maxHeight)
		Main.Size = UDim2.fromOffset(width, height)
	end

	if activeSlider then
		activeSlider.setFromX(input.Position.X)
	end
end)

connect(UserInputService.InputEnded, function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
		resizing = false
		activeSlider = nil
	end

	if gameProcessed then
		return
	end

	for _, binding in ipairs(keybinds) do
		if not binding.isMenuKey
			and not binding.toggleMode
			and binding.key ~= Enum.KeyCode.Unknown
			and input.KeyCode == binding.key then
			safeCall(binding.callback, false)
		end
	end
end)

connect(Header.InputBegan, function(input)
	if minimized then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = Main.Position
	end
end)

connect(ResizeHandle.InputBegan, function(input)
	if minimized then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		resizing = true
		resizeStart = input.Position
		startSize = Main.Size
	end
end)

connect(CloseButton.MouseButton1Click, function()
	ScreenGui.Enabled = false
end)

connect(MinimizeButton.MouseButton1Click, function()
	minimized = not minimized

	if minimized then
		sizeBeforeMinimize = Main.Size
		Body.Visible = false
		ResizeHandle.Visible = false
		Main.Size = UDim2.fromOffset(math.max(MIN_WIDTH, Main.AbsoluteSize.X), 38)
		MinimizeButton.Text = "+"
	else
		Main.Size = sizeBeforeMinimize
		Body.Visible = true
		ResizeHandle.Visible = true
		MinimizeButton.Text = "−"
	end
end)

function Library:SetTitle(text)
	Title.Text = tostring(text)
end

function Library:SetVisible(visible)
	ScreenGui.Enabled = visible == true
end

function Library:Toggle()
	ScreenGui.Enabled = not ScreenGui.Enabled
end

function Library:SetMenuKey(key)
	menuToggleKey = key or Enum.KeyCode.RightShift
	Title.Text = "Advanced Script | " .. menuToggleKey.Name
end

function Library:SetScale(scale)
	InterfaceScale.Scale = math.clamp(tonumber(scale) or 1, 0.75, 1.25)
end

function Library:ResetWindow()
	closeActiveDropdown()
	minimized = false
	Body.Visible = true
	ResizeHandle.Visible = true
	MinimizeButton.Text = "−"
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Position = UDim2.fromScale(0.5, 0.5)
	Main.Size = UDim2.fromOffset(430, 500)
end

function Library:SelectTab(index)
	selectTab(index)
end

function Library:Destroy()
	if destroyed then
		return
	end

	destroyed = true
	closeActiveDropdown()

	for _, connection in ipairs(libraryConnections) do
		if connection.Connected then
			connection:Disconnect()
		end
	end

	table.clear(libraryConnections)
	ScreenGui:Destroy()
end

function Library:CreateTab(name)
	local tabName = tostring(name)
	local tabIndex = #tabsData + 1
	local buttonWidth = math.clamp(#tabName * 9 + 28, 82, 155)

	local TabButton = create("TextButton", {
		Name = "Tab_" .. tabName,
		Size = UDim2.fromOffset(buttonWidth, 34),
		BackgroundColor3 = THEME.ElementSelected,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = tabName,
		Font = THEME.Font,
		TextSize = 14,
		TextColor3 = THEME.TextDim,
		TextTruncate = Enum.TextTruncate.AtEnd,
		LayoutOrder = tabIndex,
		AutoButtonColor = false,
		ZIndex = 11,
		Parent = TabBar,
	})

	local Indicator = create("Frame", {
		Name = "Indicator",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 5, 1, 0),
		Size = UDim2.new(1, -10, 0, 2),
		BackgroundColor3 = THEME.Accent,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 12,
		Parent = TabButton,
	})

	local Content = create("ScrollingFrame", {
		Name = "Content_" .. tabName,
		Position = UDim2.fromOffset(0, 38),
		Size = UDim2.new(1, 0, 1, -38),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.fromOffset(0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = THEME.Accent,
		Visible = false,
		ZIndex = 2,
		Parent = Body,
	})

	create("UIPadding", {
		PaddingTop = UDim.new(0, 10),
		PaddingBottom = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 10),
		Parent = Content,
	})

	create("UIListLayout", {
		Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = Content,
	})

	local tabData = {
		button = TabButton,
		indicator = Indicator,
		content = Content,
		name = tabName,
	}
	table.insert(tabsData, tabData)

	connect(TabButton.MouseButton1Click, function()
		closeActiveDropdown()
		selectTab(tabIndex)
	end)

	if activeTabIndex == 0 then
		selectTab(1)
	end

	local Tab = {}

	function Tab:CreateSection(sectionName)
		local SectionFrame = create("Frame", {
			Name = "Section_" .. tostring(sectionName),
			Size = UDim2.new(1, -20, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = THEME.Section,
			BorderSizePixel = 0,
			ZIndex = 3,
			Parent = Content,
		})
		makeStroke(SectionFrame, THEME.Stroke, 1)

		create("UIPadding", {
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
			Parent = SectionFrame,
		})

		create("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = SectionFrame,
		})

		create("TextLabel", {
			Name = "SectionTitle",
			Size = UDim2.new(1, 0, 0, 24),
			BackgroundTransparency = 1,
			Text = tostring(sectionName),
			Font = THEME.Font,
			TextSize = 14,
			TextColor3 = THEME.Text,
			ZIndex = 4,
			Parent = SectionFrame,
		})

		local Section = {}

		local function createRow(height)
			local Row = create("Frame", {
				Size = UDim2.new(1, 0, 0, height or 28),
				BackgroundColor3 = THEME.Element,
				BorderSizePixel = 0,
				ZIndex = 4,
				Parent = SectionFrame,
			})
			makeStroke(Row, THEME.StrokeLight, 1)
			return Row
		end

		local function createRowLabel(row, text, rightSpace)
			return create("TextLabel", {
				Size = UDim2.new(1, -(rightSpace or 0), 1, 0),
				Position = UDim2.fromOffset(6, 0),
				BackgroundTransparency = 1,
				Text = tostring(text),
				Font = THEME.Font,
				TextSize = 14,
				TextColor3 = THEME.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = row,
			})
		end

		function Section:CreateButton(text, callback)
			local Button = create("TextButton", {
				Size = UDim2.new(1, 0, 0, 28),
				BackgroundColor3 = THEME.Element,
				BorderSizePixel = 0,
				Text = tostring(text),
				Font = THEME.Font,
				TextSize = 14,
				TextColor3 = THEME.Text,
				ZIndex = 4,
				Parent = SectionFrame,
			})
			makeStroke(Button, THEME.StrokeLight, 1)

			connect(Button.MouseButton1Click, function()
				safeCall(callback)
			end)

			return Button
		end

		function Section:CreateLabel(name, text)
			local fullText = text == nil
				and tostring(name)
				or tostring(name) .. ": " .. tostring(text)

			local Label = create("TextLabel", {
				Size = UDim2.new(1, 0, 0, 24),
				BackgroundTransparency = 1,
				Text = fullText,
				Font = THEME.Font,
				TextSize = 14,
				TextColor3 = THEME.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 4,
				Parent = SectionFrame,
			})

			return {
				set = function(newText)
					Label.Text = tostring(newText)
				end,
				instance = Label,
			}
		end

		function Section:CreateToggle(name, callback)
			local state = false
			local Row = createRow(28)
			createRowLabel(Row, name, 42)

			local ToggleButton = create("TextButton", {
				Size = UDim2.fromOffset(28, 22),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -4, 0.5, 0),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BorderSizePixel = 0,
				Text = "X",
				Font = THEME.Font,
				TextSize = 14,
				TextColor3 = THEME.Accent,
				ZIndex = 5,
				Parent = Row,
			})
			makeStroke(ToggleButton, THEME.StrokeLight, 1)

			local function refresh(runCallback)
				ToggleButton.Text = state and "/" or "X"
				ToggleButton.TextColor3 = state and THEME.Success or THEME.Accent
				ToggleButton.BackgroundColor3 = state
					and Color3.fromRGB(20, 60, 20)
					or Color3.fromRGB(40, 40, 40)

				if runCallback then
					safeCall(callback, state)
				end
			end

			connect(ToggleButton.MouseButton1Click, function()
				state = not state
				refresh(true)
			end)

			refresh(false)

			return {
				get = function()
					return state
				end,
				set = function(value, silent)
					state = value == true
					refresh(not silent)
				end,
			}
		end

		function Section:CreateSlider(name, minValue, maxValue, defaultValue, rounding, callback)
			assert(maxValue > minValue, "CreateSlider: maxValue must be greater than minValue")

			local decimals = tonumber(rounding) or 0
			local factor = 10 ^ decimals
			local value = math.clamp(tonumber(defaultValue) or minValue, minValue, maxValue)
			local Row = createRow(44)

			local Label = create("TextLabel", {
				Size = UDim2.new(1, 0, 0, 20),
				BackgroundTransparency = 1,
				Text = "",
				Font = THEME.Font,
				TextSize = 12,
				TextColor3 = THEME.Text,
				ZIndex = 5,
				Parent = Row,
			})

			local Track = create("Frame", {
				Size = UDim2.new(1, -12, 0, 14),
				Position = UDim2.fromOffset(6, 24),
				BackgroundColor3 = Color3.fromRGB(25, 25, 25),
				BorderSizePixel = 0,
				Active = true,
				ZIndex = 5,
				Parent = Row,
			})

			local Fill = create("Frame", {
				Size = UDim2.fromScale(0, 1),
				BackgroundColor3 = THEME.Accent,
				BorderSizePixel = 0,
				ZIndex = 6,
				Parent = Track,
			})

			local function formatValue(number)
				if decimals <= 0 then
					return tostring(math.floor(number + 0.5))
				end

				return string.format("%." .. decimals .. "f", number)
			end

			local function setValue(newValue, runCallback)
				local rounded = math.floor(newValue * factor + 0.5) / factor
				value = math.clamp(rounded, minValue, maxValue)
				local percent = (value - minValue) / (maxValue - minValue)
				Fill.Size = UDim2.fromScale(percent, 1)
				Label.Text = tostring(name) .. ": " .. formatValue(value)

				if runCallback then
					safeCall(callback, value)
				end
			end

			local sliderController = {}

			function sliderController.setFromX(mouseX)
				if Track.AbsoluteSize.X <= 0 then
					return
				end

				local percent = math.clamp(
					(mouseX - Track.AbsolutePosition.X) / Track.AbsoluteSize.X,
					0,
					1
				)
				setValue(minValue + (maxValue - minValue) * percent, true)
			end

			connect(Track.InputBegan, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					activeSlider = sliderController
					sliderController.setFromX(input.Position.X)
				end
			end)

			setValue(value, false)

			return {
				get = function()
					return value
				end,
				set = function(newValue, silent)
					setValue(tonumber(newValue) or value, not silent)
				end,
			}
		end

		function Section:CreateDropdown(name, options, defaultIndex, callback)
			local values = options or {}
			local current = values[defaultIndex or 1] or values[1] or "None"
			local Row = createRow(28)
			createRowLabel(Row, name, 174)

			local DropdownButton = create("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -4, 0.5, 0),
				Size = UDim2.fromOffset(166, 22),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BorderSizePixel = 0,
				Text = tostring(current),
				Font = THEME.Font,
				TextSize = 12,
				TextColor3 = THEME.Text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = Row,
			})
			makeStroke(DropdownButton, THEME.StrokeLight, 1)

			local function containsValue(value)
				for _, option in ipairs(values) do
					if option == value then
						return true
					end
				end

				return false
			end

			local function openDropdown()
				closeActiveDropdown()

				local visibleCount = math.max(1, math.min(#values, 7))
				local relativeX = DropdownButton.AbsolutePosition.X - Main.AbsolutePosition.X
				local relativeY = DropdownButton.AbsolutePosition.Y - Main.AbsolutePosition.Y

				local List = create("ScrollingFrame", {
					Name = "DropdownList",
					Position = UDim2.fromOffset(relativeX, relativeY + DropdownButton.AbsoluteSize.Y + 2),
					Size = UDim2.fromOffset(
						math.max(166, DropdownButton.AbsoluteSize.X),
						visibleCount * 24 + 4
					),
					BackgroundColor3 = THEME.Section,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromOffset(0, math.max(1, #values) * 24 + 4),
					ScrollBarThickness = #values > visibleCount and 3 or 0,
					ScrollBarImageColor3 = THEME.Accent,
					ZIndex = 100,
					Parent = Main,
				})
				makeStroke(List, THEME.Stroke, 1)
				activeDropdown = List

				create("UIPadding", {
					PaddingTop = UDim.new(0, 2),
					PaddingBottom = UDim.new(0, 2),
					Parent = List,
				})

				create("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = List,
				})

				if #values == 0 then
					create("TextLabel", {
						Size = UDim2.new(1, -4, 0, 24),
						BackgroundTransparency = 1,
						Text = "No players",
						Font = THEME.Font,
						TextSize = 12,
						TextColor3 = THEME.TextDim,
						ZIndex = 101,
						Parent = List,
					})
				end

				for _, option in ipairs(values) do
					local optionValue = option
					local Item = create("TextButton", {
						Size = UDim2.new(1, -4, 0, 24),
						BackgroundColor3 = optionValue == current
							and Color3.fromRGB(40, 40, 40)
							or Color3.fromRGB(20, 20, 20),
						BorderSizePixel = 0,
						Text = tostring(optionValue),
						Font = THEME.Font,
						TextSize = 12,
						TextColor3 = THEME.Text,
						TextTruncate = Enum.TextTruncate.AtEnd,
						ZIndex = 101,
						Parent = List,
					})

					Item.MouseButton1Click:Connect(function()
						current = optionValue
						DropdownButton.Text = tostring(optionValue)
						closeActiveDropdown()
						safeCall(callback, optionValue)
					end)
				end
			end

			connect(DropdownButton.MouseButton1Click, openDropdown)

			return {
				get = function()
					return current
				end,
				set = function(value, silent)
					current = value
					DropdownButton.Text = tostring(value)
					if not silent then
						safeCall(callback, value)
					end
				end,
				setOptions = function(newOptions)
					values = newOptions or {}
					if not containsValue(current) then
						current = values[1] or "None"
						DropdownButton.Text = tostring(current)
					end
					closeActiveDropdown()
				end,
			}
		end

		function Section:CreateKeybind(name, defaultKey, toggleMode, callback, isMenuKey)
			local key = defaultKey or Enum.KeyCode.Unknown
			local Row = createRow(28)
			createRowLabel(Row, name, 78)

			local KeyButton = create("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -4, 0.5, 0),
				Size = UDim2.fromOffset(70, 22),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BorderSizePixel = 0,
				Text = key.Name,
				Font = THEME.Font,
				TextSize = 12,
				TextColor3 = THEME.Text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = Row,
			})
			makeStroke(KeyButton, THEME.StrokeLight, 1)

			local binding = {
				key = key,
				toggleMode = toggleMode == true,
				callback = callback,
				isMenuKey = isMenuKey == true,
				active = false,
				listening = false,
				button = KeyButton,
			}
			table.insert(keybinds, binding)

			connect(KeyButton.MouseButton1Click, function()
				for _, otherBinding in ipairs(keybinds) do
					if otherBinding ~= binding and otherBinding.listening then
						otherBinding.listening = false
						otherBinding.button.Text = otherBinding.key.Name
						otherBinding.button.TextColor3 = THEME.Text
					end
				end

				binding.listening = true
				KeyButton.Text = "..."
				KeyButton.TextColor3 = THEME.Accent
			end)

			return {
				get = function()
					return binding.key
				end,
				set = function(newKey)
					binding.key = newKey
					KeyButton.Text = newKey.Name

					if binding.isMenuKey then
						Library:SetMenuKey(newKey)
					end
				end,
			}
		end

		return Section
	end

	return Tab
end

-- ===== SCRIPT STATE =====

local scriptRunning = true
local controls = {}

local speedValue = 16
local jumpValue = 50
local gravityValue = 196.2

local infinityJumpEnabled = false
local autoBhopEnabled = false
local teleportClickEnabled = false
local farmCoinsEnabled = false

local farmRadius = 50
local updateInterval = 1 / 30
local lastUpdate = 0
local lastCoinUpdate = 0

local flyEnabled = false
local flyRunning = false
local flyBodyGyro = nil
local flyBodyVelocity = nil
local flyMaxSpeed = 50

local fogEnabled = false
local fogDensity = 0.5

local loopConnection = nil
local coinAddedConnection = nil
local characterAddedConnection = nil
local teleportClickConnection = nil
local playerAddedConnection = nil
local playerRemovingConnection = nil

local coinCache = {}

local originalLighting = {
	Ambient = Lighting.Ambient,
	Brightness = Lighting.Brightness,
	OutdoorAmbient = Lighting.OutdoorAmbient,
	FogStart = Lighting.FogStart,
	FogEnd = Lighting.FogEnd,
	GlobalShadows = Lighting.GlobalShadows,
}

local function getCharacter()
	return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getHumanoid()
	local character = getCharacter()
	return character and character:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
	local character = getCharacter()
	return character and character:FindFirstChild("HumanoidRootPart")
end

local function applySpeedJump()
	local humanoid = getHumanoid()
	if not humanoid then
		return
	end

	pcall(function()
		humanoid.WalkSpeed = speedValue
		humanoid.JumpPower = jumpValue
	end)
end

local function collectCoin(coin)
	if not coin or not coin.Parent or not coin:IsA("BasePart") then
		return
	end

	local root = getRoot()
	if root then
		coin.CFrame = root.CFrame * CFrame.new(0, 2, 0)
	end
end

local function cacheExistingCoins()
	table.clear(coinCache)

	for _, object in ipairs(Workspace:GetDescendants()) do
		if object:IsA("BasePart") and object.Name == "Coin" then
			coinCache[object] = true
		end
	end
end

local function collectNearbyCoins()
	if not farmCoinsEnabled then
		return
	end

	local root = getRoot()
	if not root then
		return
	end

	local rootPosition = root.Position

	for coin in pairs(coinCache) do
		if not coin.Parent then
			coinCache[coin] = nil
		elseif (coin.Position - rootPosition).Magnitude <= farmRadius then
			collectCoin(coin)
		end
	end
end

local function setCoinFarmConnection(enabled)
	if coinAddedConnection then
		coinAddedConnection:Disconnect()
		coinAddedConnection = nil
	end

	if not enabled then
		table.clear(coinCache)
		return
	end

	cacheExistingCoins()
	coinAddedConnection = Workspace.DescendantAdded:Connect(function(descendant)
		if farmCoinsEnabled and descendant:IsA("BasePart") and descendant.Name == "Coin" then
			coinCache[descendant] = true
		end
	end)
end

local stopFly

local function startFly()
	if flyRunning or not flyEnabled then
		return
	end

	local character = getCharacter()
	local humanoid = getHumanoid()
	if not character or not humanoid then
		return
	end

	local torso = character:FindFirstChild("Torso")
		or character:FindFirstChild("UpperTorso")
		or getRoot()

	if not torso then
		return
	end

	flyBodyGyro = Instance.new("BodyGyro")
	flyBodyGyro.P = 9e4
	flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	flyBodyGyro.CFrame = torso.CFrame
	flyBodyGyro.Parent = torso

	flyBodyVelocity = Instance.new("BodyVelocity")
	flyBodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
	flyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	flyBodyVelocity.Parent = torso

	humanoid.PlatformStand = true

	local animate = character:FindFirstChild("Animate")
	if animate then
		animate.Disabled = true
	end

	flyRunning = true
	local currentSpeed = 0

	RunService:BindToRenderStep(
		"OurLibFlyLoop",
		Enum.RenderPriority.Camera.Value + 1,
		function()
			if not scriptRunning or not flyRunning or not flyEnabled then
				stopFly()
				return
			end

			if not flyBodyGyro or not flyBodyVelocity or not torso.Parent then
				stopFly()
				return
			end

			local forward = UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0
			local backward = UserInputService:IsKeyDown(Enum.KeyCode.S) and -1 or 0
			local left = UserInputService:IsKeyDown(Enum.KeyCode.A) and -1 or 0
			local right = UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0
			local up = UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or 0
			local down = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and -1 or 0

			local movingHorizontal = left + right ~= 0 or forward + backward ~= 0

			if movingHorizontal then
				currentSpeed = math.min(
					currentSpeed + 0.5 + currentSpeed / math.max(flyMaxSpeed, 1),
					flyMaxSpeed
				)
			else
				currentSpeed = math.max(currentSpeed - 1, 0)
			end

			local camera = Workspace.CurrentCamera
			if not camera then
				return
			end

			local cameraCFrame = camera.CFrame
			local moveDirection = cameraCFrame.LookVector * (forward + backward)
				+ cameraCFrame.RightVector * (left + right)
			local verticalDirection = Vector3.new(0, up + down, 0)

			if moveDirection.Magnitude > 1 then
				moveDirection = moveDirection.Unit
			end

			flyBodyVelocity.Velocity = moveDirection * currentSpeed
				+ verticalDirection * math.max(currentSpeed + 10, 25)

			if moveDirection.Magnitude > 0.01 then
				flyBodyGyro.CFrame = CFrame.lookAt(
					torso.Position,
					torso.Position + moveDirection
				)
			else
				flyBodyGyro.CFrame = CFrame.new(torso.Position, torso.Position + cameraCFrame.LookVector)
			end
		end
	)
end

stopFly = function()
	if flyRunning then
		RunService:UnbindFromRenderStep("OurLibFlyLoop")
	end

	flyRunning = false

	if flyBodyGyro then
		flyBodyGyro:Destroy()
		flyBodyGyro = nil
	end

	if flyBodyVelocity then
		flyBodyVelocity:Destroy()
		flyBodyVelocity = nil
	end

	local character = LocalPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		humanoid.PlatformStand = false
	end

	local animate = character and character:FindFirstChild("Animate")
	if animate then
		animate.Disabled = false
	end
end

local function processLoop()
	local now = os.clock()
	if now - lastUpdate < updateInterval then
		return
	end

	lastUpdate = now

	local humanoid = getHumanoid()
	if humanoid then
		pcall(function()
			humanoid.WalkSpeed = speedValue
			humanoid.JumpPower = jumpValue
		end)

		if infinityJumpEnabled then
			local state = humanoid:GetState()
			if state == Enum.HumanoidStateType.Jumping
				or state == Enum.HumanoidStateType.Freefall then
				humanoid.Jump = true
			end
		end

		if autoBhopEnabled then
			local state = humanoid:GetState()
			if state == Enum.HumanoidStateType.Landed
				or state == Enum.HumanoidStateType.Running then
				humanoid.Jump = true
			end
		end
	end

	Workspace.Gravity = gravityValue

	if farmCoinsEnabled and now - lastCoinUpdate >= 0.1 then
		lastCoinUpdate = now
		collectNearbyCoins()
	end
end

local function loopIsNeeded()
	return infinityJumpEnabled
		or autoBhopEnabled
		or farmCoinsEnabled
		or speedValue ~= 16
		or jumpValue ~= 50
		or math.abs(gravityValue - 196.2) > 0.001
end

local function updateLoopState()
	if loopIsNeeded() then
		if not loopConnection then
			loopConnection = RunService.Heartbeat:Connect(processLoop)
		end
	elseif loopConnection then
		loopConnection:Disconnect()
		loopConnection = nil
	end
end

local function applyFog()
	if fogEnabled then
		Lighting.FogStart = 0
		Lighting.FogEnd = math.max(5, 1000 * (1 - fogDensity))
	else
		Lighting.FogStart = originalLighting.FogStart
		Lighting.FogEnd = originalLighting.FogEnd
	end
end

local function deleteInBatches(classNames)
	local objects = Workspace:GetDescendants()
	local deleted = 0

	for _, object in ipairs(objects) do
		if classNames[object.ClassName] then
			object:Destroy()
			deleted = deleted + 1

			if deleted % 200 == 0 then
				task.wait()
			end
		end
	end

	return deleted
end

local function getPlayerNames()
	local names = {}

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			table.insert(names, player.Name)
		end
	end

	table.sort(names)
	return names
end

-- ===== TABS AND CONTROLS =====

local MovementTab = Library:CreateTab("Movement")
local FarmTab = Library:CreateTab("Farm")
local VisualTab = Library:CreateTab("Visual")
-- Последняя вкладка-кнопка содержит настройки для GitHub-версии скрипта.
local SettingsTab = Library:CreateTab("Settings")

local MovementSection = MovementTab:CreateSection("Movement Settings")
local ExtraSection = MovementTab:CreateSection("Extra")
local FarmSection = FarmTab:CreateSection("Coin Farm")
local VisualSection = VisualTab:CreateSection("Visual Settings")
local MenuSection = SettingsTab:CreateSection("Menu")

MovementSection:CreateSlider("Speed", 12, 350, 16, 0, function(value)
	speedValue = value
	applySpeedJump()
	updateLoopState()
end)

MovementSection:CreateSlider("Jump Power", 40, 200, 50, 0, function(value)
	jumpValue = value
	applySpeedJump()
	updateLoopState()
end)

controls.InfJump = MovementSection:CreateToggle("Infinity Jump", function(value)
	infinityJumpEnabled = value
	updateLoopState()
end)

MovementSection:CreateSlider("Gravity", 0, 200, 196.2, 1, function(value)
	gravityValue = value
	Workspace.Gravity = value
	updateLoopState()
end)

MovementSection:CreateButton("Dash (forward)", function()
	local root = getRoot()
	if not root then
		return
	end

	local direction = root.CFrame.LookVector * 50
	root.AssemblyLinearVelocity = Vector3.new(direction.X, root.AssemblyLinearVelocity.Y, direction.Z)
end)

local PlayerDropdown = ExtraSection:CreateDropdown(
	"Select Player",
	getPlayerNames(),
	1,
	function()
		-- Выбор сохраняется внутри элемента.
	end
)

ExtraSection:CreateButton("Refresh player list", function()
	PlayerDropdown.setOptions(getPlayerNames())
end)

ExtraSection:CreateButton("Teleport to selected", function()
	local targetName = PlayerDropdown.get()
	if not targetName or targetName == "None" then
		return
	end

	local targetPlayer = Players:FindFirstChild(targetName)
	local targetCharacter = targetPlayer and targetPlayer.Character
	local targetRoot = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
	local root = getRoot()

	if root and targetRoot then
		root.CFrame = targetRoot.CFrame * CFrame.new(0, 3, 0)
	end
end)

controls.TeleportClick = ExtraSection:CreateToggle("Teleport on mouse click", function(value)
	teleportClickEnabled = value
end)

controls.Fly = ExtraSection:CreateToggle("Fly mode", function(value)
	flyEnabled = value

	if value then
		startFly()
	else
		stopFly()
	end
end)

ExtraSection:CreateSlider("Fly Speed", 50, 350, 50, 0, function(value)
	flyMaxSpeed = value
end)

controls.AutoBhop = ExtraSection:CreateToggle("Auto Bhop", function(value)
	autoBhopEnabled = value
	updateLoopState()
end)

controls.FarmCoins = FarmSection:CreateToggle("Collect Summer Coins", function(value)
	farmCoinsEnabled = value
	setCoinFarmConnection(value)

	if value then
		collectNearbyCoins()
	end

	updateLoopState()
end)

FarmSection:CreateSlider("Collection Radius", 10, 500, 50, 0, function(value)
	farmRadius = value
end)

VisualSection:CreateButton("Delete all textures", function()
	task.spawn(function()
		local count = deleteInBatches({
			Texture = true,
			Decal = true,
		})
		print("[OurLib] Deleted textures and decals:", count)
	end)
end)

controls.Fog = VisualSection:CreateToggle("Enable Fog", function(value)
	fogEnabled = value
	applyFog()
end)

VisualSection:CreateSlider("Fog Density", 0, 1, 0.5, 2, function(value)
	fogDensity = value
	applyFog()
end)

controls.RemoveShadows = VisualSection:CreateToggle("Remove Shadows", function(value)
	Lighting.GlobalShadows = not value
end)

VisualSection:CreateButton("Remove all particles", function()
	task.spawn(function()
		local count = deleteInBatches({
			ParticleEmitter = true,
		})
		print("[OurLib] Deleted particles:", count)
	end)
end)

controls.NightMode = VisualSection:CreateToggle("Night Mode", function(value)
	if value then
		Lighting.Ambient = Color3.new(0.05, 0.05, 0.05)
		Lighting.Brightness = 0.2
		Lighting.OutdoorAmbient = Color3.new(0.05, 0.05, 0.05)
	else
		Lighting.Ambient = originalLighting.Ambient
		Lighting.Brightness = originalLighting.Brightness
		Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
	end
end)

local unloadScript

MenuSection:CreateKeybind(
	"Menu Key",
	Enum.KeyCode.RightShift,
	false,
	nil,
	true
)

MenuSection:CreateSlider("UI Scale", 75, 125, 100, 0, function(value)
	Library:SetScale(value / 100)
end)

MenuSection:CreateButton("Reset window", function()
	Library:ResetWindow()
end)

MenuSection:CreateLabel("GitHub loader", "Ready")
MenuSection:CreateLabel("External UI downloads", "Disabled")

MenuSection:CreateButton("Hide GUI", function()
	Library:SetVisible(false)
end)

MenuSection:CreateButton("Unload", function()
	if unloadScript then
		unloadScript()
	end
end)

-- ===== SINGLE FEATURE CONNECTIONS =====

teleportClickConnection = Mouse.Button1Down:Connect(function()
	if not scriptRunning or not teleportClickEnabled then
		return
	end

	local root = getRoot()
	if root then
		local targetPosition = Mouse.Hit.Position
		root.CFrame = CFrame.new(targetPosition.X, targetPosition.Y + 3, targetPosition.Z)
	end
end)

local function refreshPlayerDropdown()
	PlayerDropdown.setOptions(getPlayerNames())
end

playerAddedConnection = Players.PlayerAdded:Connect(refreshPlayerDropdown)
playerRemovingConnection = Players.PlayerRemoving:Connect(function()
	task.defer(refreshPlayerDropdown)
end)

characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function()
	if flyRunning then
		stopFly()
	end

	task.wait(0.5)

	if not scriptRunning then
		return
	end

	applySpeedJump()
	updateLoopState()

	if flyEnabled then
		startFly()
	end
end)

-- ===== CLEAN UNLOAD =====

local originalGravity = Workspace.Gravity

unloadScript = function()
	if not scriptRunning then
		return
	end

	scriptRunning = false
	flyEnabled = false
	farmCoinsEnabled = false
	teleportClickEnabled = false

	stopFly()

	if loopConnection then
		loopConnection:Disconnect()
		loopConnection = nil
	end

	if coinAddedConnection then
		coinAddedConnection:Disconnect()
		coinAddedConnection = nil
	end

	if characterAddedConnection then
		characterAddedConnection:Disconnect()
		characterAddedConnection = nil
	end

	if teleportClickConnection then
		teleportClickConnection:Disconnect()
		teleportClickConnection = nil
	end

	if playerAddedConnection then
		playerAddedConnection:Disconnect()
		playerAddedConnection = nil
	end

	if playerRemovingConnection then
		playerRemovingConnection:Disconnect()
		playerRemovingConnection = nil
	end

	Workspace.Gravity = originalGravity
	Lighting.Ambient = originalLighting.Ambient
	Lighting.Brightness = originalLighting.Brightness
	Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
	Lighting.FogStart = originalLighting.FogStart
	Lighting.FogEnd = originalLighting.FogEnd
	Lighting.GlobalShadows = originalLighting.GlobalShadows

	Library:Destroy()
	print("[OurLib] Script unloaded")
end

-- ===== INITIAL APPLY =====

Library:SetTitle("Advanced Script | RightShift")
applySpeedJump()
applyFog()

print("[OurLib] Script loaded successfully")

--[[
	ОДНА СТРОКА ДЛЯ ЗАПУСКА ПОСЛЕ ЗАГРУЗКИ ФАЙЛА НА GITHUB:

	loadstring(game:HttpGet("https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/our_lib_script.lua"))()

	На GitHub лучше назвать файл our_lib_script.lua.
	Замени USERNAME и REPOSITORY на свои данные GitHub.
	Клавишу меню и масштаб после запуска можно менять во вкладке Settings.
]]
