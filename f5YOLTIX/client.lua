ESX = nil


RMenu.Add('yoltix', 'main', RageUI.CreateMenu("".. GetPlayerName(PlayerId()) .. '', "Menu Personel"))

RMenu.Add('yoltix', 'inventory', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'main'), "Inventaire", "~Menu Personel"))
RMenu.Add('yoltix', 'arme', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'main'), "Vos Armes", "Menu Personel"))
RMenu.Add('yoltix', 'weaponf', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'arme'), "Arme", "Menu Personel"))
RMenu.Add('yoltix', 'inventaire', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'main'), "Inventaire", "Menu Personel"))
RMenu.Add('yoltix', 'inventairef', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'inventaire'), "Inventaire", "Menu Personel"))
RMenu.Add('yoltix', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'main'), "Portefeuille", "Menu Personel"))
RMenu.Add('yoltix', 'emploie', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'portefeuille'), "Emplois", "Menu Personel"))
RMenu.Add('yoltix', 'facture', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'portefeuille'), "Factures", "Menu Personel"))
RMenu.Add('yoltix', 'vetement', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'main'), "Vetement", "Menu Personel"))
RMenu.Add('yoltix', 'patron', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'portefeuille'), "Gestion d'entreprise", "Menu Personel "))
RMenu.Add('yoltix', 'voiture', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'main'), "Gestion Vehicule", "Menu Personel"))
RMenu.Add('yoltix', 'anim', RageUI.CreateSubMenu(RMenu:Get('yoltix','main'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'sport', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'festive', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'salut', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'trav', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'hume', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'diver', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'pegi', RageUI.CreateSubMenu(RMenu:Get('yoltix','anim'), "Animation", "Menu Personel"))
RMenu.Add('yoltix', 'divers', RageUI.CreateSubMenu(RMenu:Get('yoltix','main'), "Menu divers", "Menu Personel"))
RMenu.Add('yoltix', 'visual', RageUI.CreateSubMenu(RMenu:Get('yoltix','divers'), "Menu Visual", "Menu Personel"))
RMenu.Add('yoltix', 'sante', RageUI.CreateSubMenu(RMenu:Get('yoltix','main'), "Menu Visual", "Menu Personel"))
RMenu.Add('yoltix', 'menu', RageUI.CreateSubMenu(RMenu:Get('yoltix','main'), "Couleur Menu", "Menu Personel"))
RMenu.Add('yoltix', 'admin', RageUI.CreateSubMenu(RMenu:Get('yoltix','main'), "Admin", "Menu Personel"))
RMenu.Add('yoltix', 'resaux', RageUI.CreateSubMenu(RMenu:Get('yoltix','divers'), "Resaux", "Menu Personel"))
RMenu.Add('yoltix', 'joueurs', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'admin'), "Admin", " Menu Personel"))
RMenu.Add('yoltix', 'joueursf', RageUI.CreateSubMenu(RMenu:Get('yoltix', 'joueurs'), "Admin", "Menu Personel "))

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'patron' and 'society_' .. ESX.PlayerData.job.name == society then
		societymoney = ESX.Math.GroupDigits(money)
	end
end)

function RefreshMoney()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney = ESX.Math.GroupDigits(money)
		end, ESX.PlayerData.job.name)
	end
end

function ShowAboveRadarMessage(msg, flash, saveToBrief, hudColorIndex)
    if saveToBrief == nil then saveToBrief = true end
    AddTextEntry('notif', msg)
    BeginTextCommandThefeedPost('notif')
    if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
    EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

RegisterNetEvent("YOL:setCoords")
AddEventHandler("YOL:setCoords", function(coords)
    SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
end)


local function AddLongString(txt)
    for i = 100, string.len(txt), 99 do
        local sub = string.sub(txt, i, i + 99)
        AddTextComponentSubstringPlayerName(sub)
    end
end

---@class Visual
Visual = Visual or {};

local function AddLongString(txt)
    for i = 100, string.len(txt), 99 do
        local sub = string.sub(txt, i, i + 99)
        AddTextComponentSubstringPlayerName(sub)
    end
end

function Visual.Popup()

end

function Visual.Radar()

end

function Visual.Subtitle(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time and math.ceil(time) or 0, true)
end

function Visual.FloatingHelpText(text, sound, loop)
    BeginTextCommandDisplayHelp("jamyfafi")
    AddTextComponentSubstringPlayerName(text)
    if string.len(text) > 99 then
        AddLongString(text)
    end
    EndTextCommandDisplayHelp(0, loop or 0, sound or true, -1)
end

function Visual.Prompt(text, spinner)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandBusyspinnerOn(spinner or 1)
end

function Visual.PromptDuration(duration, text, spinner)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        Visual.Prompt(text, spinner)
        Citizen.Wait(duration)
        if (BusyspinnerIsOn()) then
            BusyspinnerOff();
        end
    end)
end


---@class YOL
YOL = {} or {};

---@class SelfPlayer Administrator current settings
YOL.SelfPlayer = {
    ped = 0,
    isStaffEnabled = false,
    isClipping = false,
    isGamerTagEnabled = false,
    isReportEnabled = true,
    isInvisible = false,
    isCarParticleEnabled = false,
    isSteve = false,
    isDelgunEnabled = false,
};

YOL.SelectedPlayer = {};

YOL.Menus = {} or {};

YOL.Helper = {} or {}

---@class Players
YOL.Players = {} or {} --- Players lists
---
YOL.PlayersStaff = {} or {} --- Players Staff

YOL.AllReport = {} or {} --- Players Staff


RegisterNetEvent("_teleport:setCoords")
AddEventHandler("_teleport:setCoords", function(coords)
    local ped = PlayerPedId()
    SetPedCoordsKeepVehicle(ped, coords.x, coords.y, coords.z)
end)


local NoClip = {
    Camera = nil,
    Speed = 1.0
}

local ServersIdSession = {}

Citizen.CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(GetActivePlayers()) do
            local found = false
            for _,j in pairs(ServersIdSession) do
                if GetPlayerServerId(v) == j then
                    found = true
                end
            end
            if not found then
                table.insert(ServersIdSession, GetPlayerServerId(v))
            end
        end
    end
end)





function CheckQuantity(number)
  number = tonumber(number)

  if type(number) == 'number' then
    number = ESX.Math.Round(number)

    if number > 0 then
      return true, number
    end
  end

  return false, number
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
  
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
      Citizen.Wait(0)
    end
  
    if UpdateOnscreenKeyboard() ~= 2 then
      local result = GetOnscreenKeyboardResult()
      Citizen.Wait(500)
      return result
    else
      Citizen.Wait(500)
      return nil
    end
  end

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
	  ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local Xperso = {
    ItemSelected = {},
    ItemSelected2 = {},
}

RegisterNetEvent('setgroup')
AddEventHandler('setgroup', function()
    group = true
end)    


RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i=1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

local selectedColor = 1
local cVarLongC = { "~r~", "~b~", "~g~", "~y~", "~p~", "~o~", "~r~", "~b~", "~g~", "~y~", "~p~", "~o~" }
local cVarLong = function()
    return cVarLongC[selectedColor]
end

Citizen.CreateThread(function()
    while true do
        Wait(325)
        selectedColor = selectedColor + 1
        if selectedColor > #cVarLongC then
            selectedColor = 1
        end
    end
end)


local selectedColorE = 1
local cVarLongCE = { "~r~", "~w~", "~r~", "~w~", "~r~", "~w~" }
local cVarLongE = function()
    return cVarLongCE[selectedColorE]
end

local Freeze = false


RegisterNetEvent("admin:Freeze")
AddEventHandler("admin:Freeze",function()

    FreezeEntityPosition(GetPlayerPed(-1), not Freeze)
    Freeze = not Freeze
end)


Citizen.CreateThread(function()
    while true do
        Wait(100)
        selectedColorE = selectedColorE + 1
        if selectedColorE > #cVarLongCE then
            selectedColorE = 1
        end
    end
end)


RegisterNetEvent('YOL:Weapon_addAmmoToPedC')
AddEventHandler('YOL:Weapon_addAmmoToPedC', function(value, quantity)
  local weaponHash = GetHashKey(value)

    if HasPedGotWeapon(PlayerPed, weaponHash, false) and value ~= 'WEAPON_UNARMED' then
        AddAmmoToPed(PlayerPed, value, quantity)
    end
end)

local interieure = true
local rouge = false
local vert = false
local orange = false
local bleu = false


menu = {
    ItemSelected = {},
    ItemSelected2 = {},
    WeaponData = {},
    Menu = false,
    Ped = PlayerPedId(),
    bank = nil,
    AdemoFaim = 0,
    AdemoSoif= 0,
    sale = nil,
    map = true,
    billing = {},
    visual = false,
    visual2 = false,
    visual3 = false,
    visual5 = false,
    visual6 = false,
    visual7 = false,
    visual8 = false,
    list2 = 1,
    Filtres = {'normal', 'améliorees', 'amplifiees', 'noir/blanc'},
}
local Index = {
    List = 1,
    List1 = 1,
    List2 = 1,
    List3 = 1,
    List4 = 1,
    List5 = 1,
    List6 = 1,
    List7 = 1,
    List8 = 1,
    Checked = false,
    Checked1 = false,
}

