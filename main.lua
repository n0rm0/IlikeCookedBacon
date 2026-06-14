-- Dandy's World Admin Panel
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/n0rm0/IlikeCookedBacon/main/main.lua"))()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DandysAdminPanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- =====================
--   TOGGLE BUTTON
-- =====================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -20)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 36, 55)
ToggleBtn.Text = "🌸"
ToggleBtn.TextSize = 20
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.BorderSizePixel = 0
ToggleBtn.ZIndex = 10
ToggleBtn.Parent = ScreenGui

Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 10)

local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
ToggleStroke.Color = Color3.fromRGB(120, 90, 180)
ToggleStroke.Thickness = 1.5

-- =====================
--   MAIN FRAME
-- =====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(28, 25, 38)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(90, 70, 130)
MainStroke.Thickness = 1.5

-- =====================
--   TITLE BAR
-- =====================
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

-- fix bottom corners of titlebar
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -90, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🌸  Dandy's World"
TitleLabel.TextColor3 = Color3.fromRGB(220, 210, 255)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 26, 0, 26)
MinBtn.Position = UDim2.new(1, -62, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(180, 140, 30)
MinBtn.Text = "–"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 16
MinBtn.Font = Enum.Font.GothamBold
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TitleBar
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 55, 55)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

-- =====================
--   TAB BAR
-- =====================
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -16, 0, 30)
TabBar.Position = UDim2.new(0, 8, 0, 42)
TabBar.BackgroundTransparency = 1
TabBar.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 5)

-- =====================
--   CONTENT AREA
-- =====================
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -16, 1, -82)
ContentArea.Position = UDim2.new(0, 8, 0, 78)
ContentArea.BackgroundColor3 = Color3.fromRGB(20, 18, 28)
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 8)

-- =====================
--   TABS CONFIG
-- =====================
local tabs = {
    { name = "Machines", color = Color3.fromRGB(110, 190, 95) },
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

-- =====================
--   TAB SWITCHING
-- =====================
local function switchTab(name)
    for _, t in ipairs(tabs) do
        local btn = tabButtons[t.name]
        local active = t.name == name
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = active and t.color or Color3.fromRGB(38, 34, 52),
            TextColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 140, 175),
        }):Play()
        pages[t.name].Visible = active
    end
end

-- Create tab buttons
for _, t in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 110, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(38, 34, 52)
    btn.Text = t.name
    btn.TextColor3 = Color3.fromRGB(150, 140, 175)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = TabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
    tabButtons[t.name] = btn

    btn.MouseButton1Click:Connect(function()
        switchTab(t.name)
    end)

    btn.MouseEnter:Connect(function()
        if pages[t.name].Visible then return end
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(52, 46, 70)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if pages[t.name].Visible then return end
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(38, 34, 52)}):Play()
    end)
end

switchTab("Machines")

-- =====================
--   MACHINES PAGE
--   (add your content here)
-- =====================
local machinesPage = pages["Machines"]

-- Example placeholder label
local placeholder = Instance.new("TextLabel")
placeholder.Size = UDim2.new(1, 0, 0, 30)
placeholder.BackgroundTransparency = 1
placeholder.Text = "Machines content goes here..."
placeholder.TextColor3 = Color3.fromRGB(120, 110, 150)
placeholder.TextSize = 12
placeholder.Font = Enum.Font.Gotham
placeholder.TextXAlignment = Enum.TextXAlignment.Left
placeholder.Parent = machinesPage

-- =====================
--   TOGGLE OPEN/CLOSE
-- =====================
local guiOpen = true

ToggleBtn.MouseButton1Click:Connect(function()
    guiOpen = not guiOpen
    TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
        Size = guiOpen and UDim2.new(0, 500, 0, 320) or UDim2.new(0, 0, 0, 0),
    }):Play()
    MainFrame.Visible = true
    if not guiOpen then
        task.delay(0.2, function() MainFrame.Visible = false end)
    end
end)

-- =====================
--   MINIMIZE
-- =====================
local minimized = false

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local target = minimized and UDim2.new(0, 500, 0, 36) or UDim2.new(0, 500, 0, 320)
    TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = target}):Play()
end)

-- =====================
--   CLOSE
-- =====================
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
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
