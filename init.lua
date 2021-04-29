-- configuration Hammerspoon

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", function()
  hs.application.launchOrFocus("Firefox Developer Edition")
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", function()
  hs.application.launchOrFocus("GitUp")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
  hs.application.launchOrFocus("System Preferences")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "I", function()
  hs.application.launchOrFocus("IntelliJ IDEA")
end)

