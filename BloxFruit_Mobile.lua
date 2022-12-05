--hi--
local DINOHUB = Instance.new("ScreenGui")
local OPENCLOSE = Instance.new("TextButton")

DINOHUB.Name = "DINOHUB"
DINOHUB.Parent = game.CoreGui
DINOHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OPENCLOSE.Name = "OPENCLOSE"
OPENCLOSE.Parent = DINOHUB
OPENCLOSE.BackgroundColor3 = Color3.fromRGB(0,0,0)
OPENCLOSE.BorderSizePixel = 3
OPENCLOSE.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
OPENCLOSE.Size = UDim2.new(0,25,0,25)
OPENCLOSE.Font = Enum.Font.DenkOne
OPENCLOSE.Text = ''
OPENCLOSE.TextColor3 = Color3.fromRGB(255,255,255)
OPENCLOSE.TextScaled = true
OPENCLOSE.TextSize = 14.000
OPENCLOSE.TextWrapped = true
OPENCLOSE.MouseButton1Click:Connect(function()
    game.CoreGui:FindFirstChild("ZENHUB").Enabled = not game.CoreGui:FindFirstChild("ZENHUB").Enabled
end)
do
    if game:GetService("CoreGui"):FindFirstChild("ZENHUB") then
        game:GetService("CoreGui").ZENHUB:Destroy()
    end
end

repeat wait(1) until game:IsLoaded()

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
local Dragging = nil
local DragInput = nil
local DragStart = nil
local StartPosition = nil

local function Update(input)
local Delta = input.Position - DragStart
local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
 Position = pos
})
Tween:Play()
end

topbarobject.InputBegan:Connect(
 function(input)
 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
 Dragging = true
 DragStart = input.Position
 StartPosition = object.Position

 input.Changed:Connect(
  function()
  if input.UserInputState == Enum.UserInputState.End then
  Dragging = false
  end
  end
 )
 end
 end
)

topbarobject.InputChanged:Connect(
 function(input)
 if
  input.UserInputType == Enum.UserInputType.MouseMovement or
 input.UserInputType == Enum.UserInputType.Touch
 then
 DragInput = input
 end
 end
)

UserInputService.InputChanged:Connect(
 function(input)
 if input == DragInput and Dragging then
 Update(input)
 end
 end
)
end

local Update = {}

function Update:Window(text,logo,keybind)
local osfunc = {}
local uihide = false
local abc = false
local currentpage = ""
local keybind = keybind or Enum.KeyCode.RightControl
local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

local ZENHUB = Instance.new("ScreenGui")
ZENHUB.Name = "ZENHUB"
ZENHUB.Parent = game.CoreGui
ZENHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = ZENHUB
Main.ClipsDescendants = true
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Color3.fromRGB(45,45,45)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 0, 0, 0)

--Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
--Main:TweenSize(UDim2.new(0, 656, 0, 350),"Out","Quad",0.4,true)
Main:TweenSize(UDim2.new(0, 556, 0, 350),"Out","Quad",0.4,true)

local MCNR = Instance.new("UICorner")
MCNR.Name = "MCNR"
MCNR.Parent = Main

local Top = Instance.new("Frame")
Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
--Top.Size = UDim2.new(0, 656, 0, 27)
Top.Size = UDim2.new(0, 556, 0, 27)

local TCNR = Instance.new("UICorner")
TCNR.Name = "TCNR"
TCNR.Parent = Top

local Name = Instance.new("TextLabel")
Name.Parent = Top
Name.BackgroundColor3 = Color3.fromRGB(224,255,255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new( 0.0827338099, 0, 0, 0)
Name.Size = UDim2.new(0, 81, 0, 27)
Name.Font = Enum.Font.Cartoon
Name.Text = "CFrame Hub"
Name.TextColor3 = Color3.fromRGB(255,255,255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true


local ServerTime = Instance.new("TextLabel")
ServerTime.Name = "ServerTime"
ServerTime.Parent = Top
ServerTime.BackgroundColor3 = Color3.fromRGB(255,255,255)
ServerTime.BackgroundTransparency = 1.000
ServerTime.Position = UDim2.new(0.68, 0,0.074, 0)
ServerTime.Size = UDim2.new(0, 225, 0, 25)
ServerTime.Font = Enum.Font.GothamSemibold
ServerTime.Text = ""
ServerTime.TextSize = 11.000
ServerTime.TextColor3 = Color3.fromRGB(255,255,255)
ServerTime.TextXAlignment = Enum.TextXAlignment.Left

function osfunc:Set(textadd)
ServerTime.Text = textadd
end

local function UpdateOS()
local date = os.date("*t")
local hour = (date.hour) % 24
local ampm = hour < 12 and "AM" or "PM"
local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm)
local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local name = player.Name
local result, code = pcall(function()
 return LocalizationService:GetCountryRegionForPlayerAsync(player)
 end)
osfunc:Set(datetime.." - "..timezone.." [ " .. code .. " ]")
end
spawn(function()
 while true do
 UpdateOS()
 game:GetService("RunService").RenderStepped:Wait()
 end
 end)

local Tab = Instance.new("Frame")
Tab.Name = "Tab"
Tab.Parent = Main
Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Tab.Position = UDim2.new(0, 5, 0, 30)
--Tab.CornerRadius = UDim.new(0,5)
Tab.Size = UDim2.new(0, 0, 0, 0)
--Tab.Size = UDim2.new(0, 150, 0, 365)

--local TabCorner = Instance.new("UICorner")
local TabCorner = Instance.new("UIListLayout")
TabCorner.Name = "TabCorner"
TabCorner.Parent = Tab
TabCorner.SortOrder = Enum.SortOrder.LayoutOrder
TabCorner.Padding = UDim.new(0, 15)

local TCNR = Instance.new("UICorner")
TCNR.Name = "TCNR"
TCNR.Parent = Tab

local ScrollTab = Instance.new("ScrollingFrame")
ScrollTab.Name = "ScrollTab"
ScrollTab.Parent = Tab
ScrollTab.Active = true
ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollTab.BackgroundTransparency = 1.000
ScrollTab.Size = UDim2.new(0, 133, 0, 315)
ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollTab.ScrollBarThickness = 0

local PLL = Instance.new("UIListLayout")
PLL.Name = "PLL"
PLL.Parent = ScrollTab
PLL.SortOrder = Enum.SortOrder.LayoutOrder
PLL.Padding = UDim.new(0, 15)

local PPD = Instance.new("UIPadding")
PPD.Name = "PPD"
PPD.Parent = ScrollTab
PPD.PaddingLeft = UDim.new(0, 10)
PPD.PaddingTop = UDim.new(0, 10)

local Page = Instance.new("Frame")
Page.Name = "Page"
Page.Parent = Main
Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Page.Position = UDim2.new(0.255426834, 0, 0.086000003, 0)
Page.Size = UDim2.new(0, 410, 0, 316)

local PCNR = Instance.new("UICorner")
PCNR.Name = "PCNR"
PCNR.Parent = Page

local MainPage = Instance.new("Frame")
MainPage.Name = "MainPage"
MainPage.Parent = Page
MainPage.ClipsDescendants = true
MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainPage.BackgroundTransparency = 1.000
MainPage.Size = UDim2.new(0, 410, 0, 316)

local PageList = Instance.new("Folder")
PageList.Name = "PageList"
PageList.Parent = MainPage

local UIPageLayout = Instance.new("UIPageLayout")

UIPageLayout.Parent = PageList
UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
UIPageLayout.FillDirection = Enum.FillDirection.Vertical
UIPageLayout.Padding = UDim.new(0, 15)
UIPageLayout.TweenTime = 0.400
UIPageLayout.GamepadInputEnabled = false
UIPageLayout.ScrollWheelInputEnabled = false
UIPageLayout.TouchInputEnabled = false

MakeDraggable(Top,Main)

UserInputService.InputBegan:Connect(function(input)
 if input.KeyCode == Enum.KeyCode.RightControl then
 if uihide == false then
 uihide = true
 Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
 else
  uihide = false
 Main:TweenSize(UDim2.new(0, 556, 0, 350),"Out","Quad",0.5,true)
 end
 end
 end)
local uitab = {}

function uitab:Tab(text,img)
local TabButton = Instance.new("TextButton")
TabButton.Parent = ScrollTab
TabButton.Name = text.."Server"
TabButton.Text = text
TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabButton.BackgroundTransparency = 1.000
TabButton.Size = UDim2.new(0, 130, 0, 23)
TabButton.Font = Enum.Font.GothamSemibold
TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TabButton.TextSize = 11.000
TabButton.TextTransparency = 0.100

local TabFrame = Instance.new("Frame")
local UICornerFrame = Instance.new("UICorner")
TabFrame.Name = "TabFrame"
TabFrame.Parent = TabButton
TabFrame.ClipsDescendants = true
--TabFrame.Position = UDim2.new(0, 1, 0.1, 2)
TabFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
TabFrame.BackgroundTransparency = 0.500
TabFrame.Size = UDim2.new(0, 120, 0.1, 23)
UICornerFrame.CornerRadius = UDim.new(0, 5)
UICornerFrame.Parent = TabFrame

local MainFramePage = Instance.new("ScrollingFrame")
MainFramePage.Name = text.."_Page"
MainFramePage.Parent = PageList
MainFramePage.Active = true
MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFramePage.BackgroundTransparency = 1.000
MainFramePage.BorderSizePixel = 0
MainFramePage.Size = UDim2.new(0, 400, 0, 316)
MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
MainFramePage.ScrollBarThickness = 0

local UIPadding = Instance.new("UIPadding")
local UIListLayout = Instance.new("UIListLayout")

UIPadding.Parent = MainFramePage
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)