menu.V = {
    VehPed = GetVehiclePedIsIn(menu.Ped, false),
    Get = GetVehiclePedIsUsing(menu.Ped),
    agauche = false,
    argauche = false,
    adroite = false,
    ardroite = false,
    capot = false,
    test = false
}

YOL = {} or {};

YOL.SelfPlayer = {
    ped = 0,
    isStaffEnabled = false,
    isClipping = false,
    isGamerTagEnabled = false,
    isReportEnabled = true,
    isInvisible = false,
    isCarParticleEnabled = false,
    isSteve = false,
    isDelgunEnabled = false,
};

YOL.Helper = {} or {}


function YOL.Helper:onStaffMode(status)
    if (status) then
        YOL.PlayersStaff = YOL.Helper:OnGetStaffPlayers()
    else
        if (YOL.SelfPlayer.isClipping) then
            YOL.Helper:onToggleNoClip(false)
        end
        if (YOL.SelfPlayer.isInvisible) then
            YOL.SelfPlayer.isInvisible = false;
            SetEntityVisible(YOL.SelfPlayer.ped, true, false)
        end
    end
end

function YOL.Helper:OnGetStaffPlayers()
    local clientPlayers = false;
    ESX.TriggerServerCallback('YOL:retrieveStaffPlayers', function(players)
        clientPlayers = players
    end)
    while not clientPlayers do
        Citizen.Wait(0)
    end
    return clientPlayers
end





local array = {
    "Item",
    "Armes"
}

local arrayIndex = 1

local bol = true
local AllMenuToChange = nil
local menuColor = {66, 173, 245}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['yoltix']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('yoltix', v):SetRectangleBanner(menuColor[1], menuColor[2], menuColor[3], 255)
        end
    end)
end

RegisterNUICallback(
    "DropItem",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end

        Wait(500)
        loadPlayerInventory()

        cb("ok")
    end
)

