local util = {}

function util.readFile(path)
    local file = io.open(path, "r") -- r read mode and b binary mode
    if not file then 
        hs.alert.show("File " .. path .. " not found")
        return nil
    end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function util.atHome()
    return hs.fnutils.contains(home_networks, hs.wifi.currentNetwork())
end

function util.whatsPlaying()
    -- HUD info
    local hud = os.date("%H:%M | %Y-%m-%d | %a")

    if util.atHome() then
        hs.http.asyncGet(sonos_api_url .. "/zones", nil, function(status, data, headers)
            local on_sonos = ""
            if status == 200 then
                local json_data = hs.json.decode(data)
                for k, zone in pairs(json_data) do 
                    if zone.coordinator.state.playbackState == "PLAYING" and zone.coordinator.state.currentTrack.type ~= "line_in" then
                        on_sonos = on_sonos .. zone.coordinator.roomName .. " playing: " .. zone.coordinator.state.currentTrack.title .. " by " .. zone.coordinator.state.currentTrack.artist
                        if next(json_data, k) ~= nil then
                            on_sonos = on_sonos .. "\n"  
                        end
                    end
                end
            end

            if on_sonos ~= "" then
                hs.alert.show(hud .. "\n" .. on_sonos, 4)
            end
        end)
    end

    local on_spotify = ""
    if hs.spotify.isPlaying() then
        on_spotify = "\n" .. "This machine playing: " .. hs.spotify.getCurrentTrack() .. " by " .. hs.spotify.getCurrentArtist()
    end

    hs.alert.show(hud .. on_spotify, 4)
end

return util