UIListLayout.Padding = UDim.new(0,15)
UIListLayout.Parent = MainFramePage
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TabButton.MouseButton1Click:Connect(function()
 for i,v in next, ScrollTab:GetChildren() do
 if v:IsA("TextButton") then
 TweenService:Create(
  v,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0.5
  }
 ):Play()
 end
 TweenService:Create(
  TabButton,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0
  }
 ):Play()
 end
 for i,v in next, PageList:GetChildren() do
 currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
 if v.Name == currentpage then
 UIPageLayout:JumpTo(v)
 end
 end
 end)

if abc == false then
for i,v in next, ScrollTab:GetChildren() do
if v:IsA("TextButton") then
TweenService:Create(
 v,
 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
 {
  TextTransparency = 0.5
 }
):Play()
end
TweenService:Create(
 TabButton,
 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
 {
  TextTransparency = 0
 }
):Play()
end
UIPageLayout:JumpToIndex(1)
abc = true
end

game:GetService("RunService").Stepped:Connect(function()
 pcall(function()
  MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
  ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
  end)
 end)
function Update:Notification(textdesc)
local NotificationHold = Instance.new("TextButton")
local NotificationFrame = Instance.new("Frame")
local OkayBtn = Instance.new("TextButton")
local OkayBtnCorner = Instance.new("UICorner")
local OkayBtnTitle = Instance.new("TextLabel")
local NotificationTitle = Instance.new("TextLabel")
local NotificationDesc = Instance.new("TextLabel")
local NotifCorner = Instance.new("UICorner")
local NotifHolderUIStroke = Instance.new("UIStroke")
local Line = Instance.new("Frame")

NotificationHold.Name = "NotificationHold"
NotificationHold.Parent = Main
NotificationHold.BackgroundColor3 = Color3.new(125,125,125)
NotificationHold.BackgroundTransparency = 1
NotificationHold.BorderSizePixel = 0
NotificationHold.Size = UDim2.new(0, 589, 0, 378)
NotificationHold.AutoButtonColor = false
NotificationHold.Font = Enum.Font.SourceSans
NotificationHold.Text = ""
NotificationHold.TextColor3 = Color3.new(125,0,125)
NotificationHold.TextSize = 13.000

TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
 BackgroundTransparency = 1
}):Play()
wait(0.4)

NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = NotificationHold
NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
NotificationFrame.BorderColor3 = Color3.new(125,0,125)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Transparency = 0
NotificationFrame.ClipsDescendants = true
NotificationFrame.Position = UDim2.new(0, 295, 0, 190)
NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

NotificationFrame:TweenSize(UDim2.new(0, 400, 0, 250), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

NotifCorner.Name = "NotifCorner"
NotifCorner.Parent = NotificationFrame
NotifCorner.CornerRadius = UDim.new(0, 5)

NotifHolderUIStroke.Name = "NotifHolderUIStroke"
NotifHolderUIStroke.Parent = NotificationFrame
NotifHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
NotifHolderUIStroke.Color = Color3.new(125,0,125)
NotifHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
NotifHolderUIStroke.Thickness = 2
NotifHolderUIStroke.Transparency = 0
NotifHolderUIStroke.Enabled = true
NotifHolderUIStroke.Archivable = true

OkayBtn.Name = "OkayBtn"
OkayBtn.Parent = NotificationFrame
OkayBtn.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
OkayBtn.BorderSizePixel = 2
OkayBtn.BorderColor3 = Color3.new(125,0,125)
OkayBtn.Position = UDim2.new(0, 125, 0, 190)
OkayBtn.Size = UDim2.new(0, 150, 0, 30)
OkayBtn.AutoButtonColor = true
OkayBtn.Font = Enum.Font.SourceSans
OkayBtn.Text = ""
OkayBtn.TextColor3 = Color3.new(125,0,125)
OkayBtn.TextSize = 13.000

OkayBtnCorner.CornerRadius = UDim.new(0, 5)
OkayBtnCorner.Name = "OkayBtnCorner"
OkayBtnCorner.Parent = OkayBtn

OkayBtnTitle.Name = "OkayBtnTitle"
OkayBtnTitle.Parent = OkayBtn
OkayBtnTitle.BackgroundColor3 = Color3.new(125,0,125)
OkayBtnTitle.BackgroundTransparency = 1.000
OkayBtnTitle.Size = UDim2.new(0, 150, 0, 30)
OkayBtnTitle.Text = "OK"
OkayBtnTitle.Font = Enum.Font.GothamSemibold
OkayBtnTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
OkayBtnTitle.TextSize = 22.000

NotificationTitle.Name = "NotificationTitle"
NotificationTitle.Parent = NotificationFrame
NotificationTitle.BackgroundColor3 = Color3.new(125,0,125)
NotificationTitle.BackgroundTransparency = 1.000
NotificationTitle.Position = UDim2.new(0, 0, 0, 10)
NotificationTitle.Size = UDim2.new(0, 400, 0, 25)
NotificationTitle.ZIndex = 3
NotificationTitle.Font = Enum.Font.GothamSemibold
NotificationTitle.Text = "Notification"
NotificationTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
NotificationTitle.TextSize = 22.000

Line.Name = "Line"
Line.Parent = NotificationFrame
Line.BackgroundColor3 = Color3.new(125,0,125)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 10, 0, 40)
Line.Size = UDim2.new(0, 380, 0, 1)

NotificationDesc.Name = "NotificationDesc"
NotificationDesc.Parent = NotificationFrame
NotificationDesc.BackgroundColor3 = _G.SectionColor
NotificationDesc.BackgroundTransparency = 1.000
NotificationDesc.Position = UDim2.new(0, 10, 0, 80)
NotificationDesc.Size = UDim2.new(0, 380, 0, 200)
NotificationDesc.Font = Enum.Font.GothamSemibold
NotificationDesc.Text = textdesc
NotificationDesc.TextScaled = false
NotificationDesc.TextColor3 = Color3.new(125,0,125)
NotificationDesc.TextSize = 16.000
NotificationDesc.TextWrapped = true
NotificationDesc.TextXAlignment = Enum.TextXAlignment.Center
NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

OkayBtn.MouseEnter:Connect(function()
 TweenService:Create(OkayBtn, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  BackgroundColor3 = Color3.fromRGB(34,34,34)}):Play()
 end)

OkayBtn.MouseLeave:Connect(function()
 TweenService:Create(OkayBtn, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
 end)

OkayBtn.MouseButton1Click:Connect(function()
 NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

 wait(0.4)

 TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  BackgroundTransparency = 1
 }):Play()

 wait(.3)

 NotificationHold:Destroy()
 end)
end

local main = {}
function main:Button(text,callback)
local Button = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Black = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")

Button.Name = "Button"
Button.Parent = MainFramePage
Button.BackgroundColor3 = Color3.new(125,125,125)
Button.Size = UDim2.new(0, 387, 0, 31)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Button

TextBtn.Name = "TextBtn"
TextBtn.Parent = Button
TextBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBtn.Position = UDim2.new(0, 1, 0, 1)
TextBtn.Size = UDim2.new(0, 385, 0, 29)
TextBtn.AutoButtonColor = false
TextBtn.Font = Enum.Font.GothamSemibold
TextBtn.Text = text
TextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBtn.TextSize = 15.000

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = TextBtn

Black.Name = "Black"
Black.Parent = Button
Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Black.BackgroundTransparency = 1.000
Black.BorderSizePixel = 0
Black.Position = UDim2.new(0, 1, 0, 1)
Black.Size = UDim2.new(0, 385, 0, 29)

UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = Black

TextBtn.MouseEnter:Connect(function()
 TweenService:Create(
  Black,
  TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   BackgroundTransparency = 0.7
  }
 ):Play()
 end)
TextBtn.MouseLeave:Connect(function()
 TweenService:Create(
  Black,
  TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   BackgroundTransparency = 1
  }
 ):Play()
 end)
TextBtn.MouseButton1Click:Connect(function()
 TextBtn.TextSize = 0
 TweenService:Create(
  TextBtn,
  TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextSize = 15
  }
 ):Play()
 callback()
 end)
