local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local workspace = game:GetService("Workspace")

privateProperties = {
Color = Color3.fromRGB(0,255,255); 
Font = Enum.Font.SourceSansBold;
TextSize = 11;
}

local CL = false

local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local message = Instance.new("Message",workspace)

local CurrentGame = game.PlaceId

local function GetPlayer(V)
  for i,v in pairs(game.Players:GetChildren()) do
       if (string.sub(string.lower(v.DisplayName) or string.lower(v.DisplayName),1,string.len(V))) == string.lower(V) then
          return v.Name
       end
   end
end

function Sound1()
  for i,v in pairs(game.Workspace:GetDescendants()) do
     if v:IsA("Sound") then 
        v:Play()
     end
  end
end

function Sound2()
  for i,v in pairs(game.Workspace:GetDescendants()) do
     if v:IsA("Sound") then 
        v:Stop()
    end
  end
end

local Social = "Tiktok: @capviktor, YT: Entity, \nMy roblox username Rivanda_Cheater and CookieProgamming (2nd acc)"

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3",HidePremium = false,SaveConfig = false,ConfigFolder = "OrionTest"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Sound",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Character",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Teleports",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Disaster log",
Icon = "rbxassetid://",
PremiumOnly = false
})

T3:AddSlider({
  Name = "Speed",
  Min = 0,
  Max = 500,
  Default = 16,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Speed",
  Callback = function(Value) 
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})


T3:AddSlider({
  Name = "Jump Power",
  Min = 0,
  Max = 1000,
  Default = 50,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Power",
  Callback = function(Value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
  end
})


T3:AddSlider({
  Name = "Visual Game Time",
  Min = 0,
  Max = 24,
  Default = 12,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Time",
  Callback = function(Value)
    game:GetService("Lighting")["ClockTime"] = Value
  end
})

T2:AddToggle({
  Name = "Spam Sound",
  Default = false,
  Callback = function(Value)
     _G.ClientSound = Value
      
         while wait() do
         if _G.ClientSound == false then break end
             for i,v in pairs(game.Workspace:GetDescendants()) do
                 if v:IsA("Sound") then 
                    v:Play()
                 end
             end
         end
    end
})

T2:AddToggle({
  Name = "Mute sound",
  Default = false,
  Callback = function(Value)
     _G.MuteClientSound = Value
      
         while wait() do
         if _G.MuteClientSound == false then break end
             for i,v in pairs(game.Workspace:GetDescendants()) do
                 if v:IsA("Sound") then 
                    v:Stop()
                 end
              end
         end
    end
})

T2:AddToggle({
  Name = "Kill sound service",
  Default = false,
  Callback = function(Value)
     _G.ClientSoundService = Value
      
         while wait() do
         if _G.ClientSoundService == false then break end
             Sound1()
             Sound2()
         end
    end
})

T1:AddToggle({
  Name = "Enable leak disaster",
  Default = true,
  Callback = function(Value)
    _G.leakenabled = Value
  end
})

T1:AddToggle({
  Name = "Leak disaster [ Notify ]",
  Default = false,
  Callback = function(Value)
    _G.LeakDisasternotify = Value
  end
})

function GetDisasterTime()
local HOUR = math.floor((tick() % 86400) / 3600)
local MINUTE = math.floor((tick() % 3600) / 60)
local SECOND = math.floor(tick() % 60)
local AP = HOUR > 11 and 'PM' or 'AM'
HOUR = (HOUR % 12 == 0 and 12 or HOUR % 12)
HOUR = HOUR < 10 and '0' .. HOUR or HOUR
MINUTE = MINUTE < 10 and '0' .. MINUTE or MINUTE
SECOND = SECOND < 10 and '0' .. SECOND or SECOND
return HOUR .. ":" .. MINUTE .. ":" .. SECOND .. " " .. AP
end

T1:AddToggle({
  Name = "Leak disaster [ Log ]",
  Default = false,
  Callback = function(Value)
    _G.LeakLogDisaster = Value
  end
})

T1:AddToggle({
  Name = "Safe mode - Removed all disaster objects",
  Default = false,
  Callback = function(Value)
    _G.Safemode = Value
  end
})


T1:AddToggle({
  Name = "Remove sandstorm and blizzard UI",
  Default = false,
  Callback = function(Value)
    _G.HideAnnoyUI = Value
   end
})

T4:AddButton({
  Name = "Tween TP to lobby",
  Callback = function()
    TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = CFrame.new(-243,194,331)}):Play()
  end
})

