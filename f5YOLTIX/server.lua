ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('YOL:billing', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)
local staff = {}




TriggerEvent('es:addGroupCommand', 'jail', 'mod', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil and tonumber(args[2]) then
		TriggerEvent('esx_jailer:sendToJail', tonumber(args[1]), tonumber(args[2] * 60))
       

	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'ID de joueur invalide ou temps de prison !' } } )
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "Mettre un joueur en prison", params = {{name = "id", help = "id de la personne"}, {name = "time", help = "temps de prison en minutes"}}})


-- unjail command
TriggerEvent('es:addGroupCommand', 'unjail', 'admin', function(source, args, user)
	if args[1] then
		if GetPlayerName(args[1]) ~= nil then
			TriggerEvent('esx_jailer:unjailQuest', tonumber(args[1]))
            
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'ID de joueur non valide !' } } )
		end
	else
		TriggerEvent('esx_jailer:unjailQuest', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "Sortir les gens de prison", params = {{name = "id", help = "id de la personne"}}})

RegisterServerEvent('esx_jailer:sendToJail')
AddEventHandler('esx_jailer:sendToJail', function(target, jailTime)
	local identifier = GetPlayerIdentifiers(target)[1]

	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		else
			MySQL.Async.execute("INSERT INTO jail (identifier,jail_time) VALUES (@identifier,@jail_time)", {['@identifier'] = identifier, ['@jail_time'] = jailTime})
		end
	end)
	
	TriggerClientEvent('esx:showAdvancedNotification', target, 'PRISON', '~r~'..GetPlayerName(target)..'', 'est maintenant en ~b~prison ~s~pour ~n~[ ~u~'..ESX.Round(jailTime / 60)..' ~s~] minutes', 'CHAR_GANGAPP', 0)

	TriggerClientEvent('esx_policejob:unrestrain', target)
	TriggerClientEvent('esx_jailer:jail', target, jailTime)
end)

RegisterServerEvent('esx_jailer:checkJail')
AddEventHandler('esx_jailer:checkJail', function()
	local player = source 
	local identifier = GetPlayerIdentifiers(player)[1] 
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then

			TriggerClientEvent('esx_jailer:jail', player, tonumber(result[1].jail_time))
		end
	end)
end)

RegisterServerEvent('esx_jailer:unjailQuest')
AddEventHandler('esx_jailer:unjailQuest', function(source)
	if source ~= nil then
		unjail(source)
	end
end)

RegisterServerEvent('esx_jailer:unjailTime')
AddEventHandler('esx_jailer:unjailTime', function()
	unjail(source)
end)

RegisterServerEvent('esx_jailer:updateRemaining')
AddEventHandler('esx_jailer:updateRemaining', function(jailTime)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		end
	end)
end)

function unjail(target)
	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute('DELETE from jail WHERE identifier = @id', {['@id'] = identifier})
		end
	end)

    TriggerClientEvent('esx:showAdvancedNotification', target, 'PRISON', '~u~'..GetPlayerName(target)..'', ' est libéré de prison!', 'CHAR_GANGAPP', 0)

	TriggerClientEvent('esx_jailer:unjail', target)
end


RegisterServerEvent('job:set')
AddEventHandler('job:set', function(job, grade)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob(job, 0)	
end)

RegisterServerEvent('checkadmin')
AddEventHandler('checkadmin', function()
	local id = source
	if isAdmin(id) then
		TriggerClientEvent("setgroup", source)
	end
end)

RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local namme = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Twitter', '~b~@'..namme, ''..msg..'', 'CHAR_STRETCH', 0)

        end
        TwitterLogs(LogsBlue, "Twitter", ""..namme.." | a twitter le message : "..msg)
    end
end, false)



RegisterNetEvent("YOL:tppc")
AddEventHandler("YOL:tppc", function(coords)
    local source = source

    TriggerClientEvent("YOL:setCoords",  vector3(215.76, -810.12, 30.73))
    TriggerClientEvent("esx:showNotification", source, "~g~Téléportation effectuée")
end)


RegisterServerEvent("YOL:Jail")
AddEventHandler("YOL:Jail", function(id, time)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        TriggerEvent('esx_jailer:sendToJail', tonumber(id), tonumber(time * 60))
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)

RegisterServerEvent("YOL:UnJail")
AddEventHandler("YOL:UnJail", function(id, time)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        
        TriggerEvent("esx_jailer:unjailQuest", id)
    else
        TriggerEvent("BanSql:ICheatServer", source, "CHEAT")
    end
end)