end
function main:Toggle(TogInfo,default,callback)
local toggle = false
local CheckFrame = Instance.new("Frame")
local CheckFrame2 = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UIListLayout = Instance.new("UIListLayout")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local Space = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")

-- Prop --
CheckFrame.Name = TogInfo or "CheckFrame"
CheckFrame.Parent = MainFramePage
CheckFrame.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
CheckFrame.BackgroundTransparency = 1.000
CheckFrame.BorderSizePixel = 0
CheckFrame.Size = UDim2.new(0, 387, 0, 30)

CheckFrame2.Name = "CheckFrame2"
CheckFrame2.Parent = CheckFrame
CheckFrame2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CheckFrame2.BorderSizePixel = 0
CheckFrame2.Position = UDim2.new(0, 3, 0, 0)
CheckFrame2.Size = UDim2.new(0, 381, 0, 30)

UIStroke.Name = "UIStroke"
UIStroke.Parent = CheckFrame2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255,255,255)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Thickness = 1
UIStroke.Transparency = 0
UIStroke.Enabled = true
UIStroke.Archivable = true

UICorner.Parent = CheckFrame2
UICorner.CornerRadius = UDim.new(0, 3)

Title.Parent = CheckFrame2
Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 50, 0, 0)
Title.Size = UDim2.new(0, 280, 0, 30)
Title.Font = Enum.Font.GothamSemibold
Title.Text = TogInfo or "checkBox Title"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

ImageButton.Name = "ImageButton"
ImageButton.Parent = CheckFrame2
ImageButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(0, 325, 0, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 30)
ImageButton.ZIndex = 2
ImageButton.Image = "rbxassetid://3926311105"
ImageButton.ImageColor3 = Color3.fromRGB(255,255,255)
ImageButton.ImageRectOffset = Vector2.new(940, 784)
ImageButton.ImageRectSize = Vector2.new(48, 48)

if default == true then
	toggle = true
game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,225,225)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(4, 836)
else
toggle = false
game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,255,255)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(940, 784)
end
pcall(callback, toggle)

ImageButton.MouseButton1Click:Connect(function()
 if toggle == false then
 game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,225,225)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(4, 836)
 else
  game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,255,255)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(940, 784)
 end
 toggle = not toggle
 pcall(callback, toggle)
 end)
end

function main:Dropdown(text,option,callback)
local isdropping = false
local Dropdown = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local DropTitle = Instance.new("TextLabel")
local DropScroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local DropButton = Instance.new("TextButton")
local DropImage = Instance.new("ImageLabel")
local UIStroke = Instance.new("UIStroke")

Dropdown.Name = "Dropdown"
Dropdown.Parent = MainFramePage
Dropdown.BackgroundColor3 = Color3.fromRGB(45,45,45)
Dropdown.ClipsDescendants = true
Dropdown.Size = UDim2.new(0, 387, 0, 31)

UIStroke.Name = "UIStroke"
UIStroke.Parent = Dropdown
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255,255,255)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Thickness = 1
UIStroke.Transparency = 0
UIStroke.Enabled = true
UIStroke.Archivable = true

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Dropdown

DropTitle.Name = "DropTitle"
DropTitle.Parent = Dropdown
DropTitle.BackgroundColor3 = Color3.fromRGB(255,255,255)
DropTitle.BackgroundTransparency = 1.000
DropTitle.Size = UDim2.new(0, 385, 0, 31)
DropTitle.Font = Enum.Font.GothamSemibold
DropTitle.Text = text.. " : "
DropTitle.TextColor3 = Color3.fromRGB(255,255,255)
DropTitle.TextSize = 15.000

DropScroll.Name = "DropScroll"
DropScroll.Parent = DropTitle
DropScroll.Active = true
DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropScroll.BackgroundTransparency = 1.000
DropScroll.BorderSizePixel = 0
DropScroll.Position = UDim2.new(0, 0, 0, 31)
DropScroll.Size = UDim2.new(0, 385, 0, 100)
DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
DropScroll.ScrollBarThickness = 3

UIListLayout.Parent = DropScroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding.Parent = DropScroll
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

DropButton.Name = "DropButton"
DropButton.Parent = Dropdown
DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropButton.BackgroundTransparency = 1.000
DropButton.Size = UDim2.new(0, 385, 0, 31)
DropButton.Font = Enum.Font.SourceSans
DropButton.Text = ""
DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DropButton.TextSize = 14.000

for i,v in next,option do
local Item = Instance.new("TextButton")

Item.Name = "Item"
Item.Parent = DropScroll
Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Item.BackgroundTransparency = 1.000
Item.Size = UDim2.new(0, 385, 0, 26)
Item.Font = Enum.Font.GothamSemibold
Item.Text = tostring(v)
Item.TextColor3 = Color3.fromRGB(255,255,255)
Item.TextSize = 13.000
Item.TextTransparency = 0.500

Item.MouseEnter:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0
  }
 ):Play()
 end)

Item.MouseLeave:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0.5
  }
 ):Play()
 end)

Item.MouseButton1Click:Connect(function()
 isdropping = false
 Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 callback(Item.Text)
 DropTitle.Text = text.." : "..Item.Text
 end)
end

DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

DropButton.MouseButton1Click:Connect(function()
 if isdropping == false then
 isdropping = true
 Dropdown:TweenSize(UDim2.new(0,385,0,131),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 0
  }
 ):Play()
 else
  isdropping = false
 Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 end
 end)

local dropfunc = {}
function dropfunc:Add(t)
local Item = Instance.new("TextButton")
Item.Name = "Item"
Item.Parent = DropScroll
Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Item.BackgroundTransparency = 1.000
Item.Size = UDim2.new(0, 385, 0, 26)
Item.Font = Enum.Font.GothamSemibold
Item.Text = tostring(t)
Item.TextColor3 = Color3.fromRGB(255,255,255)
Item.TextSize = 13.000
Item.TextTransparency = 0.500

Item.MouseEnter:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0
  }
 ):Play()
 end)

Item.MouseLeave:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0.5
  }
 ):Play()
 end)

