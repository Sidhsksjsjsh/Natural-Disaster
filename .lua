local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local workspace = game:GetService("Workspace")
local user = game.Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")

local privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 11;
}

--TextChatService["TextChannels"]["RBXGeneral"]:SendAsync("Fans?")
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

local xraysettings = {
	fill = Color3.new(0,1,0),
	outline = Color3.new(1,1,1),
	filltrans = 0,
	outtrans = 0,
	enab = false
}

local function HighlightPlayer()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character:FindFirstChild("TURTLE-XRAY") then
               v.Character["TURTLE-XRAY"]:Destroy()
	    end

	     if xraysettings.enab == true then
                local esp = Instance.new("Highlight")
                esp.Name = "TURTLE-XRAY"
                esp.FillColor = xraysettings.fill
                esp.OutlineColor = xraysettings.outline
                esp.FillTransparency = xraysettings.filltrans
                esp.OutlineTransparency = xraysettings.outtrans
                esp.Adornee = v.Character
	        esp.Parent = v.Character
                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	     end
	end
end

local Social = "Tiktok: @capviktor, YT: Entity, \nMy roblox username Rivanda_Cheater and CookieProgamming (2nd acc)"

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main",true)
local T2 = wndw:Tab("Sound")
local T3 = wndw:Tab("Character")
local T4 = wndw:Tab("Teleports")
local T5 = wndw:Tab("Disaster Log",true)

local var = {
	spamsound = false,
	mutesound = false,
	killsound = false,
	winfarm = false,
	inv = false,
	disaster = {
		enabled = true,
		log = true,
		notify = true,
		obj = true,
		annoyui = true,
		cht = true
	},
	time = {
		SECOND = math.floor(tick() % 60),
		MINUTE = math.floor((tick() % 3600) / 60),
		HOUR = math.floor((tick() % 86400) / 3600),
		AP = math.floor(tick() % 60),
		second = 0,
		minute = 0,
		hour = 0,
		ap = "Null"
	}
}
--var.time.second
T3:Slider("Speed",0,500,16,function(value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)


T3:Slider("Jump",0,1000,50,function(value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
end)


T3:Slider("Visual Game Time",0,24,12,function(value)
    game:GetService("Lighting")["ClockTime"] = value
end)

T2:Toggle("Spam sound",false,function(value)
     var.spamsound = value
      
     while wait() do
         if var.spamsound == false then break end
             for i,v in pairs(game.Workspace:GetDescendants()) do
                 if v:IsA("Sound") then 
                    v:Play()
                 end
             end
         end
end)

T2:Toggle("Mute sound",false,function(value)
     var.mutesound = value
      
         while wait() do
         if var.mutesound == false then break end
             for i,v in pairs(game.Workspace:GetDescendants()) do
                 if v:IsA("Sound") then 
                    v:Stop()
                 end
              end
         end
end)

T2:Toggle("Kill sound service",false,function(value)
     var.killsound = value
      
         while wait() do
         if var.killsound == false then break end
             Sound1()
             Sound2()
         end
    end)

T1:Toggle("Enabled disaster",true,function(value)
    var.disaster.enabled = value
end)

T1:Toggle("Notify disaster",true,function(value)
    var.disaster.notify = value
end)

local function GetDisasterTime()
	var.time.hour = (var.time.HOUR % 12 == 0 and 12 or var.time.HOUR % 12)
	var.time.hour = var.time.HOUR < 10 and '0' .. var.time.HOUR or var.time.HOUR
	var.time.minute = var.time.MINUTE < 10 and '0' .. var.time.MINUTE or var.time.MINUTE
	var.time.second = var.time.SECOND < 10 and '0' .. var.time.SECOND or var.time.SECOND
	--var.time.ap = var.time.HOUR > 11 and 'PM' or 'AM'
	return var.time.hour .. ":" .. var.time.minute .. ":" .. var.time.second .. " " .. var.time.AP
end

T1:Toggle("Log disaster",false,function(value)
    var.disaster.log = value
end)

T1:Toggle("Remove all disaster object",true,function(value)
    var.disaster.obj = value
end)


T1:Toggle("Remove Blizzard and Sandstorm UI",true,function(value)
    var.disaster.annoyui = value
end)

T1:Toggle("Leak disaster in chat",true,function(value)
    var.disaster.cht = value
end)

T1:Toggle("Enable inventory",false,function(value)
	var.inv = value
	while wait() do
		if var.inv == false then break end
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack,true)
	end
end)

T4:Button("Tween to lobby",function()
    TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = CFrame.new(-243,194,331)}):Play()
