--  ESX Service
ESX=nil;
local a=false;
local b=false;
local c=false;
local d=false;
local e=false;


cachedData={["banks"]={}}

Citizen.CreateThread(function()
while ESX==nil do TriggerEvent("esx:getSharedObject",function(f)ESX=f end)
Citizen.Wait(0)
end;
ClearPedTasks(PlayerPedId())
end
)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded",function(g)
ESX.PlayerData=g;
ESX.TriggerServerCallback("pacific_bank_robbery:getCurrentRobbery",function(h)
if h then for i,j in pairs(h)do cachedData["banks"][i]=j["trolleys"]
    RobberyThread({["bank"]=i,["trolleys"]=j["trolleys"]})
    end 
    end 
    end)
    end)
RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob",function(k
)ESX.PlayerData["job"]=k end)
RegisterNetEvent("pacific_bank_robbery:eventHandler")
AddEventHandler("pacific_bank_robbery:eventHandler",function(l,m)if l=="start_robbery"then 
RobberyThread(m)elseif l=="alarm_police"then TriggerEvent('chatMessage',"",{255,0,0},
Config.AlertInChatMessage..m)if ESX.PlayerData["job"]and ESX.PlayerData["job"]["name"]=="police"then 
SetAudioFlag("LoadMPData",true)PlaySoundFrontend(-1,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
ESX.ShowNotification("Someone is trying to ~r~decrypt ~s~the bank lock - ~g~ "..m.." ~s~waypoint is now set.")local n=Config.Bank[m]
SetNewWaypoint(n["start"]["pos"]["x"],n["start"]["pos"]["y"])
local o=AddBlipForCoord(n["start"]["pos"])
SetBlipSprite(o,161)SetBlipScale(o,2.0)SetBlipColour(o,8)
Citizen.CreateThread(function()local p=GetGameTimer()while 
GetGameTimer()-p<60000*5 do Citizen.Wait(0)end;RemoveBlip(o)end)end else end end)
Citizen.CreateThread(function()Citizen.Wait(100)
while true do local q=500;local r=PlayerPedId()local s=GetEntityCoords(r)
for i,t in pairs(Config.Bank)do local u=GetDistanceBetweenCoords(s,t["start"]["pos"],true)if u<=5.0 then q=5;
if u<=1.0 then local v,w=not cachedData["banks"][i],cachedData["hacking"]and"~r~Hacking..."or cachedData["banks"][i]and"~r~Assault~s~ in progress . . ."or"~INPUT_CONTEXT~ Start ~r~breaking~s~ into the device."ESX.ShowHelpNotification(w)if IsControlJustPressed(0,38)then if Config.PhoneHack then TriggerEvent("mhacking:show")TriggerEvent("mhacking:start",Config.PhoneHackDifficulty,Config.PhoneHackTime,phonehack)while not hacked or not failed do Citizen.Wait(500)end;if v and hacked then TryHackingDevice(i)end;hacked=false else if v then TryHackingDevice(i)end end end end;DrawScriptMarker({["type"]=6,["pos"]=t["start"]["pos"]-
    vector3(0.0,0.0,0.985),["r"]=255,["g"]=0,["b"]=0})end end;
    Citizen.Wait(q)end end)function phonehack(x,y)if x then print('Success with '..y..'s remaining.')
    TriggerEvent('mhacking:hide')hacked=true else print('Failure')
    TriggerEvent('mhacking:hide')failed=true end end;RegisterNetEvent("pacific_bank_robbery:estefade_az_item")
    AddEventHandler("pacific_bank_robbery:estefade_az_item",function(z)thermite()end)local A=0;
    RegisterNetEvent("pacific_bank_robbery:terkidan")
    AddEventHandler("pacific_bank_robbery:terkidan",function(B,C)A=C;terkidan(B)end)
    RegisterNetEvent('pacific_bank_robbery:bazshodan')
    AddEventHandler('pacific_bank_robbery:bazshodan',
    function(D,E,F,G,H)
    local I={D,E,F}
    local J=nil;
    if G==961976194 
        then doorname='v_ilev_bk_vaultdoor'
        J=H;
        princoordsg=I;
        prinrotationg=J;
        prinDoortypeg=doorname;
        a=true end;
        if G==4072696575 
            then doorname='hei_v_ilev_bk_gate_pris'J=H;
            princoords1=I;
            prinrotation1=J;
            prinDoortype1=doorname;
            b=true end;
            if G==746855201 then doorname='hei_v_ilev_bk_gate2_pris'
                J=H;
                princoords2=I;
                prinrotation2=J;
                prinDoortype2=doorname;
                c=true end;
                if G==1655182495 then doorname='v_ilev_bk_safegate'
                    J=H;
                    princoords3=I;
                    prinrotation3=J;
                    prinDoortype3=doorname;
                    d=true end;
                    if G==2786611474 then doorname='hei_v_ilev_bk_safegate_pris'
                        J=H;
                        princoords4=I;
                        prinrotation4=J;
                        prinDoortype4=doorname;
                        e=true end;
                        Citizen.CreateThread(function()
                        while true do if a then local K,
                        L=ESX.Game.GetClosestObject(prinDoortypeg,GetEntityCoords(playerPed))
    SetEntityHeading(K,prinrotationg)end;if b then local M,L=ESX.Game.GetClosestObject(prinDoortype1,GetEntityCoords(playerPed))
    SetEntityHeading(M,prinrotation1)end;if c then local N,L=ESX.Game.GetClosestObject(prinDoortype2,GetEntityCoords(playerPed))
    SetEntityHeading(N,prinrotation2)end;if d then local O,L=ESX.Game.GetClosestObject(prinDoortype3,GetEntityCoords(playerPed))
    SetEntityHeading(O,prinrotation3)end;if e then local P,L=ESX.Game.GetClosestObject(prinDoortype4,GetEntityCoords(playerPed))
    SetEntityHeading(P,prinrotation4)end;Wait(2000)end end)end)