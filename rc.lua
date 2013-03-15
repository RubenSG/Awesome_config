--Archivo de configuración de Awesome
--Instalado en Arch Linux X86_64

-- Standard awesome library /
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/ruben/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "gnome-terminal"
editor = os.getenv("EDITOR") or "gedit"
editor_cmd = editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile, --1
    awful.layout.suit.tile.left, --2
    awful.layout.suit.tile.bottom, --3
    awful.layout.suit.tile.top, --4
    awful.layout.suit.fair, --5
    awful.layout.suit.fair.horizontal, --6
    awful.layout.suit.spiral, --7
    awful.layout.suit.spiral.dwindle, --8
    awful.layout.suit.max, --9
    awful.layout.suit.max.fullscreen, --10
    awful.layout.suit.magnifier, --11
    awful.layout.suit.floating --12
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
-- Defina los escritorios "tags" les pone un nombre "names" y los layouts que seria el comportamiento de los escritorios.

tags = {
  names = { "Terminal", "Editor", "Navegador", "PHP", "Imagen", "Download", "misc",
  },
  layout = {
    layouts[2], layouts[9], layouts[2], layouts[1],layouts[9], layouts[2], layouts[1],
}}
 
for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
end

-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit },
   { "Reiniciar", "systemctl reboot", beautiful.awesome_icon2 },
   { "Apagar", "systemctl poweroff", beautiful.awesome_icon1 }
}

myArchmenu = {
   { "Nautilus", "nautilus" },
   { "Thunar", "thunar"},
   { "Gedit", "gedit"},
   { "BlueFish", "bluefish-unstable"},
   { "AlsaMixer", "Eterm -e alsamixer"},
   { "Exaile", "exaile"},
   { "VLC", "vlc"},
   { "Audacious2", "audacious2"}
}

myred ={
    {"Firefox", "firefox"},
    {"chromium", "chromium-browser"},
    {"Web", "Web"},
    {"Pidgin", "Pidgin"},
    {"Thunderbird", "thunderbird"},
    {"Qbittorent", "qbittorent"},
    {"Wifite", terminal .. " sudo wifite" },
    {"Zenmap", "gksu zenmap"},
    {"wireshark", "gksu wireshark"}
}

mymainmenu = awful.menu({ items = { { "Arch linux", myArchmenu, beautiful.awesome_icon },
                                    { "Red", myred, beautiful.awesome_icon4 },
                                    { "awesome", myawesomemenu, beautiful.awesome_icon0 },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}


-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey, }, "Left", awful.tag.viewprev ),
    awful.key({ modkey, }, "Right", awful.tag.viewnext ),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore),

    awful.key({ modkey, }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx( 1) end),
    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1) end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey, }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey, }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift" }, "q", awesome.quit),

    awful.key({ modkey, }, "l", function () awful.tag.incmwfact( 0.05) end),
    awful.key({ modkey, }, "h", function () awful.tag.incmwfact(-0.05) end),
    awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster( 1) end),
    awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1) end),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1) end),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1) end),
    awful.key({ modkey, }, "space", function () awful.layout.inc(layouts, 1) end),
    awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey, }, "f", function (c) c.fullscreen = not c.fullscreen end),
    awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey, }, "o", awful.client.movetoscreen ),
    awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end),
    awful.key({ modkey, }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey, }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
   
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { instance = "plugin-container" },
     properties = { floating = true } },

    --{{{{Terminales en el escritorio 1 Terminal.
    { rule = { class = "gnome-terminal" },
      properties = {tag = tags[1][1] } },
    { rule = { class = "terminal" },
      properties = {tag = tags[1][1] } },
    { rule = { class = "xterm" },
      properties = {tag = tags[1][1] } },
    { rule = { class = "terminator" },
      properties = {tag = tags[1][1] } },
    --}}}}
    --{{{{ Editor de textos libreoffice escritorio 2 Editor.
    { rule = { class = "VCLSalFrame" },
      properties = {tag = tags[1][2] } },
    { rule = { class = "libreoffice-startcenter", name = "LibreOffice" },
      properties = {tag = tags[1][2] } },
    { rule = { class = "libreoffice-writer", name = "LibreOffice Writer" },
      properties = {tag = tags[1][2] } },
    { rule = { class = "libreoffice-calc", name = "LibreOffice Calc" },
      properties = {tag = tags[1][2] } },
    { rule = { class = "libreoffice-impress", name = "LibreOffice Impress" },
      properties = {tag = tags[1][2] } },
    { rule = { class = "Evince" },
      properties = {tag = tags[1][2] } },
      --}}}}
    --{{{{ Navegadores de internet y correo web escritorio 3 Navegador.
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][3] } },
    --}}}}
    --{{{{ Editores de programación en el escrtirio 4 PHP.
    { rule = { class = "sublime-text" },
      properties = {tag = tags[1][4] } },
    { rule = { class = "gedit" },
      properties = {tag = tags[1][4] } },
    --}}}}
    --{{{{ Editores de imagenes escritorio 5 imagen.
    { rule = { class = "gimp-2.8" },
      properties = {tag =tags[1][5] } },
    { rule = { name = "Programa de manipulación de imágenes de GNU" },
      properties = {tag =tags[1][5] } },
    { rule = { class = "hp-toolbox" },
      properties = { floating = true, tag = tags[1][5] } },
    { rule = { class = "xsane" },
      properties = { floating = true, tag = tags[1][5] } },
    --}}}}
    --{{{{ Programas de descarga escritorio 6 "Download"
    { rule = { class = "Firefox", name = "DownThemAll" },
      properties = {tag = tags[1][6] } },
    { rule = { class = "Firefox", name = "Download" },
      properties = {tag = tags[1][6] } },
    { rule = { class = "Firefox", name = "Descarga" },
      properties = {tag = tags[1][6] } },
    { rule = { class = "jdownloader", name = "JDownloader" },
      properties = {tag = tags[1][6] } },
    { rule = { class = "qbittorrent" },
      properties = {tag = tags[1][6] } },
    --}}}}
    --{{{{ Reproductores multimedia en el escritorio 7 misc.
    { rule = { class = "MPlayer" },
      properties = { floating = true, tag = tags[1][7] } },
    { rule = { class = "vlc" },
      properties = { floating = true, tag = tags[1][7] } },
    { rule = { class = "Nautilus" },
      properties = {tag = tags[1][7] } },
    { rule = { class = "Thunar" },
      properties = {tag = tags[1][7] } },
    --}}}}


    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    -- properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


--{{{ Programas al inicio.
--No ejecuta dos veces los programas con el mismo nombre

 function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("conky") --Monitorizar el Systema
run_once("wicd-gtk") --administrador de Redes
run_once("parcellite") --Portapapeles Copy/Paste
run_once("dropboxd") --Sincronización de carpetas
run_once("gnome-sound-applet") --Sonido
run_once("sytem-config-printer-applet") --Impresora
run_once("udisksvm") --Automonta usb

-- Otra manera de arrancar programas al inicio de Awesome
--awful.util.spawn_with_shell("conky")
--awful.util.spawn_with_shell("gnome-sound-applet")
--awful.util.spawn_with_shell("sytem-config-printer-applet")
--awful.util.spawn_with_shell("parcellite")
--awful.util.spawn_with_shell("dropboxd")
--awful.util.spawn_with_shell("wicd-gtk")

--}}}
