local util = require "util"

--[[
Config file example:

{
    "combo": ["ctrl", "alt", "cmd"],
    "maker_channel_id": "...",
    "app_shortcuts": {
        "C": "Google Chrome",
        "S": "Spotify"
    },
    "home_networks": ["12345"]
}
--]]
local config = hs.json.decode(util.readFile("config.json"));
--print(hs.inspect(config))

combo = config.combo
maker_channel_id = config.maker_channel_id
sonos_api_url = config.sonos_api_url
home_networks = config.home_networks

-- Display information about music currently playing through Spotify
hs.hotkey.bind(combo, "q", function()
    util.whatsPlaying()
end)


-- Save currently playing song to My Library on Spotify
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

-- Start the screensaver
hs.hotkey.bind(combo, '.', function ()
    hs.caffeinate.startScreensaver()
end)

-- Bind configured app shortcuts
for k, v in pairs(config.app_shortcuts) do 
    hs.hotkey.bind(combo, k, function () hs.application.launchOrFocus(v) end)
end

-- Spoon stuff
hs.loadSpoon("SpoonInstall")

-- Caffeine replacement
spoon.SpoonInstall:andUse('Caffeine',
{
    hotkeys = {
        toggle = {combo, 'z' }
    },
    start = true
}
)

-- Spectacle replacement
spoon.SpoonInstall:andUse("WindowHalfsAndThirds", { hotkeys = 'default' })
spoon.SpoonInstall:andUse("WindowScreenLeftAndRight", { hotkeys = 'default' })