end)

T4:Button("Tween to map",function()
    TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = CFrame.new(-117,47,5)}):Play()
end)

T4:Button("Tween to lobby ( Outside )",function()
    TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = CFrame.new(-240,194,297)}):Play()
end)

T4:Button("TP to lobby",function()
    user["Character"]["HumanoidRootPart"]["CFrame"] = CFrame.new(-243,194,331)
end)

T4:Button("TP to map",function()
    user["Character"]["HumanoidRootPart"]["CFrame"] = CFrame.new(-117,47,5)
end)

T4:Button("TP to lobby ( Outside )",function()
    user["Character"]["HumanoidRootPart"]["CFrame"] = CFrame.new(-240,194,297)
end)

T4:Toggle("AFK win farm",false,function(value)
    var.winfarm = value
      
     while wait() do
         if var.winfarm == false then break end
             user["Character"]["HumanoidRootPart"]["CFrame"] = CFrame.new(-269,180,382)
     end
end)
--Enum.CoreGuiType.Backpack
if user.Name == "Rivanda_Cheater" then
local models = "null"
local txt = "null"
	
local T6 = wndw:Tab("AI Panels",true)
local ailab = T6:Label("AI Models")
	
T6:Dropdown("Choose AI Models",{"Top result : wikipedia","Entire article : wikipedia","Summarize paragraph AI","Google Flan T5","GPT2 Sentence Completion","Chessy chuck norris jokes","Book searching"},function(value)
	models = value
end)

T6:Textbox("Commands",false,function(value)
	txt = value
end)

T6:Button("Generate response",function()
	if txt ~= "null" and models ~= "null" then
		ailab:EditLabel(models .. "\nGenerating response...")
		wait(1.5)
		lib:TurtleAI(txt,models,function(array)
			ailab:EditLabel(models .. "\n\n" .. array)
		end)
	else
		ailab:EditLabel(lib:ColorFonts("Commands is null, pls fill it","Red"))
	end
end)
end

local logdis = "Disaster will appear if you enabled 'Leak disaster [ Log ]'"
local forLog = T5:Label(logdis)
local function disasterPredict() --GetDisasterTime()
if game:GetService("Players")["LocalPlayer"]["Character"]:FindFirstChild("SurvivalTag") and var.disaster.enabled == true then
     if var.disaster.notify == true then
        lib:notify(lib:ColorFonts("⚠️ WARNING ⚠️","Red") .. lib:ColorFonts(" - ","White") .. lib:ColorFonts(user["Character"]["SurvivalTag"]["Value"],"Red") .. lib:ColorFonts(" | " .. GetDisasterTime(),"White"),10)
     end
     if var.disaster.log == true then
        logdis = logdis .. "\n" .. lib:ColorFonts(GetDisasterTime(),"White") .. lib:ColorFonts(" -- ","Gray") .. lib:ColorFonts(user["Character"]["SurvivalTag"]["Value"],"Red") .. lib:ColorFonts(" | " .. GetDisasterTime(),"White")
        forLog:EditLabel(logdis)
     end
     if var.disaster.cht == true then
	TextChatService["TextChannels"]["RBXGeneral"]:SendAsync("⚠️ WARNING! ⚠️ | Current disaster is " .. user["Character"]["SurvivalTag"]["Value"])
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

