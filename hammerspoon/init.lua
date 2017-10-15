local util = require "util"

--[[
    Config file example:

    {
        "combo": ["ctrl", "alt", "cmd"],
        "maker_channel_id": "...",
        "app_shortcuts": {
            "C": "Google Chrome",
            "S": "Spotify"
        }
    }
--]]
local config = hs.json.decode(util.read_file("config.json"));
--print(hs.inspect(config))

combo = config.combo
maker_channel_id = config.maker_channel_id

hs.hotkey.bind(combo, "q", function()
  hs.alert.show("Playing: " .. hs.spotify.getCurrentTrack() .. " by " .. hs.spotify.getCurrentArtist(), 3)
end)

hs.hotkey.bind(combo, 'k', function ()
    local artist = hs.spotify.getCurrentArtist()
    local track = hs.spotify.getCurrentTrack()
    local payload = { value1 = track, value2 = artist }
    local save_track_url = "https://maker.ifttt.com/trigger/spotify_save_track/with/key/" .. maker_channel_id
    local headers = { ["Content-Type"] = "application/json" }

    hs.http.asyncPost(save_track_url, hs.json.encode(payload), headers, function(status, body, headers)
        if status == 200 then hs.notify.new({title="Saved track", informativeText=track}):send() end
    end)
end)

hs.hotkey.bind(combo, '.', function ()
    hs.caffeinate.startScreensaver()
end)

-- bind configured app shortcuts
for k, v in pairs(config.app_shortcuts) do 
    hs.hotkey.bind(combo, k, function () hs.application.launchOrFocus(v) end)
end

-- reload config
hs.hotkey.bind(combo, "r", function()
  hs.reload()
  hs.notify.new({title="Hammerspoon config reloaded", informativeText="Manually via keyboard shortcut"}):send()
end)

-- Spoon stuff
hs.loadSpoon("SpoonInstall")

-- Caffeine replacement
spoon.SpoonInstall:andUse('Caffeine',
    {
        hotkeys = {
            toggle = {combo, 'z' }
        },
        start = true,
    }
)