Citizen.CreateThread(function()
    YOL.SelectedPlayer = {}
    plyPed = PlayerPedId()
    RegisterKeyMapping('anima', "Stopper l'animation", 'keyboard', 'X')

    RegisterCommand("anima", function()
        ClearPedTasks(plyPed)
    end)
    TriggerEvent('esx_status:getStatus', 'hunger', function(status)
        menu.AdemoFaim = status.val/1000000*100

    end)
    TriggerEvent('esx_status:getStatus', 'thirst', function(status)
        menu.AdemoSoif = status.val/1000000*100

    end)
    while ESX == nil do
        
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(500)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(500)
    end

    RefreshMoney()

    menu.WeaponData = ESX.GetWeaponList()

	for i = 1, #menu.WeaponData, 1 do
		if menu.WeaponData[i].name == 'WEAPON_UNARMED' then
			menu.WeaponData[i] = nil
		else
			menu.WeaponData[i].hash = GetHashKey(menu.WeaponData[i].name)
		end
    end
    while true do

        local att = 500
        RageUI.IsVisible(RMenu:Get('yoltix', 'main'), true, true, true, function()
            att = 1
            AllPlayers = {}
            for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)
                table.insert(AllPlayers, player)            end

            RageUI.Separator("~g~Joueurs en ville : ~b~"..#AllPlayers.. "")            
            RageUI.Separator("~g~Votre ID : ~b~"..GetPlayerServerId(PlayerId()))
            RageUI.ButtonWithStyle("Sac a dos", "Votre Inventaire", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix', 'inventaire'))


            RageUI.ButtonWithStyle("Portefeuille", "Votre Porte-Money", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix', 'portefeuille'))

            RageUI.ButtonWithStyle("Menu Vetement", "Gestion Vetement", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix', 'vetement'))

            RageUI.ButtonWithStyle("Animation", "Animation", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix', 'anim'))

            RageUI.ButtonWithStyle("Divers", "Paramettre du menu", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix', 'divers'))           

            RageUI.ButtonWithStyle("Sante", "Menu Santer", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix', 'sante'))

            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                RageUI.ButtonWithStyle("Gestion Vehicules", "Gestion Vehicules", {RightLabel = "→→→"},true, function()
                end, RMenu:Get('yoltix', 'voiture'))
            end
            if group == superadmin or group == admin or group == mod then

                RageUI.ButtonWithStyle("Administration", "Menu Admin", {RightLabel = "→→→"},true, function()
                end, RMenu:Get('yoltix', 'admin'))

            end

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'sante'), true, true, true, function()
            att = 1
            TriggerEvent("updateStatus",menu.AdemoFaim,menu.AdemoSoif)
            RageUI.SliderProgress("Faim", menu.AdemoFaim, 100, nil, {ProgressColor = {R = 0, G = 255, B = 124, A = 200},ProgressBackgroundColor = {R = 255, G = 255, B = 255, A = 200} }, true, function(Hovered, Active, Selected, Index)
            end)

            RageUI.SliderProgress("Soif", menu.AdemoSoif, 100, nil, {ProgressColor = {R = 0, G = 212, B = 255, A = 200},ProgressBackgroundColor = {R = 255, G = 255, B = 255, A = 200} }, true, function(Hovered, Active, Selected, Index)
            end)
             if menu.AdemoFaim < 0 or menu.AdemoSoif < 0 then
                    SetEntityHealth(GetPlayerPed(-1),0)
                end
            end,function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'menu'), true, true, true, function()
            att = 1
            local self = RMenu:Get('yoltix', 'menu')
            self.EnableMouse = false

            RageUI.Separator("~p~↓ ~s~Customise ta couleur ~p~↓", nil, {}, true, function(_, _, _)
            end)
        
            RageUI.Progress("Rouge", menuColor[1], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                menuColor[1] = Color
                ReloadColor()
            end)
        
            RageUI.Progress("Vert", menuColor[2], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                menuColor[2] = Color
                ReloadColor()
            end)
        
            RageUI.Progress("Bleu", menuColor[3], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                menuColor[3] = Color
                ReloadColor()
            end)

            RageUI.Separator("~p~↓ ~s~Si les couleur sont bug veuillez les réinitialisé ~p~↓", nil, {}, true, function(_, _, _)
            end)

            RageUI.ButtonWithStyle("Réinitialisé la couleur", nil, { RightLabel = "~w~~h~X" }, true, function(Hovered, Active, Selected)
                if Selected then
                    local couleur = "0"
                    menuColor[3] = couleur
                    menuColor[2] = couleur
                    menuColor[1] = couleur
                    SetResourceKvpInt("menuR", menuColor[1])
                    SetResourceKvpInt("menuG", menuColor[2])
                    SetResourceKvpInt("menuB", menuColor[3])
                    ShowAboveRadarMessage('Couleur Réinitialisé ')
                end
            end)
        
            RageUI.ButtonWithStyle("Sauvegarder la couleur", nil, { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                if Selected then
                    SetResourceKvpInt("menuR", menuColor[1])
                    SetResourceKvpInt("menuG", menuColor[2])
                    SetResourceKvpInt("menuB", menuColor[3])
                    ReloadColor()
                    ShowAboveRadarMessage('Couleur~r~ ' .. menuColor[1] .. ' ~g~'.. menuColor[2] .. ' ~b~' .. menuColor[3] .. ' ~w~Enregistré')
                end
            end)

            RageUI.Separator("~p~↓ ~s~Choisis ta couleur préinstallé! ~p~↓", nil, {}, true, function(_, _, _)
            end)

            RageUI.ButtonWithStyle("Couleur ~b~Bleu", nil, { RightLabel = "" }, true, function(Hovered, Active, Selected)
                if Selected then
                    local reste = "0"
                    local Bbleu = "255"
                    menuColor[3] = Bbleu
                    menuColor[2] = reste
                    menuColor[1] = reste
                    SetResourceKvpInt("menuR", menuColor[1])
                    SetResourceKvpInt("menuG", menuColor[2])
                    SetResourceKvpInt("menuB", menuColor[3])
                    ShowAboveRadarMessage('Couleur installé : ~b~Bleu')
                end
            end)

            RageUI.ButtonWithStyle("Couleur ~r~Rouge", nil, { RightLabel = "" }, true, function(Hovered, Active, Selected)
                if Selected then
                    local reste = "0"
                    local Rrouge = "255"
                    menuColor[3] = reste
                    menuColor[2] = reste
                    menuColor[1] = Rrouge
                    SetResourceKvpInt("menuR", menuColor[1])
                    SetResourceKvpInt("menuG", menuColor[2])
                    SetResourceKvpInt("menuB", menuColor[3])
                    ShowAboveRadarMessage('Couleur installé : ~r~Rouge')
                end
            end)

            RageUI.ButtonWithStyle("Couleur ~g~Vert", nil, { RightLabel = "" }, true, function(Hovered, Active, Selected)
                if Selected then
                    local reste = "0"
                    local Vvert = "255"
                    menuColor[3] = reste
                    menuColor[2] = Vvert
                    menuColor[1] = reste
                    SetResourceKvpInt("menuR", menuColor[1])
                    SetResourceKvpInt("menuG", menuColor[2])
                    SetResourceKvpInt("menuB", menuColor[3])
                    ShowAboveRadarMessage('Couleur installé : ~g~Vert')
                end
            end)

            RageUI.ButtonWithStyle("Couleur ~p~Violet", nil, { RightLabel = "" }, true, function(Hovered, Active, Selected)
                if Selected then
                    local Vbleu = "178"
                    local Vrouge = "165"
                    local Vverte = "0"
                    menuColor[3] = Vbleu
                    menuColor[2] = Vverte
                    menuColor[1] = Vrouge
                    SetResourceKvpInt("menuR", menuColor[1])
                    SetResourceKvpInt("menuG", menuColor[2])
                    SetResourceKvpInt("menuB", menuColor[3])
                    ShowAboveRadarMessage('Couleur installé : ~p~Violet')
                end
            end)
            end, function()
        end)
        RageUI.IsVisible(RMenu:Get('yoltix', 'voiture'), true, true, true, function()
            att = 1
        
            local pPed = PlayerPedId()
            local pVeh = GetVehiclePedIsUsing(pPed)
            local CZDEVodel = GetEntityModel(pVeh)
            local vName = GetDisplayNameFromVehicleModel(CZDEVodel)
            local vPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(pPed), false)
            local plyVeh = GetVehiclePedIsIn(pPed, false)

            GetSourcevehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            Vengine = GetVehicleEngineHealth(GetSourcevehicle)/10
            local Vengine2 = math.floor(Vengine)

            RageUI.Separator("~p~↓ ~s~Information Vehicule~p~↓", nil, {}, true, function(_, _, _)
            end)
        
            RageUI.ButtonWithStyle("Nom véhicule :", nil, {RightLabel = "~p~[ ~w~"..vName.. " ~p~]"}, true, function(Hovered,Active,Selected)
                if Selected then
                end
            end)

            RageUI.ButtonWithStyle("Plaque du véhicule :", nil, {RightLabel = "~p~[ ~w~"..vPlate.. "~p~ ]"}, true, function(Hovered,Active,Selected)
                if Selected then
                end
            end)

            RageUI.ButtonWithStyle("Etat du moteur :", nil, {RightLabel = "~p~[ ~w~"..Vengine2.."% ~p~]"}, true, function(Hovered,Active,Selected)
                if Selected then
                end
            end)

            RageUI.Separator("~p~↓ ~s~Action Vehicule~p~↓", nil, {}, true, function(_, _, _)
            end)

            RageUI.ButtonWithStyle("Allumer/Eteindre votre moteur", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered,Active,Selected) 
                if Selected then
                    if GetIsVehicleEngineRunning(GetSourcevehicle) then
                        SetVehicleEngineOn(GetSourcevehicle, false, false, true)
                        SetVehicleUndriveable(GetSourcevehicle, true)
                    elseif not GetIsVehicleEngineRunning(GetSourcevehicle) then
                        SetVehicleEngineOn(GetSourcevehicle, true, false, true)
                        SetVehicleUndriveable(GetSourcevehicle, false)
                    end
                end
            end)

            RageUI.List("Gestion des Porte", {"Avant Gauche", "Avant Droite", "Arrière Droite", "Arrière Gauche"},  Index.List7, nil, {}, true, {
                onListChange = function(i, item)
                    Index.List7 = i;
                end,
                onSelected = function()
                
                    if Index.List7 == 1 then
                        if not PersonalMenu.DoorState.FrontLeft then
                            PersonalMenu.DoorState.FrontLeft = true
                            SetVehicleDoorOpen(plyVeh, 0, false, false)
                        elseif PersonalMenu.DoorState.FrontLeft then
                            PersonalMenu.DoorState.FrontLeft = false
                            SetVehicleDoorShut(plyVeh, 0, false, false)
                        end
                    elseif Index.List7 == 2 then
                        if not PersonalMenu.DoorState.FrontRight then
                            PersonalMenu.DoorState.FrontRight = true
                            SetVehicleDoorOpen(plyVeh, 1, false, false)
                        elseif PersonalMenu.DoorState.FrontRight then
                            PersonalMenu.DoorState.FrontRight = false
                            SetVehicleDoorShut(plyVeh, 1, false, false)
                        end
                    elseif Index.List7 == 3 then

                            if not PersonalMenu.DoorState.BackRight then
                                PersonalMenu.DoorState.BackRight = true
                                SetVehicleDoorOpen(plyVeh, 3, false, false)
                            elseif PersonalMenu.DoorState.BackRight then
                                PersonalMenu.DoorState.BackRight = false
                                SetVehicleDoorShut(plyVeh, 3, false, false)
                        end
                    elseif Index.List7 == 4 then
                        if not PersonalMenu.DoorState.BackLeft then
                            PersonalMenu.DoorState.BackLeft = true
                            SetVehicleDoorOpen(plyVeh, 2, false, false)
                        elseif PersonalMenu.DoorState.BackLeft then
                            PersonalMenu.DoorState.BackLeft = false
                            SetVehicleDoorShut(plyVeh, 2, false, false)
                        end
                    end
                end
             })

            RageUI.List("Gestion des fenêtres", {"Avant Gauche", "Avant Droite", "Arrière Gauche", "Arrière Droite"},  Index.List8, nil, {}, true, {
                onListChange = function(i, item)
                    Index.List8 = i;
                end,
                onSelected = function()
            
                    if Index.List8 == 1 then
                        if not PersonalMenu.WindowState.FrontLeft then
                            PersonalMenu.WindowState.FrontLeft = true
                            RollUpWindow(plyVeh, 1)
                        elseif PersonalMenu.WindowState.FrontLeft then
                            PersonalMenu.WindowState.FrontLeft = false
                            RollDownWindow(plyVeh, 1)
                         end
                    elseif Index.List8 == 2 then
                        if not PersonalMenu.WindowState.FrontRight then
                            PersonalMenu.WindowState.FrontRight = true
                            RollUpWindow(plyVeh, 2)
                        elseif PersonalMenu.WindowState.FrontRight then
                            PersonalMenu.WindowState.FrontRight = false
                            RollDownWindow(plyVeh, 2)
                        end
                    elseif Index.List8 == 4 then
                        if not PersonalMenu.WindowState.BackLeft then
                            PersonalMenu.WindowState.BackLeft = true
                            RollUpWindow(plyVeh, 3)
                        elseif PersonalMenu.WindowState.BackLeft then
                            PersonalMenu.WindowState.BackLeft = false
                            RollDownWindow(plyVeh, 3)
                        end
                    elseif Index.List8 == 3 then
                        if not PersonalMenu.WindowState.BackRight then
                            PersonalMenu.WindowState.BackRight = true
                            RollUpWindow(plyVeh, 4)
                        elseif PersonalMenu.WindowState.BackRight then
                            PersonalMenu.WindowState.BackRight = false
                            RollDownWindow(plyVeh, 4)
                        end
                    end
                end
             })
            RageUI.ButtonWithStyle("Ouvrir/Fermer le capot", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered,Active,Selected) 
                if Selected then
                    if not PersonalMenu.DoorState.Hood then
                        PersonalMenu.DoorState.Hood = true
                        SetVehicleDoorOpen(plyVeh, 4, false, false)
                    elseif PersonalMenu.DoorState.Hood then
                        PersonalMenu.DoorState.Hood = false
                        SetVehicleDoorShut(plyVeh, 4, false, false)
                    end
                end
            end)
            RageUI.ButtonWithStyle("Ouvrir/Fermer le coffre", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered,Active,Selected) 
                if Selected then
                    if not PersonalMenu.DoorState.Trunk then
                        PersonalMenu.DoorState.Trunk = true
                        SetVehicleDoorOpen(plyVeh, 5, false, false)
                    elseif PersonalMenu.DoorState.Trunk then
                        PersonalMenu.DoorState.Trunk = false
                        SetVehicleDoorShut(plyVeh, 5, false, false)
                    end
                end
            end)

            end, function()
        end)

        
        RageUI.IsVisible(RMenu:Get('yoltix', 'divers'), true, true, true, function()
            att = 1
            RageUI.Checkbox("Afficher / Désactiver la map", description, menu.map,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    menu.map = Checked
                    if Checked then
                        DisplayRadar(true)
                    else
                        DisplayRadar(false)
                    end
                end
            end)

            local ragdolling = false
            RageUI.ButtonWithStyle('Dormir / Se Reveiller', description, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                if (Selected) then
                    ragdolling = not ragdolling
                    while ragdolling do
                     Wait(0)
                    local myPed = GetPlayerPed(-1)
                    SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                    ResetPedRagdollTimer(myPed)
                    AddTextEntry(GetCurrentResourceName(), ('Appuyez sur ~INPUT_JUMP~ pour vous ~b~Réveillé'))
                    DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
                    ResetPedRagdollTimer(myPed)
                    if IsControlJustPressed(0, 22) then 
                    break
                end
            end
        end
    end)
    RageUI.ButtonWithStyle('Porter/Lacher', description, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
        if (Selected) then
            TriggerEvent("porter")
    end
end)


     RageUI.ButtonWithStyle("Menu ~g~visuel", "Pour modifier votre visuel", {RightLabel = "→"}, true, function(Hovered, Active,Selected)
            if Selected then
                 end
            end, RMenu:Get('yoltix', 'visual'))
            RageUI.ButtonWithStyle("Resaux", "Resaux", {RightLabel = "→"}, true, function(Hovered, Active,Selected)
                if Selected then
                     end
                end, RMenu:Get('yoltix', 'resaux'))
            RageUI.ButtonWithStyle("Menu ~g~Couleur", "Pour modifier la couleur du menu", {RightLabel = "→"}, true, function(Hovered, Active,Selected)
                if Selected then
                     end
                end, RMenu:Get('yoltix', 'menu'))
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'visual'), true, true, true, function()
            att = 1
            RageUI.Checkbox("Vue & lumières améliorées", description, menu.visual, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual = Checked
                    if Checked then
                        SetTimecycleModifier('tunnel')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Vue & lumières améliorées ~r~2", description, menu.visual4, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual4 = Checked
                    if Checked then
                        SetTimecycleModifier('CS3_rail_tunnel')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            
            RageUI.Checkbox("Vue & lumières améliorées ~g~3", description, menu.visual9, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual9 = Checked
                    if Checked then
                        SetTimecycleModifier('MP_lowgarage')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Vue lumineux", description, menu.visual7, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual7 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_vignette_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Vue lumineux ~b~2", description, menu.visual10, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual10 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_saturation_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Couleurs amplifiées", description, menu.visual2, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual2 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_saturation')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Noir & blancs", description, menu.visual3, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual3 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_saturation_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Visual 1", description, menu.visual5, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual5 = Checked
                    if Checked then
                        SetTimecycleModifier('yell_tunnel_nodirect')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Blanc", description, menu.visual6, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual6 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_contrast_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)

            RageUI.Checkbox("Dégats", description, menu.visual8, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual8 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_vignette')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
            end,function()
        end)


        RageUI.IsVisible(RMenu:Get('yoltix', 'resaux'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Twitter", nil, {RigtLabel = "→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local twitter = KeyboardInput("Votre Twitter", 'Message Twiiter', '', 100)
                    ExecuteCommand("twt " ..twitter)
                end

            end)
            RageUI.ButtonWithStyle("Anonyme", nil, {RigtLabel = "→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local ano = KeyboardInput("Message Anonyme", 'Message Anonym', '', 100)
                    ExecuteCommand("ano " ..ano)
                end

            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'anim'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Sport", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'sport'))
            RageUI.ButtonWithStyle("Festives", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'festive'))
            RageUI.ButtonWithStyle("Salutations", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'salut'))
            RageUI.ButtonWithStyle("Travail", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'trav'))
            RageUI.ButtonWithStyle("Humeurs", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'hume'))
            RageUI.ButtonWithStyle("Divers", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'diver'))
            RageUI.ButtonWithStyle("Pegi +18", nil, {RigtLabel = "→→→"}, true, function() 
            end,  RMenu:Get('yoltix', 'pegi'))
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'sport'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Faire des pompes", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = 'amb@world_human_push_ups@male@base', 'base'

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Montrer ses muscles", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = 'amb@world_human_muscle_flex@arms_at_side@base', 'base'
                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Barre de musculation", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_MUSCLE_FREE_WEIGHTS")
                end
            end)
            RageUI.ButtonWithStyle("Faire des abdos", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@world_human_sit_ups@male@base", "base"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Faire du Yoga", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@world_human_yoga@male@base", "base_a"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'salut'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Saluer", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_hello"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Serrer la main", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_common", "givetake1_a"
                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Tchek", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    
                    local lib, anim = "mp_ped_interaction", "handshake_guy_a"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Salut bandit", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_ped_interaction", "hugs_guy_a"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Salut Militaire", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_player_int_uppersalute", "mp_player_int_salute"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'hume'), true, true, true, function()
            att = 1

            RageUI.ButtonWithStyle("Féliciter", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_CHEERING")
                end
            end)
            RageUI.ButtonWithStyle("Super", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_action", "thanks_male_06"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Toi", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_point"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Viens", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_come_here_soft"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Keskya ?", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_bring_it_on"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("A moi", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_me"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Je le savais, putain", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@am_hold_up@male", "shoplift_high"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Etre épuisé", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@world_human_jog_standing@male@idle_b", "idle_d"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Je suis dans la merde", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@world_human_bum_standing@depressed@idle_a", "idle_a"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Facepalm", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@mp_player_intcelebrationmale@face_palm", "face_palm"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Calme-toi", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_easy_now"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Qu\'est ce que j\'ai fait ?", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "oddjobs@assassinate@multi@", "react_big_variations_a"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Avoir peur", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@code_human_cower_stand@male@react_cowering", "base_right"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)

            RageUI.ButtonWithStyle("Fight ?", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@deathmatch_intros@unarmed", "intro_male_unarmed_e"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)            RageUI.ButtonWithStyle("C\'est pas Possible !", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "gestures@m@standing@casual", "gesture_damn"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)            RageUI.ButtonWithStyle("Faire un Calin", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_ped_interaction", "kisses_guy_a"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)            RageUI.ButtonWithStyle("Doigt d\'honneur", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_player_int_upperfinger", "mp_player_int_finger_01_enter"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Branleur", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_player_int_upperwank", "mp_player_int_wank_01"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Balle dans la tête", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_suicide", "pistol"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
        end, function()
        end)
        RageUI.IsVisible(RMenu:Get('yoltix', 'diver'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Boire un cafée", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_DRINKING")
                end
            end)
            RageUI.ButtonWithStyle("S\'asseoir", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Attendre contre un mur", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("world_human_leaning")
                end
            end)
            RageUI.ButtonWithStyle("Couché sur le dos", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_SUNBATHE_BACK")
                end
            end)
            RageUI.ButtonWithStyle("Couché sur le ventre", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_SUNBATHE")
                end
            end)
            RageUI.ButtonWithStyle("Nettoyer", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("world_human_maid_clean")
                end
            end)
            RageUI.ButtonWithStyle("Préparer à manger", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("PROP_HUMAN_BBQ")
                end
            end)
            RageUI.ButtonWithStyle("Position de Fouille", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@prostitutes@sexlow_veh", "low_car_bj_to_prop_female"
                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Prendre un selfie", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("world_human_tourist_mobile")
                end
            end)
            RageUI.ButtonWithStyle("Ecouter à une porte", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim ="mini@safe_cracking", "idle_base"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'pegi'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Homme se faire sucer en voiture", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "oddjobs@towing", "m_blow_job_loop"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Femme sucer en voiture", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "oddjobs@towing", "f_blow_job_loop"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Homme baiser en voiture", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@prostitutes@sexlow_veh", "low_car_sex_loop_player"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Femme baiser en voiture", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@prostitutes@sexlow_veh", "low_car_sex_loop_female"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Se gratter les couilles", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Faire du charme", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@strip_club@idles@stripper", "stripper_idle_02"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle('Pose michto', nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_PROSTITUTE_HIGH_CLASS")
                end
            end)
            RageUI.ButtonWithStyle("Montrer sa poitrine", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim ="mini@strip_club@backroom@", "stripper_b_backroom_idle_b"
                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Strip Tease 1", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Strip Tease 2", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@strip_club@private_dance@part2", "priv_dance_p2"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Strip Tease au sol", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@strip_club@private_dance@part3", "priv_dance_p3"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
        end, function()
        end)



        RageUI.IsVisible(RMenu:Get('yoltix', 'festive'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Fumer une cigarette", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_SMOKING")
                end
            end)
            RageUI.ButtonWithStyle("Jouer de la musique", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_MUSICIAN")
                end
            end)
            RageUI.ButtonWithStyle("DJ", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@mp_player_intcelebrationmale@dj", "dj"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Faire la Fête", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_PARTYING")
                end
            end)
            RageUI.ButtonWithStyle("Air Guitar", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@mp_player_intcelebrationmale@air_guitar", "air_guitar"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Air Shagging", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "anim@mp_player_intcelebrationfemale@air_shagging", "air_shagging"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Rock\'n\'roll", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_player_int_upperrock", "mp_player_int_rock"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Bourré sur place", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@world_human_bum_standing@drunk@idle_a", "idle_a"
                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Vomir en voiture", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "oddjobs@taxi@tie", "vomit_outside"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
        end, function()
        end)
        RageUI.IsVisible(RMenu:Get('yoltix', 'trav'), true, true, true, function()
            att = 1

            RageUI.ButtonWithStyle("Pêcheur", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("world_human_stand_fishing")
                end
            end)
            RageUI.ButtonWithStyle("Se rendre", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "random@arrests@busted", "idle_c"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Police : enquêter", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "amb@code_human_police_investigate@idle_b", "idle_f"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Police : parler à la radio", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "random@arrests", "generic_radio_chatter"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                end
            end)
            RageUI.ButtonWithStyle("Police : circulation", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_CAR_PARK_ATTENDANT")
                end
            end)
            RageUI.ButtonWithStyle("Police : jumelles", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_BINOCULARS")
                end
            end)
            RageUI.ButtonWithStyle("Agriculture : récolter", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("world_human_gardener_plant")
                end
            end)
            RageUI.ButtonWithStyle("Dépanneur : réparer le moteur", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@repair", "fixing_a_ped"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Médecin : observer", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("CODE_HUMAN_MEDIC_KNEEL")

                end
            end)
            RageUI.ButtonWithStyle("Taxi : parler au client", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "oddjobs@taxi@driver", "leanover_idle"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Taxi : donner la facture", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "oddjobs@taxi@cyi", "std_hand_off_ps_passenger"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Epicier : donner les courses", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mp_am_hold_up", "purchase_beerbox_shopkeeper"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)
            RageUI.ButtonWithStyle("Barman : servir un shot", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    local lib, anim = "mini@drinking", "shots_barman_b"

                    ESX.Streaming.RequestAnimDict(lib, function()
                        TaskPlayAnim(PlayerPedId(), lib, anim,  8.0, -8.0, -1, 0, 0, false, false, false)
                end)

                end
            end)

            RageUI.ButtonWithStyle("Journaliste : Prendre une photo", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_PAPARAZZI")

                end
            end)            RageUI.ButtonWithStyle("Tout : Prendre des notes", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_CLIPBOARD")

                end
            end)            RageUI.ButtonWithStyle("Tout : Coup de marteau", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_HAMMERING")

                end
            end)            RageUI.ButtonWithStyle("SDF : Faire la manche", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_BUM_FREEWAY")

                end
            end)
            RageUI.ButtonWithStyle("SDF : Faire la statue", nil, {RigtLabel = "→→→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    startScenario("WORLD_HUMAN_HUMAN_STATUE")

                end
            end)
        end, function()
        end)
        RageUI.IsVisible(RMenu:Get('yoltix', 'inventaire'), true, true, true, function()
            att = 1
            RageUI.List('Filtres', {'Items', 'Armes'}, Index.List, nil, {}, true, {
                onListChange = function(i, Item)
                    Index.List = i;
                end
            })
                if Index.List == 1 then
                    ESX.PlayerData = ESX.GetPlayerData()
                    RageUI.Separator("Inventaire")
                        for k, v in pairs(ESX.PlayerData.inventory) do
                            if v.count >= 1 then
                                RageUI.List('~r~→~s~ '..v.label..' (~b~'..v.count..'~s~)', {'~b~Utiliser~s~', '~b~Donner~s~', '~b~Jeter~s~'}, Index.List1, nil, {}, true, {
                                    onListChange = function(i, Item)
                                        Index.List1 = i;
                                    end,

                                    onSelected = function(i)                               
                                        if i == 1 then
                                            if ESX.PlayerData.usable then
                                                TriggerServerEvent('esx:useItem', ESX.PlayerData.name)
                                            else
                                                ESX.ShowNotification('l\'items n\'est pas utilisable', ESX.PlayerData.label)
                                            end                                           
                                        elseif i == 2 then           
                                            local sonner,quantity = KeyboardInput("Nombres d'items que vous voulez donner", "Nombres d'items que vous voulez donner", '', 100)
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                            local pPed = PlayerPedId()
                                            local coords = GetEntityCoords(pPed)
                                            local x,y,z = table.unpack(coords)
                                            DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
                        
                                            if sonner then
                                                if closestDistance ~= -1 and closestDistance <= 3 then
                                                    local closestPed = GetPlayerPed(closestPlayer)
                        
                                                    if IsPedOnFoot(closestPed) then
                                                            TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', v.name, quantity)
                                                        else
                                                            ESX.ShowNotification("~∑~ Nombres d'items invalid!")
                                                        end
                                                else
                                                    ESX.ShowNotification("∑ Aucun joueur ~r~Proche~n~!")
                                                    end
                                                end
                                        elseif i == 3 then
                                            if v.name then
                                                local post,quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez jeter", 'Combien voulez vous en jeter ?', '', 100))
                                                if post then
                                                    if not IsPedSittingInAnyVehicle(PlayerPed) then
                                                        TriggerServerEvent('esx:removeInventoryItem', 'item_standard', v.name, quantity)
                                                        local lib, anim = 'random@domestic', 'pickup_low'

                                                        ESX.Streaming.RequestAnimDict(lib, function()
                                                            TaskPlayAnim(PlayerPedId(), lib, anim,  2.0, 2.0, 1000, 51, 0, false, false, false)
                                                        end)
                                                    end
                                                end
                                        end
                                    end
                                end
                                })
                            end
                        end
                    end
                    if Index.List == 2 then
                        RageUI.Separator("Vos Armes")
                        ESX.PlayerData = ESX.GetPlayerData()
                        for i = 1, #menu.WeaponData, 1 do
                            if HasPedGotWeapon(menu.Ped, menu.WeaponData[i].hash, false) then
                                local ammo = GetAmmoInPedWeapon(menu.Ped, menu.WeaponData[i].hash)
                
                                    RageUI.List('(' ..ammo.. ')  ~s~' ..menu.WeaponData[i].label, {"~b~Donner des munitions~s~", "~b~Jeter l'armes~s~", "~b~Donner l'armes~s~"}, Index.List3, nil, {}, true, {
                                        onListChange = function(i, item)
                                            Index.List3 = i;
                                        end,

                                        onSelected = function(Index)

                                            if Index == 1 then
                                                local post, quantity = CheckQuantity(KeyboardInput('Nombre de munitions', 'Nombre de munitions', '', 100), '', 8)
    
                                                if post then
                                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            
                                                    if closestDistance ~= -1 and closestDistance <= 3 then
                                                        local closestPed = GetPlayerPed(closestPlayer)
                                                        local pPed = PlayerPedId()
                                                        local coords = GetEntityCoords(pPed)
                                                        local x,y,z = table.unpack(coords)
                                                        DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
                            
                                                        if IsPedOnFoot(closestPed) then
                                                            local ammo = GetAmmoInPedWeapon(menu.Ped, menu.ItemSelected.hash)
                            
                                                            if ammo > 0 then
                                                                if quantity <= ammo and quantity >= 0 then
                                                                    local finalAmmo = math.floor(ammo - quantity)
                                                                    SetPedAmmo(menu.Ped, menu.ItemSelected.name, finalAmmo)
                            
                                                                    TriggerServerEvent('YOL:Weapon_addAmmoToPedS', GetPlayerServerId(closestPlayer), menu.ItemSelected.name, quantity)
                                                                    ShowAboveRadarMessage('Vous avez donné x%s munitions à %s', quantity, GetPlayerName(closestPlayer))
                             
                                                                else
                                                                    ShowAboveRadarMessage('Vous ne possédez pas autant de munitions')
                                                                end
                                                            else
                                                                ShowAboveRadarMessage("Vous n'avez pas de munition")
                                                            end
                                                        else
                                                            ShowAboveRadarMessage('Vous ne pouvez pas donner des munitions dans un ~~r~véhicule~s~', menu.ItemSelected.label)
                                                        end
                                                    else
                                                        ShowAboveRadarMessage('Aucun joueur ~r~proche~s~ !')
                                                    end
                                                else
                                                    ShowAboveRadarMessage('Nombre de munition ~r~invalid')
                                                end
                                            elseif Index == 2 then   
                                                if IsPedOnFoot(menu.Ped) then
                                                    TriggerServerEvent('esx:removeInventoryItem', 'item_weapon', menu.ItemSelected.name)

                                                else
                                                    ShowAboveRadarMessage("~r~Impossible~s~ de jeter l'armes dans un véhicule", menu.ItemSelected.label)
                                                end

                                            elseif Index == 3 then
 

                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                                                if closestDistance ~= -1 and closestDistance <= 3 then
                                                    local closestPed = GetPlayerPed(closestPlayer)
                                                    local pPed = PlayerPedId()
                                                    local coords = GetEntityCoords(pPed)
                                                    local x,y,z = table.unpack(coords)
                                                    DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
                            
                                                    if IsPedOnFoot(closestPed) then
                                                        local ammo = GetAmmoInPedWeapon(menu.Ped, menu.ItemSelected.hash)
                                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_weapon', menu.ItemSelected.name, ammo)

                                                    else
                                                        ShowAboveRadarMessage('~r~Impossible~s~ de donner une arme dans un véhicule', menu.ItemSelected.label)
                                                    end
                                                else
                                                    ShowAboveRadarMessage('Aucun joueur ~r~proche !')
                                                end

                                        end 
                                    end

                                    })
                            end
                        end
                    end
            end)

            

            RageUI.IsVisible(RMenu:Get('yoltix', 'arme'), true, true, true, function()
                att = 1 
                RageUI.Separator("~r~↓ Vos armes : ↓")
                ESX.PlayerData = ESX.GetPlayerData()
                for i = 1, #menu.WeaponData, 1 do
                    if HasPedGotWeapon(menu.Ped, menu.WeaponData[i].hash, false) then
                        local ammo = GetAmmoInPedWeapon(menu.Ped, menu.WeaponData[i].hash)
        
                        RageUI.ButtonWithStyle('(' ..ammo.. ')  ~s~' ..menu.WeaponData[i].label, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                menu.ItemSelected = menu.WeaponData[i]
                            end
                        end,RMenu:Get('yoltix', 'weaponf'))
                    end
                end
            end)



        RageUI.IsVisible(RMenu:Get('yoltix', 'portefeuille'), true, true, true, function()
            att = 1

            RageUI.ButtonWithStyle("Metier", nil, {RightLabel = "~b~"..ESX.PlayerData.job.label .."~s~ →"}, true, function()
            end, RMenu:Get('yoltix', 'emploie'))

            RageUI.ButtonWithStyle('Mes Facture', description, {RightLabel = "→"}, true, function() 
                end, RMenu:Get('yoltix', 'facture'))

            RageUI.Separator("~r~↓ Gestion Argent : ↓")
    
                RageUI.List('Liquide | ~g~'..ESX.Math.GroupDigits(ESX.PlayerData.money.."~g~")..'$', {"Donner", "Jeter"}, Index.List1, nil, {}, true, {
                    onListChange = function(i, item)
                        Index.List1 = i;
                    end,

                    onSelected = function()
                        if Index.List1 == 1 then
                            local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez donner", "Somme d'argent que vous voulez donner", '', 1000))
                                if black then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestDistance ~= -1 and closestDistance <= 3 then
                                local closestPed = GetPlayerPed(closestPlayer)
        
                                if not IsPedSittingInAnyVehicle(closestPed) then
                                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_money', ESX.PlayerData.money, quantity)
                                    RageUI.CloseAll()
                                else
                                   ShowAboveRadarMessage(_U('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles'))
                                end
                            else
                               ShowAboveRadarMessage('Aucun joueur proche !')
                            end
                        else
                           ShowAboveRadarMessage('Somme invalid')
                        end
                        elseif Index.List1 == 2 then
                            local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez jeter", "Somme d'argent que vous voulez jeter", '', 1000))
                            if black then
                                if not IsPedSittingInAnyVehicle(PlayerPed) then
                                    TriggerServerEvent('esx:removeInventoryItem', 'item_money', ESX.PlayerData.money, quantity)
                                    --RageUI.CloseAll()
                                        else
                                           ShowAboveRadarMessage('Vous pouvez pas jeter', 'de l\'argent')
                                            end
                                        else
                                           ShowAboveRadarMessage('Somme Invalid')
                                        end
                        
                        end
                    end
                 })



            for i = 1, #ESX.PlayerData.accounts, 1 do
                if ESX.PlayerData.accounts[i].name == 'bank'  then
                    menu.bank = RageUI.ButtonWithStyle('Banque', description, {RightLabel = "~b~$"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."~s~")}, true, function(Hovered, Active, Selected) 
                        if (Selected) then 
                                end 
                            end)
                            for i = 1, #ESX.PlayerData.accounts, 1 do
                                if ESX.PlayerData.accounts[i].name == 'black_money'  then
                                    menu.sale = RageUI.List('Argent Sale | ~r~'..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."~r~")..'$', {"Donner", "Jeter"}, Index.List2, nil, {}, true, {
                                        onListChange = function(i, item)
                                            Index.List2 = i;
                                        end,
                    
                                        onSelected = function()
                                            if Index.List2 == 1 then
                                                local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez donner", "Somme d'argent que vous voulez donner", '', 1000))
                                                if black then
                                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                
                                            if closestDistance ~= -1 and closestDistance <= 3 then
                                                local closestPed = GetPlayerPed(closestPlayer)
                
                                                if not IsPedSittingInAnyVehicle(closestPed) then
                                                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                                    --RageUI.CloseAll()
                                                else
                                                ShowAboveRadarMessage(_U('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles'))
                                                end
                                            else
                                            ShowAboveRadarMessage('Aucun joueur proche !')
                                            end
                                        else
                                        ShowAboveRadarMessage('Somme invalid')
                                        end
                                            elseif Index.List2 == 2 then
                                                local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez jeter", "Somme d'argent que vous voulez jeter", '', 1000))
                                                if black then
                                                    if not IsPedSittingInAnyVehicle(PlayerPed) then
                                                        TriggerServerEvent('esx:removeInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                                    -- RageUI.CloseAll()
                                                            else
                                                            ShowAboveRadarMessage('Vous pouvez pas jeter', 'de l\'argent')
                                                                end
                                                            else
                                                            ShowAboveRadarMessage('Somme Invalid')
                                                            end
                                            
                                            end
                                        end
                                    })



        

                    
                            RageUI.Separator("~r~↓ Vos Liscense : ↓")
                            RageUI.List('Carte d\'identité', {"~b~Regarder~b~", "~b~Montrer~b~"}, Index.List4, nil, {}, true, {
                                onListChange = function(i, item)
                                    Index.List4 = i;
                                end,
        
                                onSelected = function()
                                    if Index.List4 == 1 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                                    elseif Index.List4 == 2 then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                                        else
                                            ESX.ShowNotification('Aucun joueur à proximité')
                                        end
                                    end
                                end
                             })


                             RageUI.List('Permis de conduire', {"~b~Regarder~s~", "~b~Montrer~s~"}, Index.List5, nil, {}, true, {
                                onListChange = function(i, item)
                                    Index.List5 = i;
                                end,
        
                                onSelected = function()
                                    if Index.List5 == 1 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                                    elseif Index.List5 == 2 then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                                        else
                                            ESX.ShowNotification('Aucun joueur à proximité')
                                        end
                                    end
                                end
                            })


                            RageUI.List('PPA', {"~b~Regarder~s~", "~b~Montrer~s~"}, Index.List6, nil, {}, true, {
                                onListChange = function(i, item)
                                    Index.List6 = i;
                                end,
        
                                onSelected = function()
                                    if Index.List6 == 1 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                                    elseif Index.List6 == 2 then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                                        else
                                            ESX.ShowNotification(('Aucun joueur à proximité'))
                                        end
                                    end
                                end
                            })
            
                        end
                    end
                end
            end
        end)





        RageUI.IsVisible(RMenu:Get('yoltix', 'emploie'), true, true, true, function()
            att = 1
            RageUI.ButtonWithStyle("Grade", nil, {RightLabel = "~b~"..ESX.PlayerData.job.grade_label .."~s~"}, true, function(Hovered, Active, Selected)
                if Selected then
                end
            end)


            RageUI.ButtonWithStyle("Démisionner", nil, {RightBadge = RageUI.BadgeStyle.Alert }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("job:set", "unemployed")
                end
            end)


            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then

            RageUI.ButtonWithStyle("Gestion d'entreprise", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
            end
        end, RMenu:Get('yoltix', 'patron'))
    else
        RageUI.ButtonWithStyle("Gestion d'entreprise", nil, {RightBadge = RageUI.BadgeStyle.Lock}, false, function(Hovered, Active, Selected)
                if Selected then
                    end
                end)
            end 
        end, function()
    end)

        RageUI.IsVisible(RMenu:Get('yoltix', 'facture'), true, true, true, function()
            att = 1
            ESX.TriggerServerCallback('YOL:billing', function(bills) menu.billing = bills end)

            if #menu.billing == 0 then
                RageUI.ButtonWithStyle("Aucune facture", nil, { RightLabel = "" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                end)
            end
                
            for i = 1, #menu.billing, 1 do
            RageUI.ButtonWithStyle(menu.billing[i].label, nil, {RightLabel = '[~b~$' .. ESX.Math.GroupDigits(menu.billing[i].amount.."~s~] →")}, true, function(Hovered,Active,Selected)
                if Selected then
                        ESX.TriggerServerCallback('esx_billing:payBill', function()
                        ESX.TriggerServerCallback('YOL:billing', function(bills) menu.billing = bills end)
                                end)
                            end
                        end)
                    end
              --  end)
        end, function()
        end)





        RageUI.IsVisible(RMenu:Get('yoltix', 'vetement'), true, true, true, function()
            att = 1

            RageUI.Separator("~p~↓ ~s~Vos Vètement~p~↓", nil, {}, true, function(_, _, _)
            end)
        
            local pPed = PlayerPedId()

            RageUI.ButtonWithStyle("Haut", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    setUniform("torso", pPed)
                end
            end)

            RageUI.ButtonWithStyle("Pantalon", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    setUniform("pants", pPed)
                end
            end)

            RageUI.ButtonWithStyle("Chaussure", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    setUniform("shoes", pPed)
                end
            end)

            RageUI.ButtonWithStyle("Sac", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    setUniform("bag", pPed)
                end
            end)

            RageUI.ButtonWithStyle("Gilet par balle", nil, {RightBadge = RageUI.BadgeStyle.Armour}, true, function(Hovered,Active,Selected) 
                if Selected then
                    setUniform("bproof", pPed)
                end
            end)

            RageUI.Separator('~p~↓ ~s~Vos Accessoire~p~↓')

            RageUI.ButtonWithStyle("Casque", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    Citizen.Wait(1000);
                    ClearPedTasks(PlayerPedId());
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                            TriggerEvent('skinchanger:getSkin', function(skin2)
                            if skin1.helmet_1 ~= skin2.helmet_1 then
                                TriggerEvent('skinchanger:loadClothes', skin2, {['helmet_1'] = skin1.helmet_1, ['helmet_2'] = skin1.helmet_2});
                            else
                                TriggerEvent('skinchanger:loadClothes', skin2, {['helmet_1'] = -1, ['helmet_2'] = 0});
                            end
                        end)
                    end)
                end
            end)

            RageUI.ButtonWithStyle("Masque", nil, {RightBadge = RageUI.BadgeStyle.Mask}, true, function(Hovered,Active,Selected) 
                if Selected then
                    Citizen.Wait(1000);
                    ClearPedTasks(PlayerPedId());
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                        TriggerEvent('skinchanger:getSkin', function(skin2)
                            if skin1.mask_1 ~= skin2.mask_1 then
                                TriggerEvent('skinchanger:loadClothes', skin2, {['mask_1'] = skin1.mask_1, ['mask_2'] = skin1.mask_2});
                            else
                                TriggerEvent('skinchanger:loadClothes', skin2, {['mask_1'] = 0, ['mask_2'] = 0});
                            end
                        end)
                    end)
                end
            end)

            RageUI.ButtonWithStyle("Boucle d'oreilles", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    Citizen.Wait(1000);
                    ClearPedTasks(PlayerPedId());
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                        TriggerEvent('skinchanger:getSkin', function(skin2)
                            if skin1.ears_1 ~= skin2.ears_1 then
                                TriggerEvent('skinchanger:loadClothes', skin2, {['ears_1'] = skin1.ears_1, ['ears_2'] = skin1.ears_2});
                            else
                                TriggerEvent('skinchanger:loadClothes', skin2, {['ears_1'] = -1, ['ears_2'] = 0});
                            end
                        end)
                    end)
                end
            end)

            RageUI.ButtonWithStyle("Lunette", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered,Active,Selected) 
                if Selected then
                    Citizen.Wait(1000);
                    ClearPedTasks(PlayerPedId());
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                        TriggerEvent('skinchanger:getSkin', function(skin2)
                            if skin1.glasses_1 ~= skin2.glasses_1 then
                                TriggerEvent('skinchanger:loadClothes', skin2, {['glasses_1'] = skin1.glasses_1, ['glasses_2'] = skin1.glasses_2});
                            else
                                TriggerEvent('skinchanger:loadClothes', skin2, {['glasses_1'] = 0, ['glasses_2'] = 0});
                            end
                        end)
                    end)
                end
            end)
            end, function()
        end)


        






            RageUI.IsVisible(RMenu:Get('yoltix', 'patron'), true, true, true, function()
                att = 1

                if societymoney ~= nil then
                    RageUI.Separator("[ Societé ~b~"..ESX.PlayerData.job.label.."~s~ ] - [ Argent ~g~"..societymoney.."$~s~ ]")
                end

            RageUI.ButtonWithStyle('Recruter une personne', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    if ESX.PlayerData.job.grade_name == 'boss' then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ShowAboveRadarMessage('Aucun joueur proche')
                        else
                            TriggerServerEvent('vInventory:Boss_recruterplayer', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                        end
                    else
                        ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                    end
                end
            end)
   
            RageUI.ButtonWithStyle('Virer une personne', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    if ESX.PlayerData.job.grade_name == 'boss' then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ShowAboveRadarMessage('Aucun joueur proche')
                        else
                            TriggerServerEvent('vInventory:Boss_virerplayer', GetPlayerServerId(closestPlayer))
                        end
                    else
                        ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                    end
                end
            end)
   
            RageUI.ButtonWithStyle('Promouvoir une personne', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
               if (Selected) then
                    if ESX.PlayerData.job.grade_name == 'boss' then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ShowAboveRadarMessage('Aucun joueur proche')
                        else
                            TriggerServerEvent('vInventory:Boss_promouvoirplayer', GetPlayerServerId(closestPlayer))
                    end
                    else
                        ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                    end
                end
            end)
   
            RageUI.ButtonWithStyle('Destituer une personne', nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    if ESX.PlayerData.job.grade_name == 'boss' then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
   
                        if closestPlayer == -1 or closestDistance > 3.0 then
                                ShowAboveRadarMessage('Aucun joueur proche')
                            else
                           TriggerServerEvent('vInventory:Boss_destituerplayer', GetPlayerServerId(closestPlayer))
                                end
                            else
                                ShowAboveRadarMessage('Vous n\'avez pas les ~r~droits~w~')
                            end
                        end
                    end)
                end, function()
            end)



            RageUI.IsVisible(RMenu:Get('yoltix', 'admin'), true, true, true, function()
                att = 1
                RageUI.Checkbox("Activer le mode Staff", "", InStaff, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    InStaff = Checked;
                    if Selected then
                        Visual.Subtitle("Mode Staff Active", 5000)
                        if Checked then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, {
                                ['bags_1'] = 0, ['bags_2'] = 0,
                                ['tshirt_1'] = 15, ['tshirt_2'] = 2,
                                ['torso_1'] = 178, ['torso_2'] = 9,
                                ['arms'] = 168,
                                ['pants_1'] = 77, ['pants_2'] = 9,
                                ['shoes_1'] = 55, ['shoes_2'] = 9,
                                ['mask_1'] = 0, ['mask_2'] = 0,
                                ['bproof_1'] = 0,
                                ['chain_1'] = 0,
                                ['helmet_1'] = 91, ['helmet_2'] = 9,
                            })
                            end)					
                            InStaff = true
                            StaffMod = true
                        else
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        if nombrecheck == 1 then 
                            nombrecheck = nombrecheck - 1
                            end
                            InStaff = false
                            StaffMod = false
                            
                        end
                    end



                end)
                        if InStaff then
                            AllPlayers = {}
                            for _, player in ipairs(GetActivePlayers()) do
                                local ped = GetPlayerPed(player)
                                table.insert(AllPlayers, player)            end
                
                            RageUI.Separator("~g~Joueurs en ville : ~b~"..#AllPlayers.. "")

                            RageUI.ButtonWithStyle("Liste des joueurs", "", { RightLabel = "→" },true, function()
                            end, RMenu:Get('yoltix', 'joueurs'))                          

					end
                    end,function()
                end)

				RageUI.IsVisible(RMenu:Get('yoltix', 'joueurs'), true, true, true, function()
                    att = 1
					for k,v in ipairs(ServersIdSession) do
						if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then table.remove(ServersIdSession, k) end
						RageUI.ButtonWithStyle("ID "..v.." : " ..GetPlayerName(GetPlayerFromServerId(v)), nil, {}, true, function(Hovered, Active, Selected)
							if (Selected) then
								IdSelected = v
							end
						end, RMenu:Get('yoltix', 'joueursf'))
					end
				end, function()
				end)

				RageUI.IsVisible(RMenu:Get('yoltix', 'joueursf'), true, true, true, function()
                    att = 1
					RageUI.Separator(GetPlayerName(GetPlayerFromServerId(IdSelected)))
					RageUI.ButtonWithStyle("Envoyer un message", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local msg = Keyboardput("Raison", "", 100)

							if msg ~= nil then
								msg = tostring(msg)
						
								if type(msg) == 'string' then
									TriggerServerEvent("hAdmin:Message", IdSelected, msg)
									RageUI.CloseAll()
								end
							end
							ESX.ShowNotification("Vous venez d'envoyer le message à ~b~" .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
						end
					end)

					if superadmin then
						RageUI.ButtonWithStyle("Setjob", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local job = Keyboardput("Job", "", 10)
								local grade = Keyboardput("Grade", "", 10)
								if job and grade then
									ExecuteCommand("setjob "..IdSelected.. " " ..job.. " " ..grade)
									ESX.ShowNotification("Vous venez de setjob ~g~"..job.. " " .. grade .. " " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
								else
									RageUI.CloseAll()	
								end	
							end
						end)
					end

					RageUI.ButtonWithStyle("Téléporter sur joueur", nil, {}, true, function(Hovered, Active, Selected)
						if (Selected) then
							SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(IdSelected))))
							ESX.ShowNotification('~b~Vous venez de vous Téléporter à~s~ '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
						end
					end)

					RageUI.ButtonWithStyle("Téléporter à vous", nil, {}, true, function(Hovered, Active, Selected, target)
						if (Selected) then
							ExecuteCommand("bring "..IdSelected)
							ESX.ShowNotification('~b~Vous venez de Téléporter ~s~ '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..' ~b~à vous~s~ !')
						end
					end)

					RageUI.ButtonWithStyle("Spectate", nil, {}, true, function(Hovered, Active, Selected)
						if (Selected) then
						local playerId = GetPlayerFromServerId(IdSelected)
                            SpectatePlayer(GetPlayerPed(playerId),playerId,GetPlayerName(playerId))
						end
					end)
					RageUI.Checkbox("Freeze / Defreeze", description, Frigo,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							Frigo = Checked
							if Checked then
								ESX.ShowNotification("~r~Joueur Freeze ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
								TriggerEvent("admin:Freeze", IdSelected)
							else
								ESX.ShowNotification("~r~Joueur Defreeze ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
								TriggerEvent("admin:Freeze", IdSelected)
							end
						end
					end)


					RageUI.ButtonWithStyle("Heal", nil, {}, true, function(Hovered, Active, Selected)
						if (Selected) then
							ExecuteCommand("heal "..IdSelected)
							Notify("~g~Heal de ".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .." effectué~w~")
						end
					end)

					if superadmin then
						RageUI.ButtonWithStyle("Wipe l'inventaire", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								ExecuteCommand("clearinventory "..IdSelected)
								ESX.ShowNotification("Vous venez d'enlever tout les items de ~b~".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .."~s~ !")
							end
						end)
					end

					if superadmin then
						RageUI.ButtonWithStyle("Wipe les armes", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								ExecuteCommand("clearloadout "..IdSelected)
								ESX.ShowNotification("Vous venez de enlever toutes les armes de ~b~".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .."~s~ !")
							end
						end)
					end

					RageUI.ButtonWithStyle("Give un item", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local item = Keyboardput("Item", "", 10)
							local amount = Keyboardput("Nombre", "", 10)
							if item and amount then
								ExecuteCommand("giveitem "..IdSelected.. " " ..item.. " " ..amount)
								ESX.ShowNotification("Vous venez de donner ~g~"..amount.. " " .. item .. " ~w~à " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))	
							else
								RageUI.CloseAll()	
							end			
						end
					end)


						RageUI.ButtonWithStyle("Give une arme", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local weapon = Keyboardput("WEAPON_...", "", 100)
								local ammo = Keyboardput("Munitions", "", 100)
								if weapon and ammo then
									ExecuteCommand("giveweapon "..IdSelected.. " " ..weapon.. " " ..ammo)
									ESX.ShowNotification("Vous venez de donner ~g~"..weapon.. " avec " .. ammo .. " munitions ~w~à " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
								else
									RageUI.CloseAll()	
								end
							end
						end)
						RageUI.ButtonWithStyle("Jail", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
                                TriggerServerEvent("YOL:tppc")
							end
						end)
                        

						RageUI.ButtonWithStyle("~r~Bannir", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local quelid = Keyboardput("ID", "", 100)
								local day = Keyboardput("Jours", "", 100)
								local raison = Keyboardput("Raison du kick", "", 100)
								if quelid and day and raison then
									ExecuteCommand("sqlban "..quelid.. " " ..day.. " " ..raison)
									ESX.ShowNotification("Vous venez de ban l\'ID :"..quelid.. " " ..day.. " pour la raison suivante : " ..raison)
								else
									RageUI.CloseAll()	
								end
							end
						end)

				end, function()
				end)

        
        Citizen.Wait(att)
    end
end)


PersonalMenu = {
    vehList = {
        "Avant Gauche",
        "Avant Droite",
        "Arrière Gauche",
        "Arrière Droite"
    },
    vehList2 = {
        "Avant Droite",
        "Arrière Gauche",
        "Arrière Droite",
        "Avant Gauche",
    },
    cardList = {
        "Montrer",
        "Regarder"
    },
    vehIndex = 1,
    vehIndex2 = 1,
    cardIndex = 1,
    DoorState = {
        FrontLeft = false,
        FrontRight = false,
        BackLeft = false,
        BackRight = false,
        Hood = false,
        Trunk = false
    },
    WindowState = {
        FrontLeft = false,
        FrontRight = false,
        BackLeft = false,
        BackRight = false,
    },
}

Player = {
	handsup = false,
    pointing = false,
    crouched = false,
}

function setUniform(value, plyPed)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:getSkin', function(skina)
			if value == 'torso' then
                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

				if skin.torso_1 ~= skina.torso_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
				end
			elseif value == 'pants' then
                local lib, anim = 'clothingtrousers', 'try_trousers_neutral_c'

                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

				if skin.pants_1 ~= skina.pants_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 61, ['pants_2'] = 1})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
			elseif value == 'shoes' then
                local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

				if skin.shoes_1 ~= skina.shoes_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
					end
				end
			elseif value == 'bag' then
                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

				if skin.bags_1 ~= skina.bags_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
				end
			elseif value == 'bproof' then
				DrawAnim("clothingtie")
                local lib, anim = 'clothingtie', 'try_tie_neutral_a'
                ESX.Streaming.RequestAnimDict(lib, function()
                    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                end)
                Citizen.Wait(1000)
                ClearPedTasks(PlayerPedId())

				Citizen.Wait(1000)
				Player.handsup, Player.pointing = false, false
				ClearPedTasks(plyPed)

				if skin.bproof_1 ~= skina.bproof_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
				end
			end
		end)
	end)
