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

-- Display information about music currently playing through Spotify
hs.hotkey.bind(combo, "q", function()
  hs.alert.show("Playing: " .. hs.spotify.getCurrentTrack() .. " by " .. hs.spotify.getCurrentArtist(), 3)
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

-- Quickly react to notifications
function clickNotificationButton(buttonNr)
    script = [[ 
        tell application "System Events" to tell process "Notification Center"
            try
                click button ]] .. buttonNr .. [[ of last item of windows
            end try
        end tell
    ]]

    hs.applescript(script)
end

-- To click the first button, often close
hs.hotkey.bind(combo, "-", function()
  hs.timer.doAfter(0.5, function() clickNotificationButton(1) end)
end)

-- To click the second button, often reply
hs.hotkey.bind(combo, "=", function()
  hs.timer.doAfter(0.5, function() clickNotificationButton(2) end)
end)

-- Reload config
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