T4:AddButton({
  Name = "Tween TP to map",
  Callback = function()
    TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = CFrame.new(-117,47,5)}):Play()
  end
})

T4:AddToggle({
  Name = "AFK win farm",
  Default = false,
  Callback = function(Value)
    _G.FFarm = Value
      
         while wait() do
         if _G.FFarm == false then break end
             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-269,180,382)
         end
   end
})

local logdis = "Disaster will appear if you enabled 'Leak disaster [ Log ]'"
local forLog = T5:AddParagraph("Disaster Debug",logdis)
local function disasterPredict()
if game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChild("SurvivalTag") and _G.leakenabled == true then
     if _G.LeakDisasternotify == true then
        OrionLib:MakeNotification({Name = "Current disaster",Content = game:GetService("Players")["LocalPlayer"]["Character"]["SurvivalTag"]["Value"],Time = 10})
     elseif _G.LeakLogDisaster == true then
        logdis = logdis .. "\n" .. game:GetService("Players")["LocalPlayer"]["Character"]["SurvivalTag"]["Value"]
        forLog:Set(logdis)
    elseif _G.LeakLogDisaster == true and _G.LeakDisasternotify == true then
        logdis = logdis .. "\n" .. game:GetService("Players")["LocalPlayer"]["Character"]["SurvivalTag"]["Value"]
        forLog:Set(logdis)
        OrionLib:MakeNotification({Name = "Current disaster",Content = game:GetService("Players")["LocalPlayer"]["Character"]["SurvivalTag"]["Value"],Time = 10})
    end
end
end

local function getChild(int,func)
  workspace["Structure"][int].ChildAdded:connect(function(event)
      if event then
        for i,v in pairs(workspace.Structure[int]:GetChildren()) do
             func(i,v)
        end
      else
        workspace["Structure"][int]:Destroy()
      end
    end)
end

local function onEventAdded(ux)
  ux.ChildAdded:connect(function(event)
    if event.Name == "TornadoPart" and _G.Safemode == true then
        getChild("TornadoPart",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "MeteorTemplate" and _G.Safemode == true then
        getChild("MeteorTemplate",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "AcidRain" and _G.Safemode == true then
        workspace["Structure"]["AcidRain"]:Destroy()
      elseif event.Name == "Lightning" and _G.Safemode == true then
        getChild("Lightning",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "Cloud" and _G.Safemode == true then
        workspace["Structure"]["Cloud"]["Mesh"]:Destroy()
      elseif event.Name == "Dust" and _G.Safemode == true then
        getChild("Dust",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "TsunamiWave" and _G.Safemode == true then
        getChild("TsunamiWave",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "VirusParticles" and _G.Safemode == true then
        getChild("VirusParticles",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "Lava" and _G.Safemode == true then
        workspace["Structure"]["Lava"]:Destroy()
      elseif event.Name == "MeteorFolder" then
        getChild("MeteorFolder",function(i,v)
            v:Destroy()
        end)
      end
  end)
end

local function onUIAdded(ux)
  ux.ChildAdded:connect(function(event)
    if event.Name == "SandStormGui" and _G.HideAnnoyUI == true then
        game:GetService("Players")["LocalPlayer"]["PlayerGui"]["SandStormGui"]:Destroy()
      elseif event.Name == "BlizzardGui" and _G.HideAnnoyUI == true then
        game:GetService("Players")["LocalPlayer"]["PlayerGui"]["BlizzardGui"]:Destroy()
      end
  end)
end

local function Repeat(R)
   R.ChildAdded:connect(function(Find)
           if Find.Name == "SurvivalTag" and _G.leakenabled == true then
            if _G.LeakDisasternotify == true then
              OrionLib:MakeNotification({Name = "Current disaster",Content = Find.Value,Time = 10})
            elseif _G.LeakLogDisaster == true then
              logdis = logdis .. "\n" .. Find.Value
              forLog:Set(logdis)
          elseif _G.LeakLogDisaster == true and _G.LeakDisasternotify == true then
              logdis = logdis .. "\n" .. Find.Value
              forLog:Set(logdis)
              OrionLib:MakeNotification({Name = "Current disaster",Content = Find.Value,Time = 10})
            end
           end
       end)
end

Repeat(game:GetService("Players").LocalPlayer.Character)
disasterPredict()
onEventAdded(workspace["Structure"])
onUIAdded(game:GetService("Players")["LocalPlayer"]["PlayerGui"])
game:GetService("Players").LocalPlayer.CharacterAdded:connect(function(R)
       Repeat(R)
end)