Item.MouseButton1Click:Connect(function()
 isdropping = false
 Dropdown:TweenSize(UDim2.new(0,387,0,31),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 callback(Item.Text)
 DropTitle.Text = text.." : "..Item.Text
 end)
end
function dropfunc:Clear()
DropTitle.Text = tostring(text).." : "
isdropping = false
Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
TweenService:Create(
 DropImage,
 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
 {
  Rotation = 180
 }
):Play()
for i,v in next, DropScroll:GetChildren() do
if v:IsA("TextButton") then
v:Destroy()
end
end
end
return dropfunc
end
function main:Slider(text,min,max,set,callback)
local Slider = Instance.new("Frame")
local slidercorner = Instance.new("UICorner")
local sliderr = Instance.new("Frame")
local sliderrcorner = Instance.new("UICorner")
local SliderLabel = Instance.new("TextLabel")
local HAHA = Instance.new("Frame")
local AHEHE = Instance.new("TextButton")
local bar = Instance.new("Frame")
local bar1 = Instance.new("Frame")
local bar1corner = Instance.new("UICorner")
local barcorner = Instance.new("UICorner")
local circlebar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local slidervalue = Instance.new("Frame")
local valuecorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local posto = Instance.new("UIStroke")

Slider.Name = "Slider"
Slider.Parent = MainFramePage
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 0
Slider.Size = UDim2.new(0, 387, 0, 51)

slidercorner.CornerRadius = UDim.new(0, 5)
slidercorner.Name = "slidercorner"
slidercorner.Parent = Slider

sliderr.Name = "sliderr"
sliderr.Parent = Slider
sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
sliderr.Position = UDim2.new(0, 1, 0, 1)
sliderr.Size = UDim2.new(0, 385, 0, 49)

sliderrcorner.CornerRadius = UDim.new(0, 5)
sliderrcorner.Name = "sliderrcorner"
sliderrcorner.Parent = sliderr

SliderLabel.Name = "SliderLabel"
SliderLabel.Parent = sliderr
SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderLabel.BackgroundTransparency = 1.000
SliderLabel.Position = UDim2.new(0, 15, 0, 0)
SliderLabel.Size = UDim2.new(0, 180, 0, 26)
SliderLabel.Font = Enum.Font.GothamSemibold
SliderLabel.Text = text
SliderLabel.TextColor3 = Color3.fromRGB(255,255,255)
SliderLabel.TextSize = 16.000
SliderLabel.TextTransparency = 0
SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

HAHA.Name = "HAHA"
HAHA.Parent = sliderr
HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HAHA.BackgroundTransparency = 1.000
HAHA.Size = UDim2.new(0, 350, 0, 29)

AHEHE.Name = "AHEHE"
AHEHE.Parent = sliderr
AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AHEHE.BackgroundTransparency = 1.000
AHEHE.Position = UDim2.new(0, 10, 0, 35)
AHEHE.Size = UDim2.new(0, 350, 0, 5)
AHEHE.Font = Enum.Font.SourceSans
AHEHE.Text = ""
AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
AHEHE.TextSize = 14.000

bar.Name = "bar"
bar.Parent = AHEHE
bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
bar.Size = UDim2.new(0, 360, 0, 5)

bar1.Name = "bar1"
bar1.Parent = bar
bar1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar1.BackgroundTransparency = 0
bar1.Size = UDim2.new(set/max, 0, 0, 5)

bar1corner.CornerRadius = UDim.new(0, 5)
bar1corner.Name = "bar1corner"
bar1corner.Parent = bar1

barcorner.CornerRadius = UDim.new(0, 5)
barcorner.Name = "barcorner"
barcorner.Parent = bar

circlebar.Name = "circlebar"
circlebar.Parent = bar1
circlebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
circlebar.Position = UDim2.new(1, -2, 0, -3)
circlebar.Size = UDim2.new(0, 10, 0, 10)

UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = circlebar

slidervalue.Name = "slidervalue"
slidervalue.Parent = sliderr
slidervalue.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
slidervalue.BackgroundTransparency = 1
slidervalue.Position = UDim2.new(0, 320, 0, 5)
slidervalue.Size = UDim2.new(0, 65, 0, 18)

valuecorner.CornerRadius = UDim.new(0, 5)
valuecorner.Name = "valuecorner"
valuecorner.Parent = slidervalue

TextBox.Parent = slidervalue
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.Size = UDim2.new(0, 60, 0, 20)
TextBox.Font = Enum.Font.GothamSemibold
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 9.000
TextBox.Text = set
TextBox.TextTransparency = 0

posto.Name = "posto"
posto.Parent = TextBox
posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
posto.Color = Color3.fromRGB(255,255,255)
posto.LineJoinMode = Enum.LineJoinMode.Round
posto.Thickness = 2
posto.Transparency = 0
posto.Enabled = true
posto.Archivable = true

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = TextBox

local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")

if Value == nil then
Value = set
pcall(function()
 callback(Value)
 end)
end

AHEHE.MouseButton1Down:Connect(function()
 Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
 pcall(function()
  callback(Value)
  end)
 bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
 circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
 moveconnection = mouse.Move:Connect(function()
  TextBox.Text = Value
  Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
  pcall(function()
   callback(Value)
   end)
  bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
  circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
  end)
 releaseconnection = uis.InputEnded:Connect(function(Mouse)
  if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
  Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
  pcall(function()
   callback(Value)
   end)
  bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
  circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
  moveconnection:Disconnect()
  releaseconnection:Disconnect()
  end
  end)
 end)
releaseconnection = uis.InputEnded:Connect(function(Mouse)
 if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
 Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
 TextBox.Text = Value
 end
 end)

TextBox.FocusLost:Connect(function()
 if tonumber(TextBox.Text) > max then
 TextBox.Text = max
 end
 bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
 circlebar.Position = UDim2.new(1, -2, 0, -3)
 TextBox.Text = tostring(TextBox.Text and math.floor((TextBox.Text / max) * (max - min) + min))
 pcall(callback, TextBox.Text)
 end)
end
function main:Textbox(text,disappear,callback)
local Textbox = Instance.new("Frame")
local TextboxCorner = Instance.new("UICorner")
local Textboxx = Instance.new("Frame")
local TextboxxCorner = Instance.new("UICorner")
local TextboxLabel = Instance.new("TextLabel")
local txtbtn = Instance.new("TextButton")
local RealTextbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")

Textbox.Name = "Textbox"
Textbox.Parent = MainFramePage
Textbox.BackgroundColor3 = Color3.new(125,125,125)
Textbox.BackgroundTransparency = 0
Textbox.Size = UDim2.new(0, 387, 0, 31)

TextboxCorner.CornerRadius = UDim.new(0, 5)
TextboxCorner.Name = "TextboxCorner"
TextboxCorner.Parent = Textbox

Textboxx.Name = "Textboxx"
Textboxx.Parent = Textbox
Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Textboxx.Position = UDim2.new(0, 1, 0, 1)
Textboxx.Size = UDim2.new(0, 385, 0, 29)

TextboxxCorner.CornerRadius = UDim.new(0, 5)
TextboxxCorner.Name = "TextboxxCorner"
TextboxxCorner.Parent = Textboxx

TextboxLabel.Name = "TextboxLabel"
TextboxLabel.Parent = Textbox
TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxLabel.BackgroundTransparency = 1.000
TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
TextboxLabel.Text = text
TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
TextboxLabel.Font = Enum.Font.GothamSemibold
TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
TextboxLabel.TextSize = 16.000
TextboxLabel.TextTransparency = 0
TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

txtbtn.Name = "txtbtn"
txtbtn.Parent = Textbox
txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txtbtn.BackgroundTransparency = 1.000
txtbtn.Position = UDim2.new(0, 1, 0, 1)
txtbtn.Size = UDim2.new(0, 387, 0, 29)
txtbtn.Font = Enum.Font.SourceSans
txtbtn.Text = ""
txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
txtbtn.TextSize = 14.000

RealTextbox.Name = "RealTextbox"
RealTextbox.Parent = Textbox
RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
RealTextbox.BackgroundTransparency = 0
RealTextbox.Position = UDim2.new(0, 275, 0, 4)
RealTextbox.Size = UDim2.new(0, 100, 0, 24)
RealTextbox.Font = Enum.Font.GothamSemibold
RealTextbox.Text = ""
RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
RealTextbox.TextSize = 11.000
RealTextbox.TextTransparency = 0

RealTextbox.FocusLost:Connect(function()
 callback(RealTextbox.Text)
 if disappear then
 RealTextbox.Text = ""
 end
 end)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = RealTextbox
end
function main:Label(text)
local Label = Instance.new("TextLabel")
local PaddingLabel = Instance.new("UIPadding")
local labelfunc = {}

Label.Name = "Label"
Label.Parent = MainFramePage
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0, 410, 0, 20)
Label.Font = Enum.Font.GothamSemibold
Label.TextColor3 = Color3.fromRGB(225, 225, 225)
Label.TextSize = 16.000
Label.Text = text
Label.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel.PaddingLeft = UDim.new(0,15)
PaddingLabel.Parent = Label
PaddingLabel.Name = "PaddingLabel"

function labelfunc:Set(newtext)
Label.Text = newtext
end
return labelfunc
end

function main:Label1(text)
local Label1 = Instance.new("TextLabel")
local PaddingLabel1 = Instance.new("UIPadding")
local Label1func = {}

Label1.Name = "Label1"
Label1.Parent = MainFramePage
Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label1.BackgroundTransparency = 1.000
Label1.Size = UDim2.new(0, 410, 0, 20)
Label1.Font = Enum.Font.GothamSemibold
Label1.TextColor3 = Color3.fromRGB(255,255,255)
Label1.TextSize = 15.000
Label1.Text = text
Label1.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel1.PaddingLeft = UDim.new(0,15)
PaddingLabel1.Parent = Label1
PaddingLabel1.Name = "PaddingLabel1"
function Label1func:Refresh(tochange)
Label1.Text = tochange
end

return Label1func
end

function main:Seperator(text)
local Seperator = Instance.new("Frame")
local Sep1 = Instance.new("Frame")
local Sep2 = Instance.new("TextLabel")
local Sep3 = Instance.new("Frame")

Seperator.Name = "Seperator"
Seperator.Parent = MainFramePage
Seperator.BackgroundColor3 = Color3.fromRGB(255,255,255)
Seperator.BackgroundTransparency = 1.000
Seperator.Size = UDim2.new(0, 310, 0, 20)

Sep1.Name = "Sep1"
Sep1.Parent = Seperator
Sep1.BackgroundColor3 = Color3.new(125, 125, 125)
Sep1.BorderSizePixel = 0
Sep1.Position = UDim2.new(0, 0, 0, 10)
Sep1.Size = UDim2.new(0, 80, 0, 1)

Sep2.Name = "Sep2"
Sep2.Parent = Seperator
Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sep2.BackgroundTransparency = 1.000
Sep2.Position = UDim2.new(0, 150, 0, 0)
Sep2.Size = UDim2.new(0, 100, 0, 20)
Sep2.Font = Enum.Font.GothamSemibold
Sep2.Text = text
Sep2.TextColor3 = Color3.fromRGB(255,255,255)
Sep2.TextSize = 14.000

Sep3.Name = "Sep3"
Sep3.Parent = Seperator
Sep3.BackgroundColor3 = Color3.new(125,125,125)
Sep3.BorderSizePixel = 0
Sep3.Position = UDim2.new(0, 310, 0, 10)
Sep3.Size = UDim2.new(0, 80, 0, 1)
end

function main:Line()
local Linee = Instance.new("Frame")
local Line = Instance.new("Frame")