TwitterWebHook = "https://discord.com/api/webhooks/939600612440563745/XrHdiCBxNjx0Q_Hf_47oIcB_QJEElMCvyEpb2Z9RVguCWgCY3hbRxuX_UyxJ3C28dY_P"
TwitterName = "Logs Twitter"
TwitterLogo = "https://upload.wikimedia.org/wikipedia/fr/thumb/c/c8/Twitter_Bird.svg/1200px-Twitter_Bird.svg.png" 
LogsBlue = 3447003

function TwitterLogs(Color, Title, Description)
	local Content = {
			{
				["color"] = Color,
				["title"] = Title,
				["description"] = Description,
				["footer"] = {
					["text"] = TwitterName,
					["icon_url"] = TwitterLogo,
				},
			}
		}
	PerformHttpRequest(TwitterWebHook, function(err, text, headers) end, 'POST', json.encode({username = TwitterName, embeds = Content}), { ['Content-Type'] = 'application/json' })
end 




RegisterCommand('ano', function(source, args, rawCommand)
	local src = source
	local msg = rawCommand:sub(5)
	local args = msg
	if player ~= false then
		local namme = GetPlayerName(source)
		local xPlayers	= ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Anonyme', 'Message Anonyme', ''..msg..'', 'CHAR_ARTHUR', 0)
		end
		AnoLogs(LogsBlue, "Anonyme", ""..namme.." | a envoyer le message : "..msg)
	end
end, false)



AnoWebHook = "https://discord.com/api/webhooks/939600612440563745/XrHdiCBxNjx0Q_Hf_47oIcB_QJEElMCvyEpb2Z9RVguCWgCY3hbRxuX_UyxJ3C28dY_P"
AnoName = "Logs Ano"
AnoLogo = "https://cdn.discordapp.com/attachments/921760342130954271/921766000263839814/image.jpg" 
LogsBlue = 3447003

function AnoLogs(Color, Title, Description)
	local Content = {
			{
				["color"] = Color,
				["title"] = Title,
				["description"] = Description,
				["footer"] = {
					["text"] = AnoName,
					["icon_url"] = AnoLogo,
				},
			}
		}
	PerformHttpRequest(AnoWebHook, function(err, text, headers) end, 'POST', json.encode({username = AnoName, embeds = Content}), { ['Content-Type'] = 'application/json' })
end 












local returnCache = {}

-- this is to get players from a string
-- more info can be found at the original gist for this function:
-- https://gist.github.com/Nexxed/e3041137da591a7a791a6db555fcd1f3
local function SearchPlayers(search)
    local ret = {}

    for _, player in ipairs(GetPlayers()) do
        if (player ~= nil) then
            local player_name = GetPlayerName(player)

            if(string.sub(search, 1, 1) == "#") then
                local searchId = string.sub(search, 2)
                if (player == searchId) then
                    table.insert(ret, player)
                    break
                end
            elseif (string.match(player_name:lower(), search:lower())) then
                table.insert(ret, tonumber(player))
            end
        end
    end

    return ret
end

-- this is to validate search results
local ValidateSearch = function(source, results, argnum)
    -- if the number of results is 1, return true indicating a valid search
    -- otherwise, if there is more than one player or no players at all, return
    -- false and let the player who ran the command know about the mistake
    if(#results == 1) then
        return true
    elseif(#results == 0) then
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 104, 104},
            multiline = true,
            args = { "Teleport", string.format("No players were found with this search term. (arg=%s)", argnum == 1 and "player" or "target") }
        })

        return false
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 255, 104},
            multiline = true,
            args = { "Teleport", string.format("Too many players were found, please refine your search term. (arg=%s)", argnum == 1 and "player" or "target") }
        })

        return false
    end
end

