---------------------------
-- Awesome theme by RSG  --
---------------------------

theme = {}


--------Estilo de fuente-------------
theme.font = "Droid-sans-mono 8"
-------------------------------------


-- Color de las fuentes --------
theme.fg_normal = "#BBBBBB"
theme.fg_focus = "#78A4FF"
theme.fg_urgent = "#000000"
theme.fg_minimize = "#c8c8c8"

--Color de fondo --------------
theme.bg_normal = "#111111"
theme.bg_focus  = "#111111"
theme.bg_urgent = "#FFFFFF"
theme.bg_minimize   = "#444444AA"
theme.bg_systray = theme.bg_normal
-------------------------------

-- Borders ---------------------
--theme.border_focus  = "#ffffff"
--theme.border_marked = "#000000"
--theme.border_width  = "2"
--theme.border_panel = "#050505AA"
--theme.border_normal = "#151515AA"
--theme.border_wnormal = "#303030"
theme.border_width = "2"
theme.border_normal = "#141414"
theme.border_focus = "#93B6FF"
--------------------------------

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares

theme.taglist_squares_sel ="~/.config/awesome/themes/Ruben/icons/square_sel.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/Ruben/icons/square_unsel.png"
theme.taglist_fg_focus = "#FFFFEF"
theme.taglist_bg_focus = "#111111"
theme.taglist_bg_normal = "#111111"
--theme.tasklist_disable_icon = true

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 20
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.bg_widget = "#cc0000AA"

-- Define the image to load
theme.titlebar_close_button_normal = "~/.config/awesome/themes/Ruben/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/Ruben/icons/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/Ruben/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/Ruben/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/Ruben/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/Ruben/icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/Ruben/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/Ruben/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/Ruben/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/Ruben/icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/Ruben/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/Ruben/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/Ruben/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/Ruben/icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/Ruben/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/Ruben/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/Ruben/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/Ruben/icons/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/Imágenes/Fondos Arch/ascension.jpg"

-- You can use your own layout icons like this:
-- Layout --------------------------------------------------------------------------
theme.layout_fairv                  = "~/.config/awesome/themes/Ruben//icons/fairv.png"
theme.layout_fairh                  = "~/.config/awesome/themes/Ruben//icons/fairh.png"
theme.layout_magnifier              = "~/.config/awesome/themes/Ruben//icons/magnifier.png"
theme.layout_floating               = "~/.config/awesome/themes/Ruben//icons/floating.png"
theme.layout_max                    = "~/.config/awesome/themes/Ruben//icons/max.png"
theme.layout_fullscreen             = "~/.config/awesome/themes/Ruben//icons/fullscreen.png"
theme.layout_tile                   = "~/.config/awesome/themes/Ruben//icons/tile.png"
theme.layout_tilegaps               = "~/.config/awesome/themes/Ruben//icons/tilegaps.png"
theme.layout_tileleft               = "~/.config/awesome/themes/Ruben//icons/tileleft.png"
theme.layout_tilebottom             = "~/.config/awesome/themes/Ruben//icons/tilebottom.png"
theme.layout_tiletop                = "~/.config/awesome/themes/Ruben//icons/tiletop.png"
theme.layout_spiral                 = "~/.config/awesome/themes/Ruben//icons/spiral.png"
theme.layout_dwindle                = "~/.config/awesome/themes/Ruben//icons/dwindle.png"



------------------------------------------------------------------------------------
--Iconos personalizado

theme.awesome_icon0 = "~/.config/awesome/themes/Ruben/icons/awesome-icon-3.png"
theme.awesome_icon = "~/.config/awesome/themes/Ruben/icons/start-here-archlinux.png"
theme.awesome_icon1 = "~/.config/awesome/themes/Ruben/icons/gnome-shutdown.png"
theme.awesome_icon2 = "~/.config/awesome/themes/Ruben/icons/gnome-session-reboot.png"
theme.awesome_icon3 = "~/.config/awesome/themes/Ruben/icons/network-transmit-receive.png"
theme.awesome_down ="~/.config/awesome/themes/Ruben/icons2/dust12/down.png"

theme.widget_netdown = "~/.config/awesome/themes/Ruben/icons/net_down.png"
theme.widget_netup =  "~/.config/awesome/themes/Ruben/icons/net_up.png"
theme.widget_temp = "~/.config/awesome/themes/Ruben/icons/temp.png"
theme.widget_uptime = "~/.config/awesome/themes/Ruben/icons/ac.png"
theme.widget_cpu = "~/.config/awesome/themes/Ruben/icons/cpu.png"
theme.widget_fs = "~/.config/awesome/themes/Ruben/icons/fs.png"
theme.widget_mem = "~/.config/awesome/themes/Ruben/icons/mem.png"
theme.widget_clock = "~/.config/awesome/themes/Ruben/icons/clock.png"
theme.widget_disk = "~/.config/awesome/themes/Ruben/icons/disk.png"
theme.widget_vol = "~/.config/awesome/themes/Ruben/icons/vol.png"
theme.widget_vol_low = "~/.config/awesome/themes/Ruben/icons/vol_low.png"
theme.widget_vol_no = "~/.config/awesome/themes/Ruben/icons/vol_no.png"
theme.widget_vol_mute = "~/.config/awesome/themes/Ruben/icons/vol_mute.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