Linee.Name = "Linee"
Linee.Parent = MainFramePage
Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Linee.BackgroundTransparency = 1.000
Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
Linee.Size = UDim2.new(0, 310, 0, 20)

Line.Name = "Line"
Line.Parent = Linee
Line.BackgroundColor3 = Color3.new(125,125,125)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0, 10)
Line.Size = UDim2.new(0, 410, 0, 1)
end
return main
end
return uitab
end

repeat wait()
	pcall(function()
		if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Visible == true then
				if _G.Team == "Pirate" then
					game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
					game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
					wait(.1)
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
				elseif _G.Team == "Marine" then
					game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
					game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
					wait(.1)
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
				else
					game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
					game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
					wait(.1)
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
				end
			end
		end
	end)
until game.Players.LocalPlayer.Neutral == false

spawn(function()
	pcall(function()
		game.ReplicatedStorage.Effect.Container.Death:Destroy()
		game.ReplicatedStorage.Effect.Container.Respawn:Destroy()
		game.ReplicatedStorage.Effect.Container.Hit:Destroy()
	end)
end)
function BTP(P)
	repeat wait(1)
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
	until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500
end

function TP(P1)
	local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	Speed = 100
	if Distance < 250 then		
		Speed = 5000
	elseif Distance < 500 then
		Speed = 650
	elseif Distance < 1000 then
		Speed = 350
	elseif Distance >= 1000 then
		Speed = 250
	end
	TWEEN = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1})
	TWEEN:Play()
end