-- /return command - requires the command.return ace permission
RegisterCommand("return", function(source, args)
    if(#args == 1) then
        -- search for the player name or id parsed to the command
        local results = SearchPlayers(args[1])

        -- check if a player is actually returned
        if(ValidateSearch(source, results)) then
            -- get the player and their position before they got teleported
            local player = results[1]
            local coords = returnCache[player]

            if(coords ~= nil) then
                -- update the return cache to their current position before being returned to their previous one
                returnCache[player] = GetEntityCoords(GetPlayerPed(player))

                -- tell the player to teleport to those coordinates
                TriggerClientEvent("_teleport:setCoords", player, coords)

                -- chat stuff
                TriggerClientEvent("chat:addMessage", source, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("You returned ^2%s ^7to their previous position", GetPlayerName(player)) }
                })
                TriggerClientEvent("chat:addMessage", player, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("^1%s ^7has returned you to your previous position", GetPlayerName(source)) }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    color = {255, 104, 104},
                    multiline = true,
                    args = { "Teleport", string.format("^2%s ^7doesn't have a return position because they've never been teleported before", GetPlayerName(player)) }
                })
            end
        end
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 104, 104},
            multiline = true,
            args = { "Teleport", "Usage: ^2/return <player>" }
        })
    end
end, true)

-- Force teleport command - requires the command.tp ace permission
RegisterCommand("tp", function(source, args)
    -- if theres only one arg, then teleport the player running the command
    -- to the specified player if valid. otherwise, if there's two, then use different logic
    -- to teleport the player to the target player
    if(#args == 1) then
        local results = SearchPlayers(args[1])

        -- check if the search results are good
        if(ValidateSearch(source, results)) then
            -- get the player and their current coordinates
            local player = results[1]

            -- check if the target player is the player running the command, if so, reject it
            if(player ~= source) then
                local coords = GetEntityCoords(GetPlayerPed(player))

                -- store the current position for the player running the command for use later-on via /return
                returnCache[source] = GetEntityCoords(GetPlayerPed(source))

                -- tell the player who ran the command to teleport to the coordinates of the specified player
                TriggerClientEvent("_teleport:setCoords", source, coords)

                -- chat stuff
                TriggerClientEvent("chat:addMessage", source, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("You teleported to ^2%s", GetPlayerName(player)) }
                })
                TriggerClientEvent("chat:addMessage", player, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", string.format("^1%s ^7has teleported to you", GetPlayerName(source)) }
                })
            else
                -- lol
                TriggerClientEvent("chat:addMessage", source, {
                    color = {104, 255, 104},
                    multiline = true,
                    args = { "Teleport", "You can't teleport to yourself, idiot!" }
                })
            end
        end
    elseif(#args == 2) then
        -- find the player we'll be teleporting to the target
        local player_results = SearchPlayers(args[1])

        if(ValidateSearch(source, player_results)) then
            -- find the player we'll be teleporting the other player to
            local target_results = SearchPlayers(args[2])

            if(ValidateSearch(source, target_results)) then
                -- get the player and the target, as well as the target coords
                local player = player_results[1]
                local target = target_results[1]

                -- simple check to prevent pointless requests where the player is the target, lol
                if(player ~= target) then
                    local target_coords = GetEntityCoords(GetPlayerPed(target))

                    -- update the return cache for the player we'll be teleporting so they can be /return'd
                    returnCache[player] = GetEntityCoords(GetPlayerPed(player))

                    -- tell the player to teleport to the target
                    TriggerClientEvent("_teleport:setCoords", player, target_coords)

                    -- chat stuff
                    TriggerClientEvent("chat:addMessage", source, {
                        color = {104, 255, 104},
                        multiline = true,
                        args = { "Teleport", string.format("You teleported ^2%s ^7to ^3%s^7", GetPlayerName(player), GetPlayerName(target)) }
                    })
                    TriggerClientEvent("chat:addMessage", player, {
                        color = {104, 255, 104},
                        multiline = true,
                        args = { "Teleport", string.format("^1%s ^7has teleported you to ^2%s", GetPlayerName(source), GetPlayerName(target)) }
                    })

                    -- if the target isn't the source who ran this command, let them know about the teleport
                    if(target ~= source) then
                        print(target, source)
                        TriggerClientEvent("chat:addMessage", target, {
                            color = {104, 255, 104},
                            multiline = true,
                            args = { "Teleport", string.format("^1%s ^7has teleported ^2%s ^7to you", GetPlayerName(source), GetPlayerName(player)) }
                        })
                    end
                else
                    TriggerClientEvent("chat:addMessage", source, {
                        color = {104, 255, 104},
                        multiline = true,
                        args = { "Teleport", "You can't teleport someone to themselves, idiot!" }
                    })
                end
            end
        end
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 104, 104},
            multiline = true,
            args = { "Teleport", "Usage: ^2/tp <player> [target]" }
        })
    end
end, true)