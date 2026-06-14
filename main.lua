-- Dandy's World Admin Panel
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/n0rm0/IlikeCookedBacon/main/main.lua"))()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ILikeCookedBacon"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- =====================
--   TOGGLE BUTTON
-- =====================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 44, 0, 44)
ToggleBtn.Position = UDim2.new(0, 16, 0.5, -22)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
ToggleBtn.Text = "🌸"
ToggleBtn.TextSize = 22
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.BorderSizePixel = 0
ToggleBtn.ZIndex = 10
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner", ToggleBtn)
ToggleCorner.CornerRadius = UDim.new(0, 12)

local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
ToggleStroke.Color = Color3.fromRGB(130, 90, 200)
ToggleStroke.Thickness = 1.5

-- Pulse animation on toggle button
local togglePulse = true
task.spawn(function()
    while togglePulse do
        TweenService:Create(ToggleStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
            Thickness = 3
        }):Play()
        task.wait(2)
    end
end)

-- =====================
--   SHADOW
-- =====================
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 8)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)

-- =====================
--   MAIN FRAME
-- =====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 21, 34)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(100, 70, 160)
MainStroke.Thickness = 1.5

Shadow.Parent = MainFrame

-- =====================
--   GRADIENT ACCENT TOP
-- =====================
local Accent = Instance.new("Frame")
Accent.Size = UDim2.new(1, 0, 0, 3)
Accent.Position = UDim2.new(0, 0, 0, 0)
Accent.BackgroundColor3 = Color3.fromRGB(140, 90, 220)
Accent.BorderSizePixel = 0
Accent.ZIndex = 5
Accent.Parent = MainFrame

local AccentGrad = Instance.new("UIGradient", Accent)
AccentGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 100, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 140, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 220, 180)),
})

-- Animate gradient
task.spawn(function()
    local t = 0
    while MainFrame.Parent do
        t += 0.01
        AccentGrad.Offset = Vector2.new(math.sin(t), 0)
        task.wait(0.03)
    end
end)

-- =====================
--   TITLE BAR
-- =====================
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 38)
TitleBar.Position = UDim2.new(0, 0, 0, 3)
TitleBar.BackgroundColor3 = Color3.fromRGB(18, 16, 26)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 2
TitleBar.Parent = MainFrame

Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(18, 16, 26)
TitleFix.BorderSizePixel = 0
TitleFix.ZIndex = 2
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -100, 1, 0)
TitleLabel.Position = UDim2.new(0, 14, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🌸  Dandy's World"
TitleLabel.TextColor3 = Color3.fromRGB(220, 210, 255)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 2
TitleLabel.Parent = TitleBar

-- Version label
local VersionLabel = Instance.new("TextLabel")
VersionLabel.Size = UDim2.new(0, 60, 1, 0)
VersionLabel.Position = UDim2.new(0, 150, 0, 0)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v1.0"
VersionLabel.TextColor3 = Color3.fromRGB(100, 85, 140)
VersionLabel.TextSize = 11
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.ZIndex = 2
VersionLabel.Parent = TitleBar

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 26, 0, 26)
MinBtn.Position = UDim2.new(1, -64, 0, 6)
MinBtn.BackgroundColor3 = Color3.fromRGB(200, 160, 30)
MinBtn.Text = "–"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 18
MinBtn.Font = Enum.Font.GothamBold
MinBtn.BorderSizePixel = 0
MinBtn.ZIndex = 3
MinBtn.Parent = TitleBar
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -34, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(210, 55, 55)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.ZIndex = 3
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

-- Button hover effects
for _, btn in ipairs({MinBtn, CloseBtn}) do
    local origColor = btn.BackgroundColor3
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            Size = UDim2.new(0, 28, 0, 28),
            Position = btn == MinBtn and UDim2.new(1, -65, 0, 5) or UDim2.new(1, -35, 0, 5)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {
            Size = UDim2.new(0, 26, 0, 26),
            Position = btn == MinBtn and UDim2.new(1, -64, 0, 6) or UDim2.new(1, -34, 0, 6)
        }):Play()
    end)