function CheckQuest()
	local Id = game.PlaceId
	local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
	if Id == 2753915549 then
		if Level == 1 or Level <= 9 then
			Mon = "Bandit [Lv. 5]"
			MonPos = CFrame.new(1198.5999755859375, 38.06475830078125, 1543.47119140625)
			LQuest = 1
			NQuest = "BanditQuest1"
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
		elseif Level == 10 or Level <= 14 then
			Mon = "Monkey [Lv. 14]"
			MonPos = CFrame.new(-1403.5555419921875, 98.59825134277344, 90.24476623535156)
			LQuest = 1
			NQuest = "JungleQuest"
			NameMon = "Monkey"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 15 or Level <= 29 then
			Mon = "Gorilla [Lv. 20]"
			MonPos = CFrame.new(-1320.2811279296875, 81.85315704345703, -458.73248291015625)
			LQuest = 2
			NQuest = "JungleQuest"
			NameMon = "Gorilla"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 30 or Level <= 39 then
			Mon = "Pirate [Lv. 35]"
			MonPos = CFrame.new(-1140.37109375, 53.04805374145508, 3972.119384765625)
			LQuest = 1
			NQuest = "BuggyQuest1"
			NameMon = "Pirate"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 40 or Level <= 59 then
			Mon = "Brute [Lv. 45]"
			MonPos = CFrame.new(-1133.1185302734375, 94.3675537109375, 4307.36376953125)
			LQuest = 2
			NQuest = "BuggyQuest1"
			NameMon = "Brute"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 60 or Level <= 74 then
			Mon = "Desert Bandit [Lv. 60]"
			MonPos = CFrame.new(978.1805419921875, 21.926359176635742, 4407.97119140625)
			LQuest = 1
			NQuest = "DesertQuest"
			NameMon = "Desert Bandit"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
		elseif Level == 75 or Level <= 89 then
			Mon = "Desert Officer [Lv. 70]"
			MonPos = CFrame.new(1558.972900390625, 15.365246772766113, 4280.10302734375)
			LQuest = 2
			NQuest = "DesertQuest"
			NameMon = "Desert Officer"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
		elseif Level == 90 or Level <= 99 then
			Mon = "Snow Bandit [Lv. 90]"
			MonPos = CFrame.new(1352.8118896484375, 105.67132568359375, -1324.64697265625)
			LQuest = 1
			NQuest = "SnowQuest"
			NameMon = "Snow Bandit"
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
		elseif Level == 100 or Level <= 119 then
			Mon = "Snowman [Lv. 100]"
			MonsPos = CFrame.new(1201.8741455078125, 144.61459350585938, -1546.5943603515625)
			LQuest = 2
			NQuest = "SnowQuest"
			NameMon = "Snowman"
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
		elseif Level == 120 or Level <= 149 then
			Mon = "Chief Petty Officer [Lv. 120]"
			MonPos = CFrame.new(-4855.8466796875, 23.68708038330078, 4308.84814453125)
			LQuest = 1
			NQuest = "MarineQuest2"
			NameMon = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 150 or Level <= 174 then
			Mon = "Sky Bandit [Lv. 150]"
			MonPos = CFrame.new(-4951.14501953125, 295.77923583984375, -2899.656005859375)
			LQuest = 1
			NQuest = "SkyQuest"
			NameMon = "Sky Bandit"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 175 or Level <= 189 then
			Mon = "Dark Master [Lv. 175]"
			MonPos = CFrame.new(-5224.60107421875, 429.73699951171875, -2280.69677734375)
			LQuest = 2
			NQuest = "SkyQuest"
			NameMon = "Dark Master"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 190 or Level <= 209 then
			Mon = "Prisoner [Lv. 190]"
			MonsPos = CFrame.new(5285.59033203125, 88.68693542480469, 476.51483154296875)
			LQuest = 1
			NQuest = "PrisonerQuest"
			NameMon = "Prisoner"
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
		elseif Level == 210 or Level <= 249 then
			Mon = "Dangerous Prisoner [Lv. 210]"
			MonsPos = CFrame.new(5543.451171875, 88.6868896484375, 696.1821899414062)
			LQuest = 2
			NQuest = "PrisonerQuest"
			NameMon = "Dangerous Prisoner"
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
		elseif Level == 250 or Level <= 299 then
			Mon = "Toga Warrior [Lv. 250]"
			MonPos = CFrame.new(-1772.7384033203125, 38.839969635009766, -2745.384521484375)
			LQuest = 1
			NQuest = "ColosseumQuest"
			NameMon = "Toga Warrior"
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
				--[[elseif Level == 275 or Level <= 299 then
			Mon = "Gladiator [Lv. 275]"
			MonPos = CFrame.new(-1283.224853515625, 7.567874908447266, -3253.5498046875)
			LQuest = 2
			NQuest = "ColosseumQuest"
			NameMon = "Gladiator"
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
				]]
		elseif Level == 300 or Level <= 324 then
			Mon = "Military Soldier [Lv. 300]"
			MonPos = CFrame.new(-5410.20751953125, 11.10084342956543, 8456.4111328125)
			LQuest = 1
			NQuest = "MagmaQuest"
			NameMon = "Military Soldier"
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
		elseif Level == 325 or Level <= 374 then
			Mon = "Military Spy [Lv. 325]"
			MonPos = CFrame.new(-5800.2548828125, 98.19547271728516, 8781.802734375)
			LQuest = 2
			NQuest = "MagmaQuest"
			NameMon = "Military Spy"
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
		elseif Level == 375 or Level <= 399 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
			end
			Mon = "Fishman Warrior [Lv. 375]"
			MonPos = CFrame.new(60890.0859375, 95.70665740966797, 1546.843017578125)
			LQuest = 1
			NQuest = "FishmanQuest"
			NameMon = "Fishman Warrior"
			CFrameQuest = CFrame.new(61119.890625, 18.50667381286621, 1567.489990234375)
		elseif Level == 400 or Level <= 449 then
			Mon = "Fishman Commando [Lv. 400]"
			MonPos = CFrame.new(61872.09765625, 75.50736999511719, 1403.5740966796875)
			LQuest = 2
			NQuest = "FishmanQuest"
			NameMon = "Fishman Commando"
			CFrameQuest = CFrame.new(61119.890625, 18.50667381286621, 1567.489990234375)
		elseif Level == 450 or Level <= 474 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(3864.53466796875, 5.4081878662109375, -1925.2999267578125)).Magnitude >= 17000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.53466796875, 5.4081878662109375, -1925.2999267578125))
			end
			Mon = "God's Guard [Lv. 450]"
			MonPos = CFrame.new(-4627.390625, 866.9378051757812, -1945.0068359375)
			LQuest = 1
			NQuest = "SkyExp1Quest"
			NameMon = "God's Guard"
			CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
		elseif Level == 475 or Level <= 524 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
			end
			Mon = "Shanda [Lv. 475]"
			MonPos = CFrame.new(-7685.2890625, 5567.029296875, -497.586181640625)
			LQuest = 2
			NQuest = "SkyExp1Quest"
			NameMon = "Shanda"
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
		elseif Level == 525 or Level <= 549 then
			Mon = "Royal Squad [Lv. 525]"
			MonPos = CFrame.new(-7647.44775390625, 5637.11572265625, -1416.885009765625)
			LQuest = 1
			NQuest = "SkyExp2Quest"
			NameMon = "Royal Squad"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 550 or Level <= 624 then
			Mon = "Royal Soldier [Lv. 550]"
			MonPos = CFrame.new(-7831.77197265625, 5622.3154296875, -1777.7586669921875)
			LQuest = 2
			NQuest = "SkyExp2Quest"
			NameMon = "Royal Soldier"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 625 or Level <= 649 then
			Mon = "Galley Pirate [Lv. 625]"
			MonPos = CFrame.new(5634.70751953125, 95.40705108642578, 4037.620849609375)
			LQuest = 1
			NQuest = "FountainQuest"
			NameMon = "Galley Pirate"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
		elseif Level >= 650 then
			Mon = "Galley Captain [Lv. 650]"
			MonPos = CFrame.new(5687.47998046875, 43.858909606933594, 4886.95263671875)
			LQuest = 2
			NQuest = "FountainQuest"
			NameMon = "Galley Captain"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
				end
	elseif Id == 4442272183 then
		if Level == 700 or Level <= 724 then
			Mon = "Raider [Lv. 700]"
			LQuest = 1
			NQuest = "Area1Quest"
			NameMon = "Raider"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			MonPos = CFrame.new(-746,39,2389)
		elseif Level == 725 or Level <= 774 then
			Mon = "Mercenary [Lv. 725]"
			LQuest = 2
			NQuest = "Area1Quest"
			NameMon = "Mercenary"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)	
			--[[if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-950.9469604492188, 73.59642791748047, 1687.7239990234375)).Magnitude >= 200 then
				--repeat task.wait()
					MonPos = CFrame.new(-950.9469604492188, 73.59642791748047, 1687.7239990234375)
				--until (Vector3.new(-950.9469604492188, 73.59642791748047, 1687.7239990234375) - game.Players.LocalPlayer.Character.HumanoidRootPart).Magnitude <= 10
		elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1101.5570068359375, 73.59659576416016, 1155.75)).Magnitude >= 200 then
				--repeat task.wait()
					MonPos = CFrame.new(-1101.5570068359375, 73.59659576416016, 1155.75)
				--until (Vector3.new(-1101.5570068359375, 73.59659576416016, 1155.75) - game.Players.LocalPlayer.Character.HumanoidRootPart).Magnitude <= 10
			end]]
			MonPos = CFrame.new(-874,141,1312)
		elseif Level == 775 or Level <= 874 then
			Mon = "Swan Pirate [Lv. 775]"
			MonPos = CFrame.new(879.0155029296875, 121.6172103881836, 1236.484619140625)
			LQuest = 1
			NQuest = "Area2Quest"
			NameMon = "Swan Pirate"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
				--[[elseif Level == 800 or Level <= 874 then
			Mon = "Factory Staff [Lv. 800]"
			MonPos = CFrame.new(-49.088504791259766, 149.4334259033203, -150.80809020996094)
			NQuest = "Area2Quest"
			LQuest = 2
			NameMon = "Factory Staff"
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			]]
		elseif Level == 875 or Level <= 899 then
			Mon = "Marine Lieutenant [Lv. 875]"
			MonPos = CFrame.new(-2846.595703125, 73.00115966796875, -2985.402099609375)
			LQuest = 1
			NQuest = "MarineQuest3"
			NameMon = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 900 or Level <= 949 then
			Mon = "Marine Captain [Lv. 900]"
			MonPos = CFrame.new(-1838.5380859375, 91.05396270751953, -3209.526611328125)
			LQuest = 2
			NQuest = "MarineQuest3"
			NameMon = "Marine Captain"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 950 or Level <= 974 then
			Mon = "Zombie [Lv. 950]"
			MonPos = CFrame.new(-5710, 126.0670166015625, -775)
			LQuest = 1
			NQuest = "ZombieQuest"
			NameMon = "Zombie"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
		elseif Level == 975 or Level <= 999 then
			Mon = "Vampire [Lv. 975]"
			MonPos = CFrame.new(-6037.7578125, 6.437739849090576, -1326.2755126953125)
			LQuest = 2
			NQuest = "ZombieQuest"
			NameMon = "Vampire"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
		elseif Level == 1000 or Level <= 1049 then
			Mon = "Snow Trooper [Lv. 1000]"
			MonPos = CFrame.new(609.858826, 400.119904, -5372.25928)
			LQuest = 1
			NQuest = "SnowMountainQuest"
			NameMon = "Snow Trooper"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
		elseif Level == 1050 or Level <= 1099 then
			Mon = "Winter Warrior [Lv. 1050]"
			MonPos = CFrame.new(1240.4923095703125, 460.9142761230469, -5192.29345703125)
			LQuest = 2
			NQuest = "SnowMountainQuest"
			NameMon = "Winter Warrior"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
		elseif Level == 1100 or Level <= 1124 then
			Mon = "Lab Subordinate [Lv. 1100]"
			MonPos = CFrame.new(-5780.4345703125, 42.55501174926758, -4482.74853515625)
			LQuest = 1
			NQuest = "IceSideQuest"
			NameMon = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
		elseif Level == 1125 or Level <= 1174 then
			Mon = "Horned Warrior [Lv. 1125]"
			MonPos = CFrame.new(-6349.41015625, 21.453861236572266, -5834.12841796875)
			LQuest = 2
			NQuest = "IceSideQuest"
			NameMon = "Horned Warrior"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
		elseif Level == 1175 or Level <= 1199 then
			Mon = "Magma Ninja [Lv. 1175]"
			--[[if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5627.03662109375, 30.024616241455078, -5899.95654296875)).Magnitude >= 200 then
				MonPos = CFrame.new(-5627.03662109375, 30.024616241455078, -5899.95654296875)
		elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5275.21435546875, 39.44550704956055, -6133.7392578125)).Magnitude >= 200 then
				MonPos = CFrame.new(-5275.21435546875, 39.44550704956055, -6133.7392578125)
			end]]
			LQuest = 1
			NQuest = "FireSideQuest"
			NameMon = "Magma Ninja"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			MonPos = CFrame.new(-5428, 78, -5959)
		elseif Level == 1200 or Level <= 1249 then
			Mon = "Lava Pirate [Lv. 1200]"
			MonPos = CFrame.new(-5232.8466796875, 51.79249954223633, -4729.9609375)
			LQuest = 2
			NQuest = "FireSideQuest"
			NameMon = "Lava Pirate"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
		elseif Level == 1250 or Level <= 1274 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Deckhand [Lv. 1250]"
			MonPos = CFrame.new(1197.23583984375, 125.09214782714844, 33047.83984375)
			LQuest = 1
			NQuest = "ShipQuest1"
			NameMon = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
		elseif Level == 1275 or Level <= 1299 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Engineer [Lv. 1275]"
			MonPos = CFrame.new(922.4091186523438, 43.57904052734375, 32783.21875)
			LQuest = 2
			NQuest = "ShipQuest1"
			NameMon = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
		elseif Level == 1300 or Level <= 1324 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Steward [Lv. 1300]"
			MonPos = CFrame.new(918.0401000976562, 129.07810974121094, 33419.45703125)
			LQuest = 1
			NQuest = "ShipQuest2"
			NameMon = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
		elseif Level == 1325 or Level <= 1349 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Officer [Lv. 1325]"
			MonPos = CFrame.new(1188.7747802734375, 181.18414306640625, 33311.84765625)
			LQuest = 2
			NQuest = "ShipQuest2"
			NameMon = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
		elseif Level == 1350 or Level <= 1374 then
			Mon = "Arctic Warrior [Lv. 1350]"
			MonPos = CFrame.new(5984.4443359375, 59.70625686645508, -6170.4990234375)
			LQuest = 1
			NQuest = "FrostQuest"
			NameMon = "Arctic Warrior"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
		elseif Level == 1375 or Level <= 1424 then
			Mon = "Snow Lurker [Lv. 1375]"
			MonPos = CFrame.new(5656.3681640625, 43.96525573730469, -6785.47998046875)
			LQuest = 2
			NQuest = "FrostQuest"
			NameMon = "Snow Lurker"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
		elseif Level == 1425 or Level <= 1449 then
			Mon = "Sea Soldier [Lv. 1425]"
			--[[if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-3201.64599609375, 35.59043884277344, -9796.525390625)).Magnitude >= 200 then
				MonPos = CFrame.new(-3201.64599609375, 35.59043884277344, -9796.525390625)
		elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-2766.245849609375, 46.5843505859375, -9836.3525390625)).Magnitude >= 200 then
				MonPos = CFrame.new(-2766.245849609375, 46.5843505859375, -9836.3525390625)
			end]]
			LQuest = 1
			NQuest = "ForgottenQuest"
			NameMon = "Sea Soldier"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			MonPos = CFrame.new(-3038, 15, -9720)
		elseif Level >= 1450 then
			Mon = "Water Fighter [Lv. 1450]"
			MonPos = CFrame.new(-3286.5224609375, 252.3995819091797, -10515.396484375)
			LQuest = 2
			NQuest = "ForgottenQuest"
			NameMon = "Water Fighter"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
				end
	elseif Id == 7449423635 then
		if Level == 1500 or Level <= 1524 then
			Mon = "Pirate Millionaire [Lv. 1500]"
			MonPos = CFrame.new(-292.1559753417969, 43.8282470703125, 5582.9287109375)
			LQuest = 1
			NQuest = "PiratePortQuest"
			NameMon = "Pirate Millionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 1525 or Level <= 1574 then
			Mon = "Pistol Billionaire [Lv. 1525]"
			MonPos = CFrame.new(-315.38531494140625, 119.50130462646484, 6005.96630859375)
			LQuest = 2
			NQuest = "PiratePortQuest"
			NameMon = "Pistol Billionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 1575 or Level <= 1599 then
			Mon = "Dragon Crew Warrior [Lv. 1575]"
			MonPos = CFrame.new(6414.8330078125, 121.43488311767578, -807.5617065429688)
			LQuest = 1
			NQuest = "AmazonQuest"
			NameMon = "Dragon Crew Warrior"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
		elseif Level == 1600 or Level <= 1624 then 
			Mon = "Dragon Crew Archer [Lv. 1600]"
			MonPos = CFrame.new(6622.6787109375, 378.4330749511719, 182.57872009277344)
			NQuest = "AmazonQuest"
			LQuest = 2
			NameMon = "Dragon Crew Archer"
			CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
		elseif Level == 1625 or Level <= 1649 then
			Mon = "Female Islander [Lv. 1625]"
			MonPos = CFrame.new(5719.08203125, 781.7914428710938, 871.026123046875)
			NQuest = "AmazonQuest2"
			LQuest = 1
			NameMon = "Female Islander"
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
		elseif Level == 1650 or Level <= 1699 then 
			Mon = "Giant Islander [Lv. 1650]"
			MonPos = CFrame.new(4937.7333984375, 604.96728515625, -237.5341796875)
			NQuest = "AmazonQuest2"
			LQuest = 2
			NameMon = "Giant Islander"
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
		elseif Level == 1700 or Level <= 1724 then
			Mon = "Marine Commodore [Lv. 1700]"
			MonPos = CFrame.new(2394.572998046875, 121.98365020751953, -7600.91943359375)
			LQuest = 1
			NQuest = "MarineTreeIsland"
			NameMon = "Marine Commodore"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
		elseif Level == 1725 or Level <= 1774 then
			Mon = "Marine Rear Admiral [Lv. 1725]"
			MonPos = CFrame.new(3637.744873046875, 160.55908203125, -7037.28857421875)
			NameMon = "Marine Rear Admiral"
			NQuest = "MarineTreeIsland"
			LQuest = 2
			CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
		elseif Level == 1775 or Level <= 1799 then
			Mon = "Fishman Raider [Lv. 1775]"
			MonPos = CFrame.new(-10352.6923828125, 344.1450500488281, -8169.39111328125)
			LQuest = 1
			NQuest = "DeepForestIsland3"
			NameMon = "Fishman Raider"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
		elseif Level == 1800 or Level <= 1824 then
			Mon = "Fishman Captain [Lv. 1800]"
			MonPos = CFrame.new(-11087.44140625, 331.79766845703125, -8934.5576171875)
			LQuest = 2
			NQuest = "DeepForestIsland3"
			NameMon = "Fishman Captain"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
		elseif Level == 1825 or Level <= 1849 then
			Mon = "Forest Pirate [Lv. 1825]"
			MonPos = CFrame.new(-13241.498046875, 428.2030944824219, -7748.095703125)
			LQuest = 1
			NQuest = "DeepForestIsland"
			NameMon = "Forest Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
		elseif Level == 1850 or Level <= 1899 then
			Mon = "Mythological Pirate [Lv. 1850]"
			MonPos = CFrame.new(-13427.259765625, 511.83453369140625, -6943.66162109375)
			LQuest = 2
			NQuest = "DeepForestIsland"
			NameMon = "Mythological Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
		elseif Level == 1900 or Level <= 1924 then
			Mon = "Jungle Pirate [Lv. 1900]"
			MonPos = CFrame.new(-12113.16796875, 441.3117980957031, -10540.6298828125)
			LQuest = 1
			NQuest = "DeepForestIsland2"
			NameMon = "Jungle Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
		elseif Level == 1925 or Level <= 1974 then
			Mon = "Musketeer Pirate [Lv. 1925]"
			MonPos = CFrame.new(-13249.8271484375, 496.2460632324219, -9584.373046875)
			LQuest = 2
			NQuest = "DeepForestIsland2"
			NameMon = "Musketeer Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
		elseif Level == 1975 or Level <= 1999 then
			Mon = "Reborn Skeleton [Lv. 1975]"
			MonPos = CFrame.new(-8766.345703125, 174.2373809814453, 6169.01513671875)
			LQuest = 1
			NQuest = "HauntedQuest1"
			NameMon = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 2000 or Level <= 2024 then
			Mon = "Living Zombie [Lv. 2000]"
			MonPos = CFrame.new(-9925.1884765625, 158.6781005859375, 6036.7314453125)
			LQuest = 2
			NQuest = "HauntedQuest1"
			NameMon = "Living Zombie"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 2025 or Level <= 2049 then
			Mon = "Demonic Soul [Lv. 2025]"
			MonPos = CFrame.new(-9542.6875, 272.1398010253906, 6249.53515625)
			LQuest = 1
			NQuest = "HauntedQuest2"
			NameMon = "Demonic Soul"
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
		elseif Level == 2050 or Level <= 2074 then
			Mon = "Posessed Mummy [Lv. 2050]"
			MonPos = CFrame.new(-9544.2744140625, 60.294342041015625, 6348.95849609375)
			LQuest = 2
			NQuest = "HauntedQuest2"
			NameMon = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2075 or Level <= 2099 then
			Mon = "Peanut Scout [Lv. 2075]"
			MonPos = CFrame.new(-2063.197021484375, 78.91095733642578, -10137.9287109375)
			LQuest = 1
			NQuest = "NutsIslandQuest"
			NameMon = "Peanut Scout"
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2100 or Level <= 2124 then
			Mon = "Peanut President [Lv. 2100]"
			MonPos = CFrame.new(-2133.56396484375, 70.31375885009766, -10523.0908203125)
			LQuest = 2
			NQuest = "NutsIslandQuest"
			NameMon = "Peanut President"
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2125 or Level <= 2149 then
			Mon = "Ice Cream Chef [Lv. 2125]"
			MonPos = CFrame.new(-893.8236083984375, 116.68982696533203, -10938.47265625)
			LQuest = 1
			NQuest = "IceCreamIslandQuest"
			NameMon = "Ice Cream Chef"
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2150 or Level <= 2199 then
			Mon = "Ice Cream Commander [Lv. 2150]"
			MonPos = CFrame.new(-585.1178588867188, 203.74639892578125, -11267.0107421875)
			LQuest = 2
			NQuest = "IceCreamIslandQuest"
			NameMon = "Ice Cream Commander"
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2200 or Level <= 2224 then
			Mon = "Cookie Crafter [Lv. 2200]"
			MonPos = CFrame.new(-2286.31103515625, 91.31655883789062, -12041.6884765625)
			LQuest = 1
			NQuest = "CakeQuest1"
			NameMon = "Cookie Crafter"
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
		elseif Level == 2225 or Level <= 2249 then
			Mon = "Cake Guard [Lv. 2225]"
			MonPos = CFrame.new(-1630.3675537109375, 195.69100952148438, -12275.96875)
			LQuest = 2
			NQuest = "CakeQuest1"
			NameMon = "Cake Guard"
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
		elseif Level == 2250 or Level <= 2274 then
			Mon = "Baking Staff [Lv. 2250]"
			MonPos = CFrame.new(-1824.580810546875, 95.08509826660156, -12891.3232421875)
			LQuest = 1
			NQuest = "CakeQuest2"
			NameMon = "Baking Staff"
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
		elseif Level == 2275 or Level <= 2299 then
			Mon = "Head Baker [Lv. 2275]"
			MonPos = CFrame.new(-2068.284912109375, 68.5050048828125, -12950.775390625)
			LQuest = 2
			NQuest = "CakeQuest2"
			NameMon = "Head Baker"
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
		elseif Level == 2300 or Level <= 2324 then
			Mon = "Cocoa Warrior [Lv. 2300]"
			MonPos = CFrame.new(43.3896598815918, 56.341636657714844, -12324.78515625)
			LQuest = 1
			NQuest = "ChocQuest1"
			NameMon = "Cocoa Warrior"
			CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
		elseif Level == 2325 or Level <= 2349 then
			Mon = "Chocolate Bar Battler [Lv. 2325]"
			MonPos = CFrame.new(719.6046752929688, 69.9678955078125, -12597.25390625)
			LQuest = 2
			NQuest = "ChocQuest1"
			NameMon = "Chocolate Bar Battler"
			CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
		elseif Level == 2350 or Level <= 2374 then
			Mon = "Sweet Thief [Lv. 2350]"
			MonPos = CFrame.new(155.99618530273438, 54.82904815673828, -12580.7265625)
			LQuest = 1
			NQuest = "ChocQuest2"
			NameMon = "Sweet Thief"
			CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
		elseif Level >= 2375 then
			Mon = "Candy Rebel [Lv. 2375]"
			MonPos = CFrame.new(-7.535787105560303, 35.526527404785156, -12896.34375)
			LQuest = 2
			NQuest = "ChocQuest2"
			NameMon = "Candy Rebel"
			CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
		end
	end
