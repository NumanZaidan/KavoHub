-- [Original by Hyperion : CSGO Cheat]
-- [[https://hyperion.vip/]]

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local LocalPlayer = game:GetService('Players').LocalPlayer;
local Tween = game:GetService('TweenService')
local Run = game:GetService('RunService')
local Core = (gethui and gethui()) or game:FindFirstChild'CoreGui' or LocalPlayer.PlayerGui;
local UIS = game:GetService('UserInputService')
local TextService = game:GetService('TextService')
local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end);

local function cretate_button(asd)
	local button=Instance.new('TextButton')
	button.Size=UDim2.new(1,0,1,0)
	button.BackgroundTransparency=1
	button.TextTransparency=1
	button.Text=""
	button.Parent=asd
	button.ZIndex=5000
	return button
end


local function ToDefault(val,def)
	return val or def
end

local NoHyper = {
	Theme = {
		BACKGROUND = Color3.fromRGB(34, 37, 42),
		SECTION = Color3.fromRGB(39, 42, 48),
		MAIN = Color3.fromRGB(189, 48, 37),
		STROKE = Color3.fromRGB(27, 30, 34),
		TOUCH = Color3.fromRGB(103, 26, 20),
		SYSTEM = Color3.fromRGB(225, 57, 44)
	},
	AutoUpdate = {},
	SectionWidth = 0.95
}

function NoHyper.set_theme(name:string) -- [[ YOU CAN CUSTOM THEME ]]
	if name:lower() == 'nohyper' then
		NoHyper.Theme.BACKGROUND = Color3.fromRGB(34, 37, 42)
		NoHyper.Theme.SECTION = Color3.fromRGB(39, 42, 48)
		NoHyper.Theme.MAIN = Color3.fromRGB(189, 48, 37)
		NoHyper.Theme.STROKE = Color3.fromRGB(27, 30, 34)
		NoHyper.Theme.TOUCH = Color3.fromRGB(103, 26, 20)
		NoHyper.Theme.SYSTEM = Color3.fromRGB(225, 57, 44)
	elseif name:lower() == 'bedol' then -- Theme for me!!!!!
		NoHyper.Theme.BACKGROUND = Color3.fromRGB(34, 37, 42)
		NoHyper.Theme.SECTION = Color3.fromRGB(39, 42, 48)
		NoHyper.Theme.MAIN = Color3.fromRGB(189, 0, 0)
		NoHyper.Theme.STROKE = Color3.fromRGB(27, 30, 34)
		NoHyper.Theme.TOUCH = Color3.fromRGB(103, 0, 0)
		NoHyper.Theme.SYSTEM = Color3.fromRGB(225, 0, 0)
	elseif name:lower() == 'neverlose' then
		NoHyper.Theme.BACKGROUND = Color3.fromRGB(3, 15, 32)
		NoHyper.Theme.SECTION = Color3.fromRGB(4, 19, 43)
		NoHyper.Theme.MAIN = Color3.fromRGB(69, 185, 217)
		NoHyper.Theme.STROKE = Color3.fromRGB(12, 55, 111)
		NoHyper.Theme.TOUCH = Color3.fromRGB(69, 181, 248)
		NoHyper.Theme.SYSTEM = Color3.fromRGB(74, 202, 234)
	elseif name:lower() == 'green' then
		NoHyper.Theme.BACKGROUND = Color3.fromRGB(3, 24, 19)
		NoHyper.Theme.SECTION = Color3.fromRGB(4, 29, 23)
		NoHyper.Theme.MAIN = Color3.fromRGB(75, 246, 138)
		NoHyper.Theme.STROKE = Color3.fromRGB(15, 35, 31)
		NoHyper.Theme.TOUCH = Color3.fromRGB(57, 186, 104)
		NoHyper.Theme.SYSTEM = Color3.fromRGB(75, 246, 138)
	elseif name:lower() == 'tokyo' then
		NoHyper.Theme.BACKGROUND = Color3.fromRGB(26, 27, 38)
		NoHyper.Theme.SECTION = Color3.fromRGB(22, 22, 32)
		NoHyper.Theme.MAIN = Color3.fromRGB(181, 186, 209)
		NoHyper.Theme.STROKE = Color3.fromRGB(68, 72, 89)
		NoHyper.Theme.TOUCH = Color3.fromRGB(36, 36, 51)
		NoHyper.Theme.SYSTEM = Color3.fromRGB(189, 194, 218)
	end
end

local function Signal(list:{{name:string,callback:FunctionalTest}})
	local k = {}

	for i,v in ipairs(list) do
		k[v.name] = v.callback
	end

	return k
end

local function scrolling_connect(scrollframe:ScrollingFrame)
	task.spawn(function()
		local addres = 45
		local UIListLayout:UIListLayout = scrollframe:WaitForChild('UIListLayout',9999999)
		scrollframe.CanvasSize=UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y+addres)

		UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			scrollframe.CanvasSize=UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y+addres)
		end)
	end)
end

local function SetImage(name:string,image:ImageLabel)
	name = name or "ADS"
	name = name:lower()

	local NigImage = "rbxassetid://3926305904"

	if name == "ads" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(205,565)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "list" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(485,205)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "folder" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(805,45)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "earth" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(604,324)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "locked" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(524, 644)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "home" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(964, 205)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "positon" or name == 'gps' then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(325, 565)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "notify" or name == 'notification' then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(325, 565)
		image.ImageRectSize = Vector2.new(35,35)
		return
	end

	if name == "close" or name == 'no' then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(284, 4)
		image.ImageRectSize = Vector2.new(24, 24)
		return
	end

	if name == "color" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(44, 964)
		image.ImageRectSize = Vector2.new(36, 36)
		return
	end

	image.ImageRectOffset = Vector2.new(0,0)
	image.ImageRectSize = Vector2.new(0,0)

	if name == "settings" then
		image.Image = "rbxassetid://7734053495"
	end

	if name == "smartphone" then
		image.Image = "rbxassetid://7734058979"
	end

	if name == "crown" then
		image.Image = "rbxassetid://7733765398"
	end

	if name == "save" then
		image.Image = "rbxassetid://7734052335"
	end

	if name == "hash" then
		image.Image = "rbxassetid://7733955740"
	end

	if name == "server" then
		image.Image = "rbxassetid://7734053426"
	end

	if name == "option" then
		image.Image = "rbxassetid://7734021300"
	end

	if name == "link" then
		image.Image = "rbxassetid://7733978098"
	end

	if name == "copy" then
		image.Image = "rbxassetid://7733764083"
	end

	if name == "cpu" then
		image.Image = "rbxassetid://7733765045"
	end

	if name == "moon" then
		image.Image = "rbxassetid://7743870134"
	end

	if name == "wallet" then
		image.Image = "rbxassetid://7743877573"
	end
end


