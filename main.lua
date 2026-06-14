-- Dandy's World Admin Panel
-- loadstring(game:HttpGet("YOUR_RAW_URL"))()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DandysAdminPanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(70, 70, 80)
MainStroke.Thickness = 1.5

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 38)
TitleBar.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🌸  Dandy's World — Admin Panel"
TitleLabel.TextColor3 = Color3.fromRGB(230, 220, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tab Bar
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -16, 0, 34)
TabBar.Position = UDim2.new(0, 8, 0, 44)
TabBar.BackgroundTransparency = 1
TabBar.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 6)

-- Machines Tab Button
local MachinesTab = Instance.new("TextButton")
MachinesTab.Size = UDim2.new(0, 120, 1, 0)
MachinesTab.BackgroundColor3 = Color3.fromRGB(120, 200, 100)
MachinesTab.Text = "⚙  Machines"
MachinesTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MachinesTab.TextSize = 12
MachinesTab.Font = Enum.Font.GothamBold
MachinesTab.BorderSizePixel = 0
MachinesTab.Parent = TabBar
Instance.new("UICorner", MachinesTab).CornerRadius = UDim.new(0, 8)

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -16, 1, -90)
ContentArea.Position = UDim2.new(0, 8, 0, 84)
ContentArea.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 10)

-- Machines Page (empty, ready for your content)
local MachinesPage = Instance.new("ScrollingFrame")
MachinesPage.Name = "MachinesPage"
MachinesPage.Size = UDim2.new(1, 0, 1, 0)
MachinesPage.BackgroundTransparency = 1
MachinesPage.BorderSizePixel = 0
MachinesPage.ScrollBarThickness = 4
MachinesPage.ScrollBarImageColor3 = Color3.fromRGB(100, 80, 160)
MachinesPage.Parent = ContentArea

local PageLayout = Instance.new("UIListLayout", MachinesPage)
PageLayout.Padding = UDim.new(0, 8)

local PagePadding = Instance.new("UIPadding", MachinesPage)
PagePadding.PaddingTop = UDim.new(0, 10)
PagePadding.PaddingLeft = UDim.new(0, 10)
PagePadding.PaddingRight = UDim.new(0, 10)

PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    MachinesPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
end)

-- Dragging
local dragging, dragStart, startPos = false, nil, nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