end

local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
	local p13 = CbFw2.activeController
	local ret = p13.blades[1]
	if not ret then return end
	while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
	return ret
end

function AttackNoCD() 
	local AC = CbFw2.activeController
	for i = 1, 1 do 
		local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
			plr.Character,
			{plr.Character.HumanoidRootPart},
			60
		)
			local cac = {}
			local hash = {}
			for k, v in pairs(bladehit) do
				if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
					table.insert(cac, v.Parent.HumanoidRootPart)
					hash[v.Parent] = true
				end
			end
			bladehit = cac
		if #bladehit > 0 then
			local u8 = debug.getupvalue(AC.attack, 5)
			local u9 = debug.getupvalue(AC.attack, 6)
			local u7 = debug.getupvalue(AC.attack, 4)
			local u10 = debug.getupvalue(AC.attack, 7)
			local u12 = (u8 * 798405 + u7 * 727595) % u9
			local u13 = u7 * 798405
			(function()
			u12 = (u12 * u9 + u13) % 1099511627776
				u8 = math.floor(u12 / u9)
				u7 = u12 - u8 * u9
			end)()
			u10 = u10 + 1
			debug.setupvalue(AC.attack, 5, u8)
			debug.setupvalue(AC.attack, 6, u9)
			debug.setupvalue(AC.attack, 4, u7)
			debug.setupvalue(AC.attack, 7, u10)
			pcall(function()
				for k, v in pairs(AC.animator.anims.basic) do
					v:Play()
				end                  
			end)
			if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
				game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
				game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
				game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
			end
		end
	end