end

-- =====================
--   TAB BAR
-- =====================
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -16, 0, 30)
TabBar.Position = UDim2.new(0, 8, 0, 46)
TabBar.BackgroundTransparency = 1
TabBar.ZIndex = 2
TabBar.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 5)

-- =====================
--   CONTENT AREA
-- =====================
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -16, 1, -86)
ContentArea.Position = UDim2.new(0, 8, 0, 82)
ContentArea.BackgroundColor3 = Color3.fromRGB(18, 16, 26)
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.ZIndex = 2
ContentArea.Parent = MainFrame
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 8)

local ContentStroke = Instance.new("UIStroke", ContentArea)
ContentStroke.Color = Color3.fromRGB(60, 50, 90)
ContentStroke.Thickness = 1

-- =====================
--   TABS
-- =====================
local tabs = {
    { name = "Machines", color = Color3.fromRGB(110, 195, 95), icon = "⚙" },
}

local tabButtons = {}
local pages = {}

local function makePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(120, 90, 180)
    page.Visible = false
    page.ZIndex = 3
    page.Parent = ContentArea

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 6)

    local pad = Instance.new("UIPadding", page)
    pad.PaddingTop = UDim.new(0, 8)
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)

    return page
end

for _, t in ipairs(tabs) do
    pages[t.name] = makePage(t.name)
end

local function switchTab(name)
    for _, t in ipairs(tabs) do
        local btn = tabButtons[t.name]
        local active = t.name == name
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundColor3 = active and t.color or Color3.fromRGB(32, 28, 46),
            TextColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(130, 120, 160),
            Size = active and UDim2.new(0, 116, 1, 0) or UDim2.new(0, 110, 1, 0),
        }):Play()
        pages[t.name].Visible = active
    end
end

for _, t in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 110, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(32, 28, 46)
    btn.Text = t.icon .. "  " .. t.name
    btn.TextColor3 = Color3.fromRGB(130, 120, 160)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.ZIndex = 3
    btn.Parent = TabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
    tabButtons[t.name] = btn

    btn.MouseButton1Click:Connect(function() switchTab(t.name) end)

    btn.MouseEnter:Connect(function()
        if pages[t.name].Visible then return end
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(44, 38, 64)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if pages[t.name].Visible then return end
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(32, 28, 46)}):Play()
    end)
end

switchTab("Machines")

-- =====================
--   MACHINES PAGE
--   Add your content below
-- =====================
local machinesPage = pages["Machines"]

local placeholder = Instance.new("TextLabel")
placeholder.Size = UDim2.new(1, 0, 0, 30)
placeholder.BackgroundTransparency = 1
placeholder.Text = "— Machines content goes here —"
placeholder.TextColor3 = Color3.fromRGB(90, 80, 120)
placeholder.TextSize = 12
placeholder.Font = Enum.Font.GothamBold
placeholder.TextXAlignment = Enum.TextXAlignment.Center
placeholder.ZIndex = 4
placeholder.Parent = machinesPage

-- =====================
--   OPEN/CLOSE ANIM
-- =====================
local guiOpen = false

local function openGUI()
    guiOpen = true
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 500, 0, 320),
        Position = UDim2.new(0.5, -250, 0.5, -160),
    }):Play()
end

local function closeGUI()
    guiOpen = false
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
    }):Play()
    task.delay(0.25, function() MainFrame.Visible = false end)
end

ToggleBtn.MouseButton1Click:Connect(function()
    if guiOpen then closeGUI() else openGUI() end
end)

-- =====================
--   MINIMIZE
-- =====================
local minimized = false

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local target = minimized and UDim2.new(0, 500, 0, 44) or UDim2.new(0, 500, 0, 320)
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = target}):Play()
end)

-- =====================
--   CLOSE
-- =====================
CloseBtn.MouseButton1Click:Connect(function()
    closeGUI()
    task.delay(0.3, function()
        togglePulse = false
        ScreenGui:Destroy()
    end)
end)

-- =====================
--   DRAG
-- =====================
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