end

function setAccessory(accessory)
    ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
        local _accessory = (accessory):lower()

        if hasAccessory then
            TriggerEvent('skinchanger:getSkin', function(skin)
                local mAccessory = -1
                local mColor = 0

                if _accessory == 'ears' then
                    startAnimAction('mini@ears_defenders', 'takeoff_earsdefenders_idle')
                    Citizen.Wait(250)
                    ClearPedTasks(plyPed)
                elseif _accessory == 'glasses' then
                    mAccessory = 0
                    startAnimAction('clothingspecs', 'try_glasses_positive_a')
                    Citizen.Wait(1000)
                    ClearPedTasks(plyPed)
                elseif _accessory == 'helmet' then
                    startAnimAction('missfbi4', 'takeoff_mask')
                    Citizen.Wait(1000)
                    ClearPedTasks(plyPed)
                elseif _accessory == 'mask' then
                    mAccessory = 0
                    startAnimAction('missfbi4', 'takeoff_mask')
                    Citizen.Wait(850)
                    ClearPedTasks(plyPed)
                end

                if skin[_accessory .. '_1'] == mAccessory then
                    mAccessory = accessorySkin[_accessory .. '_1']
                    mColor = accessorySkin[_accessory .. '_2']
                end

                local accessorySkin = {}
                accessorySkin[_accessory .. '_1'] = mAccessory
                accessorySkin[_accessory .. '_2'] = mColor
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end)
        else
            if _accessory == 'ears' then
                ESX.ShowNotification(_U('accessories_no_ears'))
            elseif _accessory == 'glasses' then
                ESX.ShowNotification(_U('accessories_no_glasses'))
            elseif _accessory == 'helmet' then
                ESX.ShowNotification(_U('accessories_no_helmet'))
            elseif _accessory == 'mask' then
                ESX.ShowNotification(_U('accessories_no_mask'))
            end
        end
    end, accessory)