end
function NormalAttack()
	if not _G.FastAttack then
		local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
		local CombatFramework = debug.getupvalues(Module)[2]
		local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
		CamShake:Stop()
		CombatFramework.activeController.attacking = false
		CombatFramework.activeController.timeToNextAttack = 0
		CombatFramework.activeController.hitboxMagnitude = 180
		game:GetService'VirtualUser':CaptureController()
		game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
	end
end
	

function EquipItem(Item)
	local SeItem = game.Players.LocalPlayer.Backpack:FindFirstChild(Item)
	wait()
	game.Players.LocalPlayer.Character.Humanoid:EquipTool(SeItem)
end
if getgenv().MBExec and game.Players.LocalPlayer.Name ~= "pete9973" then
	print("Second Execute")
	game.Players.LocalPlayer:Kick("\n\n Don't execute 2 times")
else
	print("First Exe")
	getgenv().MBExec = true
end

local Library = Update:Window("CFrame Hub : discord.gg/VERTxGCaFp "," 4483362458")

local AutoFarmPage = Library:Tab("Main","")
local RaidPage = Library:Tab("Raid","")
local SettingPage = Library:Tab("Setting","")

AutoFarmPage:Dropdown("Select Weapon Type",{"Melee","Blox Fruit","Sword","Gun"},function(t)
	_G.WeaponType = t
end)
AutoFarmPage:Toggle("Auto Farm",_G.AutoFarm,function(t)
	_G.AutoFarm = t
end)

RaidPage:Dropdown("Select Dungeon Type",{"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"},function(t)
	_G.DunChip = t
end)
RaidPage:Toggle("Auto Raid",false,function(t)
	_G.AutoRaid = t
end)

RaidPage:Toggle("Auto Next Island",false,function(t)
	_G.NextIsland = t
end)

SettingPage:Toggle("Auto Buso",true,function(t)
	_G.AutoBuso = t
end)

SettingPage:Toggle("Auto Ken",true,function(t)
	_G.AutoKen = t
end)

SettingPage:Toggle("No Clip",true,function(t)
	_G.NoClip = t
end)

SettingPage:Toggle("Fast Attack",false,function(t)
	_G.FastAttack = t
end)

SettingPage:Dropdown("Select Fast Attack Type",{'Normal','Fast','Super Fast'},function(t)
	if t == 'Normal' then
		_G.FastDelay = 0.3
	end
	if t == 'Fast' then
		_G.FastDelay = 0.1
	end
	if t == 'Super Fast' then
		_G.FastDelay = 0
	end
end)

spawn(function()
while wait() do
pcall(function()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	if v:IsA('Tool') then
		if v.ToolTip == _G.WeaponType then
			_G.SelectWeapon = v.Name
		end
	end
end
end)
end
end)

spawn(function()
while true do task.wait()
pcall(function()
if _G.FastAttack then
repeat wait(_G.FastDelay) AttackNoCD() until not _G.FastAttack

end
end)
end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoFarm then
				CheckQuest()
				if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
					print('Abandon')
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				end

				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					StartBring = false
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
						BTP(CFrameQuest)
					else
						TP(CFrameQuest)
					end
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					CheckQuest()
					StartBring = true
					if game.Workspace.Enemies:FindFirstChild(Mon) then
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Name == Mon and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
								v.HumanoidRootPart.CanCollide = false
								v.Head.CanCollide = false
								_G.Pos = v.HumanoidRootPart.CFrame
								_G.Mon = v.Name
								repeat task.wait()
									NormalAttack()
									TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
									EquipItem(_G.SelectWeapon)
								until v.Humanoid.Health <= 0 or not v.Parent or not _G.AutoFarm or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
							end
						end
					else
						TP(MonPos)
					end
				end
			end
		end)
	end	
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if StartBring then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Name == _G.Mon and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
						v.Humanoid.WalkSpeed = 0
						v.Humanoid.JumpPower = 0
						v.HumanoidRootPart.Size = Vector3.new(60,60,60)
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						v.HumanoidRootPart.CFrame = _G.Pos
						if v.Humanoid:FindFirstChild('Animator') then
							v.Humanoid.Animator:Destroy()
						end
						v.Humanoid:ChangeState(11)
						v.Humanoid:ChangeState(14)
						sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
					end
				end
			end
		end)
	end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if StartBring then
				for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
					if v:IsA('Part') and v:IsA('MeshPart') then
						v.Transparency = 1
					end
				end
			end
		end)
	end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoRaid then
				if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
					for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat task.wait()
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(100,100,100)
									v.HumanoidRootPart.Transparency = 0.8
								until not _G.Killaura or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoRaid then
				if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
					if not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.DunChip)
					end
					if not game.Workspace._WorldOrigin.Locations:FindFirstChild("Island 1") then
						if game.PlaceId == 4442272183 then
							fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
						elseif game.PlaceId == 7449423635 then
							fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.NextIsland then
				if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
					for i,v in pairs(game.Workspace._WorldOrigin.Locations:GetChildren()) do
						if v.Name == ("Island 5") then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10 <= 500 then
								TP(v.CFrame)
							end
						elseif v.Name == ("Island 4") then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10 <= 500 then
								TP(v.CFrame)
							end
						elseif v.Name == ("Island 3") then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10 <= 500 then
								TP(v.CFrame)
							end
						elseif v.Name == ("Island 2") then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10 <= 500 then
								TP(v.CFrame)
							end
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
				if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" then
					v:Destroy()
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoBuso then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoKen then
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
			end
		end)
	end
end)
spawn(function()
	while task.wait() do
		pcall(function()
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
		end)
	end
end)
local CharParts = {}
game:GetService("RunService").Stepped:connect(function()
	pcall(function()
		if _G.NoClip then
			for i = 1, #CharParts do
				CharParts[i].CanCollide = false
			end
		else
			for i = 1, #CharParts do
				CharParts[i].CanCollide = true
			end
		end
	end)
end)

function SetupCharCollide(Char)
	CharParts = {}
	Char:WaitForChild("Head")
	for i, v in pairs(Char:GetChildren()) do
		if v:IsA("BasePart") then
			table.insert(CharParts, v)
		end
	end
end

if game.Players.LocalPlayer.Character then
	SetupCharCollide(game.Players.LocalPlayer.Character)
end
game.Players.LocalPlayer.CharacterAdded:connect(function(Ch)
	SetupCharCollide(Ch)
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoFarm or _G.NextIsland then
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
					v:Destroy()
				end
				if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity")
					Noclip.Name = "BodyClip"
					Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
					Noclip.MaxForce = Vector3.new(100000,100000,100000)
					Noclip.Velocity = Vector3.new(0,0,0)
				end
			else
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
			end
		end)
	end
end)
spawn(function()
	pcall(function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end)
end)