function NoHyper.new(WindowName,WindowLogo,WindowDescription)
	local HyperWindow = {
		Tabs = {},
		Size = UDim2.new(0.230000004, 350, 0.25, 250),
		Toggle = Enum.KeyCode.LeftControl
	}

	WindowName = ToDefault(WindowName,'Hello, NoHyper')
	WindowLogo = ToDefault(WindowLogo,'http://www.roblox.com/asset/?id=16530565354') -- sorry it's Cry Of Fear Logo
	WindowDescription = ToDefault(WindowDescription,'Welcome back!')

	local NoHyperUI = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Contact = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local YoutubeButton = Instance.new("ImageButton")
	local WebsiteButton = Instance.new("ImageButton")
	local DiscordButton = Instance.new("ImageButton")
	local TabButtonList = Instance.new("Frame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local TabSystem = Instance.new("Frame")
	local Top = Instance.new("Frame")
	local LogoHub = Instance.new("ImageLabel")
	local MainText = Instance.new("TextLabel")
	local DescriptionText = Instance.new("TextLabel")
	local DropShadow = Instance.new("ImageLabel")
	local CloseButton = Instance.new("ImageButton")
	local TickUI = Instance.new("Frame")
	local View = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UICorner_3 = Instance.new("UICorner")

	NoHyperUI:GetPropertyChangedSignal('Enabled'):Connect(function()
		if not NoHyperUI.Enabled then
			NoHyperUI.Enabled = true
		end
	end)


	HyperWindow.ScreenSource = NoHyperUI

	NoHyperUI.Name = tostring("ui.protect.")..tostring(math.random(1,100))..tostring(Random.new():NextNumber(0.1,0.9))..tostring(Random.new():NextNumber(0.1,0.9))..tostring(Random.new():NextNumber(0.1,0.9))
	NoHyperUI.Parent = Core
	NoHyperUI.ResetOnSpawn = false
	NoHyperUI.IgnoreGuiInset = true
	NoHyperUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
	ProtectGui(NoHyperUI)

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = NoHyperUI
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = NoHyper.Theme.BACKGROUND
	MainFrame.BackgroundTransparency = 1.000
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = HyperWindow.Size
	MainFrame.Active = true

	Frame.Parent = MainFrame
	Frame.BackgroundColor3 = NoHyper.Theme.BACKGROUND
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.Position = UDim2.fromScale(-1,0)
	Frame.ClipsDescendants = true

	UICorner.Parent = Frame
	UICorner.CornerRadius = UDim.new(0,10)

	Contact.Name = "Contact"
	Contact.Parent = Frame
	Contact.AnchorPoint = Vector2.new(0.5, 0)
	Contact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Contact.BackgroundTransparency = 1.000
	Contact.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Contact.BorderSizePixel = 0
	Contact.Position = UDim2.new(0.125, 0, 1.25, 0)
	Contact.Size = UDim2.new(0.230000004, 0, 0.0484971367, 0)

	UIListLayout.Parent = Contact
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 10)

	YoutubeButton.Name = "YoutubeButton"
	YoutubeButton.Parent = Contact
	YoutubeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	YoutubeButton.BackgroundTransparency = 1.000
	YoutubeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	YoutubeButton.BorderSizePixel = 0
	YoutubeButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	YoutubeButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	YoutubeButton.ZIndex = 5
	YoutubeButton.Image = "rbxassetid://5027762797"
	YoutubeButton.ScaleType = Enum.ScaleType.Crop
	YoutubeButton.Visible = false

	WebsiteButton.Name = "WebsiteButton"
	WebsiteButton.Parent = Contact
	WebsiteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WebsiteButton.BackgroundTransparency = 1.000
	WebsiteButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WebsiteButton.BorderSizePixel = 0
	WebsiteButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	WebsiteButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	WebsiteButton.ZIndex = 5
	WebsiteButton.Image = "rbxassetid://3926305904"
	WebsiteButton.ImageColor3 = Color3.fromRGB(94, 186, 97)
	WebsiteButton.ImageRectOffset = Vector2.new(604, 324)
	WebsiteButton.ImageRectSize = Vector2.new(35, 35)
	WebsiteButton.ScaleType = Enum.ScaleType.Fit
	WebsiteButton.Visible = false

	DiscordButton.Name = "DiscordButton"
	DiscordButton.Parent = Contact
	DiscordButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DiscordButton.BackgroundTransparency = 1.000
	DiscordButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DiscordButton.BorderSizePixel = 0
	DiscordButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	DiscordButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	DiscordButton.ZIndex = 5
	DiscordButton.Image = "http://www.roblox.com/asset/?id=16759385019"
	DiscordButton.ScaleType = Enum.ScaleType.Fit
	DiscordButton.Visible = false

	TabButtonList.Name = "TabButtonList"
	TabButtonList.Parent = Frame
	TabButtonList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtonList.BackgroundTransparency = 1.000
	TabButtonList.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtonList.BorderSizePixel = 0
	TabButtonList.ClipsDescendants = true
	TabButtonList.Position = UDim2.new(-0.3, 0, 0.132051408, 0)
	TabButtonList.Size = UDim2.new(0.230000004, 0, 0.781199217, 0)
	TabButtonList.ZIndex = 3

	ScrollingFrame.Parent = TabButtonList
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.ClipsDescendants = false
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(1, 0, 0.949999988, 0)
	ScrollingFrame.ZIndex = 4
	ScrollingFrame.BottomImage = ""
	ScrollingFrame.ScrollBarThickness = 0
	ScrollingFrame.TopImage = ""

	UIListLayout_2.Parent = ScrollingFrame
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 6)

	scrolling_connect(ScrollingFrame)
	TabSystem.Name = "TabSystem"
	TabSystem.Parent = Frame
	TabSystem.AnchorPoint = Vector2.new(0.5, 0.5)
	TabSystem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabSystem.BackgroundTransparency = 1.000
	TabSystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabSystem.BorderSizePixel = 0
	TabSystem.ClipsDescendants = true
	TabSystem.Position = UDim2.new(1.5, 0, 0.571928024, 0)
	TabSystem.Size = UDim2.new(0.706745386, 0, 0.816288531, 0)
	TabSystem.ZIndex = 5

	Top.Name = "Top"
	Top.Parent = Frame
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(-3.28824861e-08, 0, 0, 0)
	Top.Size = UDim2.new(1.00000012, 0, 0.139001563, 0)

	LogoHub.Name = "LogoHub"
	LogoHub.Parent = Top
	LogoHub.AnchorPoint = Vector2.new(0.5, 0.5)
	LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoHub.BackgroundTransparency = 1.000
	LogoHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoHub.BorderSizePixel = 0
	LogoHub.Position = UDim2.new(0.125, 0, 0.5, 0)
	LogoHub.Size = UDim2.new(2.5, 0, 0.899999976, 0)
	LogoHub.SizeConstraint = Enum.SizeConstraint.RelativeYY
	LogoHub.Image = tostring(WindowLogo)
	LogoHub.ScaleType = Enum.ScaleType.Fit
	LogoHub.ImageTransparency = 1

	MainText.Name = "MainText"
	MainText.Parent = Top
	MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainText.BackgroundTransparency = 1.000
	MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainText.BorderSizePixel = 0
	MainText.Position = UDim2.new(0.270000011, 0, 0.125, 0)
	MainText.Size = UDim2.new(0.706745207, 0, 0.509708107, 0)
	MainText.Font = Enum.Font.GothamMedium
	MainText.Text = tostring(WindowName)
	MainText.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainText.TextScaled = true
	MainText.TextSize = 14.000
	MainText.TextStrokeTransparency = 0.800
	MainText.TextWrapped = true
	MainText.TextXAlignment = Enum.TextXAlignment.Left
	MainText.TextTransparency = 1

	DescriptionText.Name = "DescriptionText"
	DescriptionText.Parent = Top
	DescriptionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DescriptionText.BackgroundTransparency = 1.000
	DescriptionText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DescriptionText.BorderSizePixel = 0
	DescriptionText.Position = UDim2.new(0.27000013, 0, 0.749999702, 0)
	DescriptionText.Size = UDim2.new(0.706745267, 0, 0.187055781, 0)
	DescriptionText.Font = Enum.Font.GothamMedium
	DescriptionText.Text = tostring(WindowDescription)
	DescriptionText.TextColor3 = Color3.fromRGB(255, 255, 255)
	DescriptionText.TextScaled = true
	DescriptionText.TextSize = 14.000
	DescriptionText.TextStrokeTransparency = 0.800
	DescriptionText.TextTransparency = 1
	DescriptionText.TextWrapped = true
	DescriptionText.TextXAlignment = Enum.TextXAlignment.Left

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Frame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Rotation = 0.010
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 1
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	local cs = Tween:Create(Frame,TweenInfo.new(1),{
		Position = UDim2.fromScale(0,0)
	})

	cs:Play()
	cs.Completed:Connect(function()
		Tween:Create(DropShadow,TweenInfo.new(2),{
			ImageTransparency = 0.3,
		}):Play()

		Tween:Create(DropShadow,TweenInfo.new(1),{
			ImageTransparency = 0.5,
		}):Play()	
	end)

	-- Items
	delay(0.5,function()
		Tween:Create(CloseButton,TweenInfo.new(0.5),{
			ImageTransparency = 0
		}):Play()

		Tween:Create(TickUI,TweenInfo.new(0.5),{
			BackgroundTransparency = 0.5
		}):Play()
		Tween:Create(View,TweenInfo.new(0.5),{
			BackgroundTransparency = 0.5
		}):Play()
		Tween:Create(DescriptionText,TweenInfo.new(0.5),{
			TextTransparency = 0.500
		}):Play()
		Tween:Create(MainText,TweenInfo.new(0.5),{
			TextTransparency = 0
		}):Play()
		Tween:Create(LogoHub,TweenInfo.new(.55),{
			ImageTransparency = 0
		}):Play()
		Tween:Create(TabButtonList,TweenInfo.new(.55),{
			Position = UDim2.new(0.00999999139, 0, 0.132051408, 0)
		}):Play()

		Tween:Create(TabSystem,TweenInfo.new(.55),{
			Position = UDim2.new(0.623372614, 0, 0.571928024, 0)
		}):Play()

		Tween:Create(Contact,TweenInfo.new(.55),{
			Position = UDim2.new(0.125, 0, 0.934000015, 0)
		}):Play()
	end)

	CloseButton.ImageTransparency = 1
	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Frame
	CloseButton.AnchorPoint = Vector2.new(1, 0)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.99000001, 0, 0.0109999999, 0)
	CloseButton.Size = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
	CloseButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	CloseButton.ZIndex = 8
	CloseButton.Image = "rbxassetid://10002398990"

	TickUI.BackgroundTransparency = 1
	TickUI.Name = "TickUI"
	TickUI.Parent = Frame
	TickUI.AnchorPoint = Vector2.new(0, 0.5)
	TickUI.BackgroundColor3 = Color3.fromRGB(110, 112, 118)
	TickUI.BackgroundTransparency = 1
	TickUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TickUI.BorderSizePixel = 0
	TickUI.Position = UDim2.new(0.25, 0, 0.5, 0)
	TickUI.Size = UDim2.new(0, 1, 1, 0)
	TickUI.ZIndex = 3

	View.BackgroundTransparency = 1
	View.Name = "View"
	View.Parent = TickUI
	View.AnchorPoint = Vector2.new(0.5, 0.5)
	View.BackgroundColor3 = Color3.fromRGB(110, 112, 118)
	View.BackgroundTransparency =1 
	View.BorderColor3 = Color3.fromRGB(0, 0, 0)
	View.BorderSizePixel = 0
	View.Position = UDim2.new(0.5, 0, 0.5, 0)
	View.Size = UDim2.new(1, 1, 1, 0)
	View.ZIndex = 2

	UICorner_2.CornerRadius = UDim.new(0.5, 0)
	UICorner_2.Parent = View

	UICorner_3.CornerRadius = UDim.new(0.5, 0)
	UICorner_3.Parent = TickUI

  function HyperWindow:Delete()
        NoHyperUI:Destroy()
  end

	function HyperWindow:NewTab(TabName:string,TabIcon:string)
		local TabHyper = {
			Section = {}
		}

		local TabButton = Instance.new("Frame")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")
		local TextLabel = Instance.new("TextLabel")
		local Icon = Instance.new("ImageLabel")
		local Button = Instance.new("TextButton")

		TabButton.Name = TabName or "TabButton"
		TabButton.Parent = ScrollingFrame
		TabButton.BackgroundColor3 = NoHyper.Theme.MAIN
		TabButton.BackgroundTransparency = 1.000
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0.980000019, 0, 0.5, 0)

		UIAspectRatioConstraint.Parent = TabButton
		UIAspectRatioConstraint.AspectRatio = 5.000
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = TabButton

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(214, 214, 214)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
		UIGradient.Rotation = 190
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.04), NumberSequenceKeypoint.new(1.00, 0.00)}
		UIGradient.Parent = TabButton

		TextLabel.Parent = TabButton
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(1.02499998, 0, 0.50999999, 0)
		TextLabel.Size = UDim2.new(1.5, 0, 0.5, 0)
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = TabName or "Null"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = 0.950
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		Icon.Name = "Icon"
		Icon.Parent = TabButton
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.125, 0, 0.5, 0)
		Icon.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
		SetImage(TabIcon,Icon)

		Button.Name = "Button"
		Button.Parent = TabButton
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1.000
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.ZIndex = 5
		Button.Font = Enum.Font.SourceSans
		Button.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button.TextSize = 14.000
		Button.TextTransparency = 1.000

		--[=========================================]

		local TabFrame = Instance.new("Frame")
		local LeftFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local RightFrame = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		scrolling_connect(RightFrame) scrolling_connect(LeftFrame)
		TabFrame.Name = "TabFrame"
		TabFrame.Parent = TabSystem
		TabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabFrame.BackgroundTransparency = 1.000
		TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabFrame.BorderSizePixel = 0
		TabFrame.ClipsDescendants = true
		TabFrame.Position = UDim2.new(0.5, 0, 0.497500002, 0)
		TabFrame.Size = UDim2.new(0.949999988, 0, 0.980000019, 0)
		TabFrame.ZIndex = 6

		LeftFrame.Name = "LeftFrame"
		LeftFrame.Parent = TabFrame
		LeftFrame.Active = true
		LeftFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		LeftFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LeftFrame.BackgroundTransparency = 1.000
		LeftFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LeftFrame.BorderSizePixel = 0
		LeftFrame.ClipsDescendants = false
		LeftFrame.Position = UDim2.new(0.25, 0, 0.5, 0)
		LeftFrame.Size = UDim2.new(0.5, 0, 0.980000019, 0)
		LeftFrame.ZIndex = 8
		LeftFrame.BottomImage = ""
		LeftFrame.ScrollBarThickness = 0
		LeftFrame.TopImage = ""

		UIListLayout.Parent = LeftFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		RightFrame.Name = "RightFrame"
		RightFrame.Parent = TabFrame
		RightFrame.Active = true
		RightFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		RightFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		RightFrame.BackgroundTransparency = 1.000
		RightFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		RightFrame.BorderSizePixel = 0
		RightFrame.ClipsDescendants = false
		RightFrame.Position = UDim2.new(0.75, 0, 0.5, 0)
		RightFrame.Size = UDim2.new(0.5, 0, 0.980000019, 0)
		RightFrame.ZIndex = 8
		RightFrame.BottomImage = ""
		RightFrame.ScrollBarThickness = 0
		RightFrame.TopImage = ""
		RightFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

		UIListLayout_2.Parent = RightFrame
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		local call = function(val)
			if val then
				TabFrame.Visible = true
				Tween:Create(TabButton,TweenInfo.new(0.1),{BackgroundTransparency = 0}):Play()
				Tween:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency = 0,Size = UDim2.fromScale(1.5,0.5)}):Play()
				Tween:Create(Icon,TweenInfo.new(0.3),{
					ImageTransparency = 0,
					Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
				}):Play()
			else
				TabFrame.Visible = false
				Tween:Create(TabButton,TweenInfo.new(0.1),{BackgroundTransparency = 0.95}):Play()
				Tween:Create(TextLabel,TweenInfo.new(0.3),{
					TextTransparency = 0.4,
					Size = UDim2.fromScale(1.5,0.45)
				}):Play()
				Tween:Create(Icon,TweenInfo.new(0.3),{
					ImageTransparency = 0.4,
					Size = UDim2.new(0.65, 0, 0.65, 0)
				}):Play()
			end
		end

		if not HyperWindow.Tabs[1] then
			task.spawn(call,true)
		else
			task.spawn(call,false)
		end

		table.insert(HyperWindow.Tabs,{
			TabFrame,
			call
		})

		Button.MouseButton1Click:Connect(function()
			for i,v in ipairs(HyperWindow.Tabs) do
				if v[1] == TabFrame then
					task.spawn(v[2],true)
				else
					task.spawn(v[2],false)
				end
			end
		end)

		function TabHyper:NewSection(SectionName:string,SectionIcon:string,Position:string)
			local Section_Hyper = {}

			SectionName = ToDefault(SectionName,'Section')
			SectionIcon = ToDefault(SectionIcon,'home')
			Position = (Position and (Position:lower():find('left') and LeftFrame) or RightFrame) or LeftFrame

			local Section = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local SectionTitle = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local Icon = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local TextLabel = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local Frame_2 = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UICorner_3 = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local UIStroke = Instance.new("UIStroke")

			Section.Name = "Section"
			Section.Parent = Position
			Section.BackgroundColor3 = NoHyper.Theme.SECTION
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Size = UDim2.new(NoHyper.SectionWidth, 0, 0, 33)
			Section.ZIndex = 5

			UICorner.Parent = Section

			SectionTitle.Name = "SectionTitle"
			SectionTitle.Parent = Section
			SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionTitle.BackgroundTransparency = 1.000
			SectionTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionTitle.BorderSizePixel = 0
			SectionTitle.ClipsDescendants = true
			SectionTitle.Size = UDim2.new(1, 0, 1, 0)
			SectionTitle.ZIndex = 7

			UIAspectRatioConstraint.Parent = SectionTitle
			UIAspectRatioConstraint.AspectRatio = 8.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			Icon.Name = "Icon"
			Icon.Parent = SectionTitle
			Icon.AnchorPoint = Vector2.new(0.5, 0.5)
			Icon.BackgroundColor3 = NoHyper.Theme.MAIN
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0.075000003, 0, 0.5, 0)
			Icon.Size = UDim2.new(0.649999976, 0, 0.649999976, 0)
			Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Icon.ZIndex = 8
			Icon.ImageColor3 = NoHyper.Theme.MAIN
			SetImage(SectionIcon,Icon)

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(214, 214, 214)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
			UIGradient.Rotation = 190
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.04), NumberSequenceKeypoint.new(1.00, 0.00)}
			UIGradient.Parent = Icon

			TextLabel.Parent = SectionTitle
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.935000002, 0, 0.5, 0)
			TextLabel.Size = UDim2.new(1.5664264, 0, 0.600000024, 0)
			TextLabel.ZIndex = 8
			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.Text = SectionName or "General"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextStrokeTransparency = 0.950
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			Frame.Parent = SectionTitle
			Frame.AnchorPoint = Vector2.new(0.5, 1)
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 0.750
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.5, 0, 1, 0)
			Frame.Size = UDim2.new(0.800000012, 0, 0.0250000004, 0)
			Frame.ZIndex = 9

			Frame_2.Parent = Frame
			Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame_2.BackgroundTransparency = 0.750
			Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BorderSizePixel = 0
			Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame_2.Size = UDim2.new(1, 0, 1.10000002, 0)
			Frame_2.ZIndex = 9

			UICorner_2.Parent = Frame_2

			UICorner_3.Parent = Frame

			UIListLayout.Parent = Section
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 3)

			UIStroke.Color = NoHyper.Theme.STROKE
			UIStroke.Parent = Section

			function Section_Hyper.update()
				local old = 1

				for i,v in ipairs(Section:GetChildren()) do
					if v:IsA('Frame') then
						old += (v.AbsoluteSize.Y or 27) + UIListLayout.Padding.Offset
					end
				end

				Tween:Create(Section,TweenInfo.new(0.1),{Size = UDim2.new(NoHyper.SectionWidth,0,0,old + 1)}):Play()
			end

			table.insert(NoHyper.AutoUpdate,Section_Hyper.update)

			function Section_Hyper.text(...)
				TextLabel.Text = tostring(...)
			end

			function Section_Hyper:AddButton(ButtonName,callback)
				local Button = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Button_2 = Instance.new("TextButton")
				local Frame = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TextLabel = Instance.new("TextLabel")

				--Properties:

				Button.Name = "Button"
				Button.Parent = Section
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 1, 0)
				Button.ZIndex = 7

				UIAspectRatioConstraint.Parent = Button
				UIAspectRatioConstraint.AspectRatio = 9.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Button_2.Name = "Button"
				Button_2.Parent = Button
				Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button_2.BackgroundTransparency = 1.000
				Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button_2.BorderSizePixel = 0
				Button_2.Size = UDim2.new(1, 0, 1, 0)
				Button_2.ZIndex = 12
				Button_2.Font = Enum.Font.SourceSans
				Button_2.Text = ""
				Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button_2.TextSize = 14.000
				Button_2.TextTransparency = 1.000

				Frame.Parent = Button
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = NoHyper.Theme.BACKGROUND
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				Frame.Size = UDim2.new(0.899999976, 0, 1, 0)
				Frame.ZIndex = 10

				Button_2.MouseEnter:Connect(function()
					Tween:Create(Frame,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.TOUCH}):Play()
				end)

				Button_2.MouseButton1Down:Connect(function()
					Tween:Create(Frame,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.SYSTEM}):Play()
				end)

				Button_2.MouseButton1Up:Connect(function()
					Tween:Create(Frame,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()
				end)

				Button_2.MouseLeave:Connect(function()
					Tween:Create(Frame,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()
				end)

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Frame

				TextLabel.Parent = Frame
				TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextLabel.Size = UDim2.new(0.899999976, 0, 0.5, 0)
				TextLabel.ZIndex = 10
				TextLabel.Font = Enum.Font.GothamMedium
				TextLabel.Text = ButtonName
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextScaled = true
				TextLabel.TextSize = 14.000
				TextLabel.TextWrapped = true

				Button_2.MouseButton1Click:Connect(callback or function()

				end)

				Section_Hyper.update()

				return Signal({
					{
						name = 'Text',
						callback = function(...)
							TextLabel.Text = tostring(...)
						end,
					},
					{
						name = 'Fire',
						callback = callback,
					}
				})
			end

			function Section_Hyper:AddToggle(ToggleName:string,Default:boolean,callback:FunctionalTest)
				Default = Default or false
				callback = ToDefault(callback,function()

				end)

				local Toggle = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Text = Instance.new("TextLabel")
				local Ui = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local True = Instance.new("ImageLabel")
				local Button = Instance.new("TextButton")

				--Properties:

				Toggle.Name = "Toggle"
				Toggle.Parent = Section
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.ClipsDescendants = true
				Toggle.Size = UDim2.new(1, 0, 1, 0)
				Toggle.ZIndex = 7

				UIAspectRatioConstraint.Parent = Toggle
				UIAspectRatioConstraint.AspectRatio = 9.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Text.Name = "Text"
				Text.Parent = Toggle
				Text.AnchorPoint = Vector2.new(0, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Position = UDim2.new(0.0516665913, 0, 0.499999881, 0)
				Text.Size = UDim2.new(0.998333275, 0, 0.444999993, 0)
				Text.ZIndex = 7
				Text.Font = Enum.Font.GothamMedium
				Text.Text = ToggleName or "TOGGLE"
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextScaled = true
				Text.TextSize = 14.000
				Text.TextStrokeTransparency = 0.800
				Text.TextTransparency = 0.100
				Text.TextWrapped = true
				Text.TextXAlignment = Enum.TextXAlignment.Left

				Ui.Name = "Ui"
				Ui.Parent = Toggle
				Ui.AnchorPoint = Vector2.new(1, 0.5)
				Ui.BackgroundColor3 = NoHyper.Theme.BACKGROUND
				Ui.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Ui.BorderSizePixel = 0
				Ui.Position = UDim2.new(0.950000107, 0, 0.500000417, 0)
				Ui.Size = UDim2.new(0.649999976, 0, 0.649999976, 0)
				Ui.SizeConstraint = Enum.SizeConstraint.RelativeYY
				Ui.ZIndex = 7

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Ui

				True.Name = "True"
				True.Parent = Ui
				True.AnchorPoint = Vector2.new(0.5, 0.5)
				True.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				True.BackgroundTransparency = 1.000
				True.BorderColor3 = Color3.fromRGB(0, 0, 0)
				True.BorderSizePixel = 0
				True.Position = UDim2.new(0.5, 0, 0.5, 0)
				True.Size = UDim2.new(0.75, 0, 0.75, 0)
				True.Visible = false
				True.ZIndex = 8
				True.Image = "rbxassetid://3944680095"

				Button.Name = "Button"
				Button.Parent = Toggle
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 1, 0)
				Button.ZIndex = 9
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.TextTransparency = 1.000

				Button.MouseEnter:Connect(function()
					if Default then
						return
					end

					Tween:Create(Ui,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.TOUCH}):Play()
				end)

				Button.MouseLeave:Connect(function()
					if Default then
						return
					end

					Tween:Create(Ui,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()
				end)

				local function Effect(vcal)
					if vcal then
						Tween:Create(Ui,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.SYSTEM}):Play()
						True.Visible = true
					else
						True.Visible = false
						Tween:Create(Ui,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()
					end
				end

				Effect(Default)

				Button.MouseButton1Click:Connect(function()
					Default = not Default
					Effect(Default)
					callback(Default)
				end)

				Section_Hyper.update()

				return Signal({
					{
						name = 'Text',
						callback = function(...)
							TextLabel.Text = tostring(...)
						end,
					},
					{
						name = 'Fire',
						callback = callback,
					},
					{
						name = 'Value',
						callback = function(v)
							Default = v
							Effect(v)
							callback(v)
						end,
					}
				})
			end

			function Section_Hyper:AddKeybind(KeybindName:string,Default:Enum.KeyCode,callback)
				callback = ToDefault(callback,function() end)

				if typeof(Default) == 'string' then
					pcall(function()
						if Enum.KeyCode[tostring(Default)] then
							Default = Enum.KeyCode[tostring(Default)]
						end
					end)
				end

				local function toname(v:Enum.KeyCode)
					if v then
						return v.Name
					end

					return 'None'
				end
				local Keybind = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Text = Instance.new("TextLabel")
				local Bind = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local BindKey = Instance.new("TextLabel")
				local Button = Instance.new("TextButton")

				--Properties:

				Keybind.Name = "Keybind"
				Keybind.Parent = Section
				Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.BackgroundTransparency = 1.000
				Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Keybind.BorderSizePixel = 0
				Keybind.ClipsDescendants = true
				Keybind.Size = UDim2.new(1, 0, 1, 0)
				Keybind.ZIndex = 7

				UIAspectRatioConstraint.Parent = Keybind
				UIAspectRatioConstraint.AspectRatio = 9.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Text.Name = "Text"
				Text.Parent = Keybind
				Text.AnchorPoint = Vector2.new(0, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Position = UDim2.new(0.0516665913, 0, 0.499999881, 0)
				Text.Size = UDim2.new(0.998333275, 0, 0.444999993, 0)
				Text.ZIndex = 7
				Text.Font = Enum.Font.GothamMedium
				Text.Text = KeybindName or "KEYBIND"
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextScaled = true
				Text.TextSize = 14.000
				Text.TextStrokeTransparency = 0.800
				Text.TextTransparency = 0.100
				Text.TextWrapped = true
				Text.TextXAlignment = Enum.TextXAlignment.Left

				Bind.Name = "Bind"
				Bind.Parent = Keybind
				Bind.AnchorPoint = Vector2.new(1, 0.5)
				Bind.BackgroundColor3 = NoHyper.Theme.BACKGROUND
				Bind.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Bind.BorderSizePixel = 0
				Bind.Position = UDim2.new(0.950000226, 0, 0.500000417, 0)
				Bind.Size = UDim2.new(0.177682102, 0, 0.649999976, 0)
				Bind.ZIndex = 7

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Bind

				BindKey.Name = "BindKey"
				BindKey.Parent = Bind
				BindKey.AnchorPoint = Vector2.new(0, 0.5)
				BindKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BindKey.BackgroundTransparency = 1.000
				BindKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BindKey.BorderSizePixel = 0
				BindKey.Position = UDim2.new(0, 0, 0.5, 0)
				BindKey.Size = UDim2.new(1, 0, 0.649999976, 0)
				BindKey.ZIndex = 7
				BindKey.Font = Enum.Font.GothamMedium
				BindKey.Text = toname(Default)
				BindKey.TextColor3 = Color3.fromRGB(255, 255, 255)
				BindKey.TextScaled = true
				BindKey.TextSize = 14.000
				BindKey.TextWrapped = true

				Button.Name = "Button"
				Button.Parent = Keybind
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 1, 0)
				Button.ZIndex = 9
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.TextTransparency = 1.000

				local BindConnect

				Button.MouseEnter:Connect(function()
					if BindConnect then
						return
					end
					Tween:Create(Bind,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.TOUCH}):Play()
				end)

				Button.MouseLeave:Connect(function()
					if BindConnect then
						return
					end
					Tween:Create(Bind,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()
				end)

				local function UpdateText()
					local t= BindKey.Text
					local siz = TextService:GetTextSize(t,BindKey.TextSize,BindKey.Font,Vector2.new(math.huge,math.huge))
					Tween:Create(Bind,TweenInfo.new(0.075),{Size = UDim2.new(0,siz.X,0.65,0)}):Play()
				end

				UpdateText()

				Button.MouseButton1Click:Connect(function()
					if BindConnect then
						return
					end

					BindKey.Text = '...'
					UpdateText()
					Tween:Create(Bind,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.SYSTEM}):Play()
					BindConnect = 'wait'
					BindConnect = UIS.InputBegan:Wait()

					if BindConnect.KeyCode ~= Enum.KeyCode.Unknown then
						BindKey.Text = toname(BindConnect.KeyCode)
						Default = BindConnect.KeyCode
						pcall(function()
							task.spawn(callback,BindConnect.KeyCode)
						end)
					else
						BindKey.Text = toname(Default)
						UpdateText()
					end

					Tween:Create(Bind,TweenInfo.new(0.075),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()


					UpdateText()
					BindConnect = nil
				end)

				return Signal({
					{
						name = 'Text',
						callback = function(...)
							TextLabel.Text = tostring(...)
						end,
					},
					{
						name = 'Fire',
						callback = callback,
					},
					{
						name = 'Value',
						callback = function(v)
							Default = v
							BindKey.Text = toname(v)
							UpdateText()
							callback(v)
						end,
					},
					{
						name = 'Get',
						callback = function(v)
							return Default
						end,
					},
				})
			end

			function Section_Hyper:AddSlider(SliderName,Value:{Min:number,Max:number,Default:number,ValueT:string},callback)
				Value = Value or {}
				Value.Min = Value.Min or 1
				Value.Max = Value.Max or 100
				Value.Default = Value.Default or Value.Min
				Value.ValueT = Value.ValueT or ''

				callback = ToDefault(callback,function()

				end)

				local Slider = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Text = Instance.new("TextLabel")
				local Ui = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local SLIDE = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Frame = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local UIStroke = Instance.new("UIStroke")
				local UIGradient = Instance.new("UIGradient")
				local UIGradient_2 = Instance.new("UIGradient")
				local ValueText = Instance.new("TextLabel")
				local UIGradient_3 = Instance.new("UIGradient")

				--Properties:

				Slider.Name = "Slider"
				Slider.Parent = Section
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.ClipsDescendants = true
				Slider.Size = UDim2.new(1, 0, 1, 0)
				Slider.ZIndex = 7

				UIAspectRatioConstraint.Parent = Slider
				UIAspectRatioConstraint.AspectRatio = 9.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Text.Name = "Text"
				Text.Parent = Slider
				Text.AnchorPoint = Vector2.new(0, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Position = UDim2.new(0.0516665913, 0, 0.499999881, 0)
				Text.Size = UDim2.new(0.998333275, 0, 0.444999993, 0)
				Text.ZIndex = 7
				Text.Font = Enum.Font.GothamMedium
				Text.Text = SliderName or "AIM BOT RANGE"
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextScaled = true
				Text.TextSize = 14.000
				Text.TextStrokeTransparency = 0.800
				Text.TextTransparency = 0.100
				Text.TextWrapped = true
				Text.TextXAlignment = Enum.TextXAlignment.Left

				Ui.Name = "Ui"
				Ui.Parent = Slider
				Ui.AnchorPoint = Vector2.new(1, 0.5)
				Ui.BackgroundColor3 = NoHyper.Theme.BACKGROUND
				Ui.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Ui.BorderSizePixel = 0
				Ui.Position = UDim2.new(0.949999869, 0, 0.500000417, 0)
				Ui.Size = UDim2.new(0.44600001, 0, 0.324999988, 0)
				Ui.ZIndex = 10
				Ui.Active = true

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Ui

				SLIDE.Name = "SLIDE"
				SLIDE.Parent = Ui
				SLIDE.BackgroundColor3 = NoHyper.Theme.MAIN
				SLIDE.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SLIDE.BorderSizePixel = 0
				SLIDE.Size = UDim2.new(0.462937713, 0, 1, 0)
				SLIDE.ZIndex = 11

				UICorner_2.CornerRadius = UDim.new(0, 4)
				UICorner_2.Parent = SLIDE

				Frame.Parent = SLIDE
				Frame.AnchorPoint = Vector2.new(1, 0)
				Frame.BackgroundColor3 = NoHyper.Theme.MAIN
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(1.075, 0, 0, 0)
				Frame.Size = UDim2.new(1, 0, 1, 0)
				Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
				Frame.ZIndex = 12

				UICorner_3.CornerRadius = UDim.new(0, 4)
				UICorner_3.Parent = Frame

				UIStroke.Thickness = 2.000
				UIStroke.Color = NoHyper.Theme.STROKE
				UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke.Parent = Frame

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(214, 214, 214)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient.Rotation = 190
				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.04), NumberSequenceKeypoint.new(1.00, 0.00)}
				UIGradient.Parent = UIStroke

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(214, 214, 214)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient_2.Rotation = 190
				UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.04), NumberSequenceKeypoint.new(1.00, 0.00)}
				UIGradient_2.Parent = SLIDE

				ValueText.Name = "ValueText"
				ValueText.Parent = Ui
				ValueText.AnchorPoint = Vector2.new(0, 1)
				ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.BackgroundTransparency = 1.000
				ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueText.BorderSizePixel = 0
				ValueText.Position = UDim2.new(0, 0, -0.150000006, 0)
				ValueText.Size = UDim2.new(1, 0, 1, 0)
				ValueText.ZIndex = 7
				ValueText.Font = Enum.Font.GothamMedium
				ValueText.Text = tostring(Value.Default)..' / '..tostring(Value.Max)..tostring(Value.ValueT)
				ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.TextScaled = true
				ValueText.TextSize = 14.000
				ValueText.TextStrokeTransparency = 0.800
				ValueText.TextTransparency = 0.500
				ValueText.TextWrapped = true

				UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(214, 214, 214)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient_3.Rotation = 190
				UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.04), NumberSequenceKeypoint.new(1.00, 0.00)}
				UIGradient_3.Parent = Ui

				local Touch = false

				local function update(Input)
					local SizeScale = math.clamp((((Input.Position.X) - Ui.AbsolutePosition.X) / Ui.AbsoluteSize.X), 0, 1)
					local Valuea = math.floor(((Value.Max - Value.Min) * SizeScale) + Value.Min)
					local Size = UDim2.fromScale(SizeScale, 1)
					ValueText.Text = tostring(Valuea)..' / '..tostring(Value.Max)..tostring(Value.ValueT)
					Tween:Create(SLIDE,TweenInfo.new(0.1),{Size = Size}):Play()
					Value.Default = Valuea
					callback(Valuea)
				end

				Ui.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						Touch = true
						update(Input)

					end
				end)

				Ui.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						Touch = false
					end
				end)

				UIS.InputChanged:Connect(function(Input)
					if Touch then
						if (Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch)  then
							update(Input)
						end
					end
				end)

				return Signal({
					{
						name = 'Text',
						callback = function(...)
							TextLabel.Text = tostring(...)
						end,
					},
					{
						name = 'Fire',
						callback = callback,
					},
					{
						name = 'Value',
						callback = function(v)
							Value.Default = v
							local Size = UDim2.fromScale((v / Value.Max), 1)
							ValueText.Text = tostring(v)..' / '..tostring(Value.Max)..tostring(Value.ValueT)
							Tween:Create(SLIDE,TweenInfo.new(0.1),{Size = Size}):Play()
							callback(v)
						end,
					},
					{
						name = 'Get',
						callback = function(v)
							return Value.Default
						end,
					},
				})
			end

			function Section_Hyper:AddDropdown(DropdownName:string,DropdownInfo:{any},DropdownDefault:any,callback)
				DropdownInfo = DropdownInfo or {}
				DropdownDefault = DropdownDefault or DropdownInfo[1]

				local Dropdown = Instance.new("Frame")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local Text = Instance.new("TextLabel")
				local Ui = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local ValueText = Instance.new("TextLabel")
				local ValueIcon = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Iconcc = Instance.new("ImageLabel")
				local Button = Instance.new("TextButton")
				local Drop = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local UIStroke = Instance.new("UIStroke")
				local UIListLayout = Instance.new("UIListLayout")
				local DOPWN = 'rbxassetid://7733717447'
				local UP = 'rbxassetid://7072706796'

				--Properties:

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Section
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(1, 0, 1, 0)
				Dropdown.ZIndex = 7

				UIAspectRatioConstraint.Parent = Dropdown
				UIAspectRatioConstraint.AspectRatio = 9.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				Text.Name = "Text"
				Text.Parent = Dropdown
				Text.AnchorPoint = Vector2.new(0, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Position = UDim2.new(0.0516665727, 0, 0.499999762, 0)
				Text.Size = UDim2.new(0.948333681, 0, 0.445000023, 0)
				Text.ZIndex = 7
				Text.Font = Enum.Font.GothamMedium
				Text.Text = tostring(DropdownName or ' - ')
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextScaled = true
				Text.TextSize = 14.000
				Text.TextStrokeTransparency = 0.800
				Text.TextTransparency = 0.100
				Text.TextWrapped = true
				Text.TextXAlignment = Enum.TextXAlignment.Left

				Ui.Name = "Ui"
				Ui.Parent = Dropdown
				Ui.AnchorPoint = Vector2.new(1, 0.5)
				Ui.BackgroundColor3 = NoHyper.Theme.BACKGROUND
				Ui.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Ui.BorderSizePixel = 0
				Ui.ClipsDescendants = true
				Ui.Position = UDim2.new(0.950000226, 0, 0.450411677, 0)
				Ui.Size = UDim2.new(0.446000099, 0, 0.75, 0)
				Ui.ZIndex = 7

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Ui

				ValueText.Name = "ValueText"
				ValueText.Parent = Ui
				ValueText.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.BackgroundTransparency = 1.000
				ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueText.BorderSizePixel = 0
				ValueText.Position = UDim2.new(0.840817988, 0, 0.499999613, 0)
				ValueText.Size = UDim2.new(1.58200002, 0, 0.449999988, 0)
				ValueText.ZIndex = 8
				ValueText.Font = Enum.Font.Gotham
				ValueText.Text = tostring(DropdownDefault or 'None')
				ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueText.TextScaled = true
				ValueText.TextSize = 14.000
				ValueText.TextTransparency = 0.500
				ValueText.TextWrapped = true
				ValueText.TextXAlignment = Enum.TextXAlignment.Left

				ValueIcon.Name = "ValueIcon"
				ValueIcon.Parent = Ui
				ValueIcon.AnchorPoint = Vector2.new(1, 0.5)
				ValueIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueIcon.BackgroundTransparency = 1.000
				ValueIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ValueIcon.BorderSizePixel = 0
				ValueIcon.Position = UDim2.new(1, 0, 0.5, 0)
				ValueIcon.Size = UDim2.new(0.850000024, 0, 0.850000024, 0)
				ValueIcon.SizeConstraint = Enum.SizeConstraint.RelativeYY
				ValueIcon.ZIndex = 8

				UICorner_2.CornerRadius = UDim.new(0, 4)
				UICorner_2.Parent = ValueIcon

				Iconcc.Name = "Icon.cc"
				Iconcc.Parent = ValueIcon
				Iconcc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Iconcc.BackgroundTransparency = 1.000
				Iconcc.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Iconcc.BorderSizePixel = 0
				Iconcc.Size = UDim2.new(1, 0, 1, 0)
				Iconcc.ZIndex = 7
				Iconcc.Image = DOPWN

				Button.Name = "Button"
				Button.Parent = Dropdown
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 1, 0)
				Button.ZIndex = 12
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.TextTransparency = 1.000

				Drop.Name = "Drop"
				Drop.Parent = Dropdown
				Drop.AnchorPoint = Vector2.new(1, 0)
				Drop.BackgroundColor3 = NoHyper.Theme.BACKGROUND
				Drop.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Drop.BorderSizePixel = 0
				Drop.ClipsDescendants = true
				Drop.Position = UDim2.new(0.950000048, 0, 0.999999702, 0)
				Drop.Size = UDim2.new(0.446000069, 0, 0, 10)
				Drop.Visible = false
				Drop.ZIndex = 16
				Drop.Active = true

				UICorner_3.CornerRadius = UDim.new(0, 4)
				UICorner_3.Parent = Drop

				UIStroke.Color = NoHyper.Theme.STROKE
				UIStroke.Parent = Drop

				UIListLayout.Parent = Drop
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)

				local function valshopw()
					local old = 1

					for i,v in ipairs(Drop:GetChildren()) do
						if v:IsA('TextButton') then
							old += (v.AbsoluteSize.Y or 27) + UIListLayout.Padding.Offset
						end
					end

					return old + 1
				end

				Drop:GetPropertyChangedSignal('Size'):Connect(function()
					if Drop.Size.Y.Offset <= 15 then
						Drop.Visible = false
					else
						Drop.Visible = true
					end
				end)

				local function Toggle(vla)
					if vla then
						Iconcc.Image = UP
						Tween:Create(Drop,TweenInfo.new(0.15),{
							Size = UDim2.new(0.446000069, 0, 0, valshopw() + 6),
						}):Play()
						Tween:Create(Ui,TweenInfo.new(0.4),{BackgroundColor3 = NoHyper.Theme.TOUCH}):Play()
					else
						Iconcc.Image = DOPWN
						Tween:Create(Drop,TweenInfo.new(0.15),{
							Size = UDim2.new(0.446000069, 0, 0, 15),
						}):Play()

						Tween:Create(Ui,TweenInfo.new(0.4),{BackgroundColor3 = NoHyper.Theme.BACKGROUND}):Play()
					end
				end

				local function getbutton()

					local Button = Instance.new("TextButton")
					local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					local Frame = Instance.new("Frame")
					local UICorner = Instance.new("UICorner")
					local Frame_2 = Instance.new("Frame")

					Button.Name = "Button"
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000
					Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button.BorderSizePixel = 0
					Button.ClipsDescendants = true
					Button.Size = UDim2.new(0.850000024, 0, 0.5, 0)
					Button.ZIndex = 25
					Button.Font = Enum.Font.GothamMedium
					Button.TextColor3 = Color3.fromRGB(255, 255, 255)
					Button.TextScaled = true
					Button.TextSize = 14.000
					Button.TextTransparency = 0.100
					Button.TextWrapped = true
					Button.TextXAlignment = Enum.TextXAlignment.Left

					UIAspectRatioConstraint.Parent = Button
					UIAspectRatioConstraint.AspectRatio = 6.500
					UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

					Frame.Parent = Button
					Frame.AnchorPoint = Vector2.new(0.5, 0.5)
					Frame.BackgroundColor3 = NoHyper.Theme.SYSTEM
					Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Frame.BorderSizePixel = 0
					Frame.Position = UDim2.new(1, 0, 0.5, 0)
					Frame.Size = UDim2.new(0.100000001, 0, 0.800000012, 0)
					Frame.ZIndex = 20

					UICorner.CornerRadius = UDim.new(0, 2)
					UICorner.Parent = Frame

					return Button,Frame
				end

				local function Render()
					for i,v in ipairs(Drop:GetChildren()) do
						if v:IsA('TextButton') then
							v:Destroy()
						end
					end

					local lastui
					for i,v in pairs(DropdownInfo) do
						local ubtton,Toggle = getbutton()
						if v == DropdownDefault then
							Tween:Create(Toggle,TweenInfo.new(0.1),{BackgroundTransparency = 0,Size = UDim2.new(0.100000001, 0, 0.800000012, 0)}):Play()
							lastui = Toggle
						else
							Tween:Create(Toggle,TweenInfo.new(0.1),{BackgroundTransparency = 1,Size = UDim2.new(0, 0, 0.800000012, 0)}):Play()

						end
						ubtton.Parent = Drop
						ubtton.Text = tostring(v)
						ubtton.MouseButton1Click:Connect(function()
							if lastui then
								Tween:Create(lastui,TweenInfo.new(0.1),{BackgroundTransparency = 1,Size = UDim2.new(0, 0, 0.800000012, 0)}):Play()

							end

							Tween:Create(Toggle,TweenInfo.new(0.1),{BackgroundTransparency = 0,Size = UDim2.new(0.100000001, 0, 0.800000012, 0)}):Play()

							lastui = Toggle
							DropdownDefault = v
							ValueText.Text = tostring(DropdownDefault or 'None')
							callback(v)
						end)

						ubtton.MouseEnter:Connect(function()
							Tween:Create(ubtton,TweenInfo.new(0.1),{TextColor3 = NoHyper.Theme.TOUCH}):Play()
						end)

						ubtton.MouseLeave:Connect(function()
							Tween:Create(ubtton,TweenInfo.new(0.1),{TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
						end)
					end
				end

				local valnow = false

				Render()

				Button.MouseButton1Click:Connect(function()
					valnow = not valnow
					Toggle(valnow)
				end)

				return Signal({
					{
						name = 'Text',
						callback = function(...)
							TextLabel.Text = tostring(...)
						end,
					},
					{
						name = 'Fire',
						callback = callback,
					},
					{
						name = 'Value',
						callback = function(v)
							DropdownDefault = v
							ValueText.Text = tostring(DropdownDefault or 'None')
							callback(v)
						end,
					},
					{
						name = 'Get',
						callback = function(v)
							return DropdownDefault
						end,
					},
					{
						name = 'Refresh',
						callback = function(value)
							DropdownInfo = value
							Render()
						end,
					},
				})
			end

			Section.ChildAdded:Connect(Section_Hyper.update)

			Section_Hyper.update()

			return Section_Hyper
		end

		return TabHyper
	end

	function HyperWindow:NewSize(v)
		HyperWindow.Size = v
		MainFrame.Size = v
	end

	function HyperWindow:AddYoutube(Link:string)
		if Link:find('https://') then
			YoutubeButton.Visible = true
			YoutubeButton.MouseButton1Click:Connect(function()
				(setclipboard or toclipboard or function(...)
					print('Copy:',...)
				end)(Link)
			end)
		end
	end

	function HyperWindow:AddWebsite(Link:string)
		if Link:find('https://') then
			WebsiteButton.Visible = true
			WebsiteButton.MouseButton1Click:Connect(function()
				(setclipboard or toclipboard or function(...)
					print('Copy:',...)
				end)(Link)
			end)
		end
	end

	function HyperWindow:AddDiscord(Link:string)
		if Link:find('https://') or Link:find('discord.gg/') then
			DiscordButton.Visible = true
			DiscordButton.MouseButton1Click:Connect(function()
				(setclipboard or toclipboard or function(...)
					print('Copy:',...)
				end)(Link)
			end)
		end
	end

	for i,v in ipairs({DiscordButton,WebsiteButton,YoutubeButton}) do
		v.MouseEnter:Connect(function()
			Tween:Create(v,TweenInfo.new(0.2,Enum.EasingStyle.Back),{
				Size = UDim2.fromScale(1.1,1.1)
			}):Play()
		end)

		v.MouseLeave:Connect(function()
			Tween:Create(v,TweenInfo.new(0.2,Enum.EasingStyle.Back),{
				Size = UDim2.fromScale(0.9,0.9)
			}):Play()
		end)
	end

	local lastposition = MainFrame.Position
	local function UIToggle(val)
		local tim = 0.75
		local item = 0.6

		if val then
			Tween:Create(MainFrame,TweenInfo.new(tim),{
				Size = HyperWindow.Size,
				Position = UDim2.fromScale(0.5,0.5)
			}):Play()

			Tween:Create(CloseButton,TweenInfo.new(tim),{
				ImageTransparency = 0.1
			}):Play()

			Tween:Create(Top,TweenInfo.new(tim),{
				Size = UDim2.new(1.00000012, 0, 0.139001563, 0)
			}):Play()

			Tween:Create(Contact,TweenInfo.new(item),{
				Position = UDim2.new(0.125, 0, 0.934000015, 0)
			}):Play()

			Tween:Create(TabSystem,TweenInfo.new(item),{
				Position = UDim2.new(0.623372614, 0, 0.571928024, 0)
			}):Play()

			Tween:Create(TabButtonList,TweenInfo.new(item),{
				Position = UDim2.new(0.00999999139, 0, 0.132051408, 0)
			}):Play()

			Tween:Create(TickUI,TweenInfo.new(item),{
				Position = UDim2.new(0.25, 0, 0.5, 0)
			}):Play()

			Tween:Create(DescriptionText,TweenInfo.new(item * 1.6),{
				TextTransparency = 0.5,
				Size = UDim2.fromScale(0.707,0.187),
				Position = UDim2.new(0.27000013, 0, 0.749999702, 0)
			}):Play()

			Tween:Create(MainText,TweenInfo.new(item * 1.5),{
				TextTransparency = 0,
				Size = UDim2.fromScale(0.707,0.51),
				Position = UDim2.new(0.270000011, 0, 0.125, 0)
			}):Play()
		else
			Tween:Create(CloseButton,TweenInfo.new(tim),{
				ImageTransparency = 1
			}):Play()

			Tween:Create(MainFrame,TweenInfo.new(tim),{
				Size = UDim2.new(0.1,100,0.1,50),
				Position = lastposition,
			}):Play()

			Tween:Create(Top,TweenInfo.new(tim * 1.5),{
				Size = UDim2.fromScale(3.9,1)
			}):Play()

			Tween:Create(Contact,TweenInfo.new(item),{
				Position = UDim2.new(0.125,0,1,0)
			}):Play()

			Tween:Create(TabSystem,TweenInfo.new(item),{
				Position = UDim2.new(1.5, 0, 0.571928024, 0)
			}):Play()

			Tween:Create(TabButtonList,TweenInfo.new(item),{
				Position = UDim2.new(0.00999999139,0,1,0)
			}):Play()

			Tween:Create(TickUI,TweenInfo.new(item),{
				Position = UDim2.new(.25,0,1.5,0)
			}):Play()

			Tween:Create(DescriptionText,TweenInfo.new(item / 1.5),{
				TextTransparency = 1,
				Size = UDim2.fromScale(0.1,0.1),
				Position = UDim2.new(0.170000011, 0, -0.5, 0)
			}):Play()

			Tween:Create(MainText,TweenInfo.new(item / 1.5),{
				TextTransparency = 1,
				Size = UDim2.fromScale(0.1,0.1),
				Position = UDim2.new(0.170000011, 0, -0.5, 0)
			}):Play()

		end
	end

	local Status = true
	local oldposcheck = MainFrame.Position
	local buton = cretate_button(Frame)

	buton.Visible = false

	UIS.InputBegan:Connect(function(cc)
		if cc.KeyCode == HyperWindow.Toggle then
			Status = not Status

			if Status then
				buton.Visible = false
			else
				buton.Visible = true
			end

			UIToggle(Status)
		end
	end)

	CloseButton.MouseButton1Click:Connect(function()
		Status = not Status

		if Status then
			buton.Visible = false
		else
			buton.Visible = true
		end

		UIToggle(Status)
	end)

	buton.MouseButton1Down:Connect(function(inp)
		oldposcheck = MainFrame.Position
	end)

	buton.MouseButton1Up:Connect(function(inp)
		if oldposcheck == MainFrame.Position and not Status then
			Status = not Status

			if Status then
				buton.Visible = false
			else
				buton.Visible = true
			end

			UIToggle(Status)
		end
	end)

	spawn(function()
		local dragToggle = nil
		local dragSpeed = 0.2
		local dragStart = nil
		local startPos = nil

		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(MainFrame, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end

		buton.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and buton.Visible then 
				dragToggle = true
				dragStart = input.Position
				startPos = MainFrame.Position
				lastposition = MainFrame.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch and buton.Visible then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
	end)

	local dragToggle = nil
	local dragSpeed = 0.13
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(MainFrame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	Top.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = MainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

	return HyperWindow
end

function NoHyper:LoopUpdate()
	task.spawn(function()
		while true do task.wait()
			pcall(function()
				for i,v in ipairs(NoHyper.AutoUpdate) do task.wait()
					pcall(v)
				end
			end)
		end
	end)
end
return NoHyper;