end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(plyPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end


function startAnimAction(lib, anim)
    ESX.Streaming.RequestAnimDict(lib, function()
        TaskPlayAnim(plyPed, lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
        RemoveAnimDict(lib)
    end)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end                                                    

function DrawAnim(ad)
    local ped = PlayerPedId()
    loadAnimDict(ad)
    RequestAnimDict(dict)
    TaskPlayAnim(ped, ad, "check_out_a", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "check_out_b", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "check_out_c", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "intro", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "outro", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
end


function startScenario(anim)
	TaskStartScenarioInPlace(plyPed, anim, 0, false)
end




RegisterKeyMapping('menuF5', 'Menu F5', 'keyboard', 'F5')

RegisterCommand("menuF5", function()
    RageUI.Visible(RMenu:Get('yoltix', 'main'), not RageUI.Visible(RMenu:Get('yoltix', 'main')))
end)




crouched, handsup, pointing = false, false, false

local function startPointing(plyPed)
	RequestAnimDict('anim@mp_point')

	while not HasAnimDictLoaded('anim@mp_point') do
		Citizen.Wait(10)
	end

	SetPedConfigFlag(plyPed, 36, 1)
	TaskMoveNetwork(plyPed, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
end

local function stopPointing()
	N_0xd01015c7316ae176(plyPed, 'Stop')

	if not IsPedInjured(plyPed) then
		ClearPedSecondaryTask(plyPed)
	end

	SetPedConfigFlag(plyPed, 36, 0)
	ClearPedSecondaryTask(plyPed)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisableControlAction(1, 36, true)

		if IsDisabledControlJustReleased(1, 36) and GetLastInputMethod(2) then
			local plyPed = PlayerPedId()
			if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
				crouched = not crouched
				if crouched then 
					RequestAnimSet('move_ped_crouched')
		
					while not HasAnimSetLoaded('move_ped_crouched') do
						Citizen.Wait(10)
					end
		
					SetPedMovementClipset(plyPed, 'move_ped_crouched', 0.25)
				else
					ResetPedMovementClipset(plyPed, 0)
				end
			end
		end

		if IsControlJustReleased(1, 158) and GetLastInputMethod(2) then
			local plyPed = PlayerPedId()
			if (DoesEntityExist(plyPed)) and not (IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
				if pointing then
					pointing = false
				end

				handsup = not handsup
				if handsup then
					RequestAnimDict('random@mugging3')

					while not HasAnimDictLoaded('random@mugging3') do
						Citizen.Wait(10)
					end

					TaskPlayAnim(plyPed, 'random@mugging3', 'handsup_standing_base', 8.0, -8, -1, 49, 0, 0, 0, 0)
				else
					ClearPedSecondaryTask(plyPed)
				end
			end
		end

		if IsControlJustReleased(1, 305) and GetLastInputMethod(2) then
			local plyPed = PlayerPedId()
			if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
				if handsup then
					handsup = false
				end

				pointing = not pointing
				if pointing then
					startPointing(plyPed)
				else
					stopPointing(plyPed)
				end
			end
		end

		if crouched or handsup or pointing then
			if not IsPedOnFoot(PlayerPedId()) then
				ResetPedMovementClipset(plyPed, 0)
				stopPointing()
				crouched, handsup, pointing = false, false, false
			elseif pointing then
				local ped = PlayerPedId()
				local camPitch = GetGameplayCamRelativePitch()

				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end

				camPitch = (camPitch + 70.0) / 112.0

				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)

				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end

				camHeading = (camHeading + 180.0) / 360.0
				local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
				local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))

				SetTaskPropertyFloat(ped, 'Pitch', camPitch)
				SetTaskPropertyFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
				SetTaskPropertyBool(ped, 'isBlocked', blocked)
				SetTaskPropertyBool(ped, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
			end
		end
	end
end)