local function instantDelete()
  workspace["Structure"].ChildAdded:connect(function(event)
	if event:IsA("Folder") then
           for i,v in pairs(workspace["Structure"]:GetDescendants()) do
	        v:Destroy()
           end
	else
	   for i,v in pairs(workspace["Structure"]:GetChildren()) do
	       if i ~= 1 then
		  v:Destroy()
	      end
           end
	end
    end)
end

local function onEventAdded(ux)
  ux.ChildAdded:connect(function(event)
    if event.Name == "TornadoPart" and var.disaster.obj == true then
        getChild("TornadoPart",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "MeteorTemplate" and var.disaster.obj == true then
        getChild("MeteorTemplate",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "AcidRain" and var.disaster.obj == true then
        workspace["Structure"]["AcidRain"]:Destroy()
      elseif event.Name == "Lightning" and var.disaster.obj == true then
        getChild("Lightning",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "Cloud" and var.disaster.obj == true then
        workspace["Structure"]["Cloud"]["Mesh"]:Destroy()
      elseif event.Name == "Dust" and var.disaster.obj == true then
        getChild("Dust",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "TsunamiWave" and var.disaster.obj == true then
        getChild("TsunamiWave",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "VirusParticles" and var.disaster.obj == true then
        getChild("VirusParticles",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "Lava" and var.disaster.obj == true then
        workspace["Structure"]["Lava"]:Destroy()
      elseif event.Name == "MeteorFolder" and var.disaster.obj == true then
        getChild("MeteorFolder",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "TsunamiBouncy" and var.disaster.obj == true then
	getChild("TsunamiBouncy",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "SlimeHolder" and var.disaster.obj == true then
	getChild("SlimeHolder",function(i,v)
            v:Destroy()
        end)
      elseif event.Name == "AcidRain" and var.disaster.obj == true then
	getChild("AcidRain",function(i,v)
            v:Destroy()
        end)
      end
  end)
end
--TextChatService["TextChannels"]["RBXGeneral"]:SendAsync("Fans?")
local function onUIAdded(ux)
  ux.ChildAdded:connect(function(event)
    if event.Name == "SandStormGui" and var.disaster.annoyui == true then
        game:GetService("Players")["LocalPlayer"]["PlayerGui"]["SandStormGui"]:Destroy()
      elseif event.Name == "BlizzardGui" and var.disaster.annoyui == true then
        game:GetService("Players")["LocalPlayer"]["PlayerGui"]["BlizzardGui"]:Destroy()
      end
  end)
end

local function Repeat(R)
   R.ChildAdded:connect(function(Find)
           if Find.Name == "SurvivalTag" and var.disaster.enabled == true then
            if var.disaster.notify == true then
              lib:notify(lib:ColorFonts("⚠️ WARNING ⚠️","Red") .. lib:ColorFonts(" | ","White") .. lib:ColorFonts(Find.Value,"Red") .. lib:ColorFonts(" | " .. GetDisasterTime(),"White"),10)
	    end
            if var.disaster.log == true then
              logdis = logdis .. "\n" .. lib:ColorFonts(GetDisasterTime(),"White") .. lib:ColorFonts(" -- ","Gray") .. lib:ColorFonts(Find.Value,"Red")
              forLog:EditLabel(logdis)
	    end
	    if var.disaster.cht == true then
		TextChatService["TextChannels"]["RBXGeneral"]:SendAsync("⚠️ WARNING! ⚠️ | Current disaster is " .. Find.Value)
	   end
           end
       end)
end

lib:runtime(function()
	var.time.HOUR = math.floor((tick() % 86400) / 3600)
	var.time.MINUTE = math.floor((tick() % 3600) / 60)
	var.time.SECOND = math.floor(tick() % 60)
	var.time.AP = var.time.HOUR > 11 and 'PM' or 'AM'
end)
	
Repeat(game:GetService("Players").LocalPlayer.Character)
disasterPredict()
onEventAdded(workspace["Structure"])
instantDelete()
onUIAdded(game:GetService("Players")["LocalPlayer"]["PlayerGui"])
game:GetService("Players").LocalPlayer.CharacterAdded:connect(function(R)
       Repeat(R)
end)
