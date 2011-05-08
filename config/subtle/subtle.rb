# -*- coding: utf-8 -*-
require "socket"
require "subtle/subtlext"

# Host specific options
HOST            = Socket.gethostname.freeze
NUM_SCREENS     = HOST == "dominikh-pc" ? 2 : 1
VIEWS_ICON_ONLY = HOST == "dominikh-netbook"
HAS_VM_VIEW     = HOST != "dominikh-netbook"
BIG_PANEL       = HOST != "dominikh-netbook"
CUSTOM_BRIGHTNESS_CONTROLS = HOST == "dominikh-laptop"
VOLUME_CONTROL = case HOST
                 when "dominikh-lapop" then :fancy
                 when "dominikh-netbook" then :simple
                 else :none
                 end

# Style
PANEL_BG = "#202020"
PRI_PANEL_FG = "#ffffff"
SND_PANEL_FG = "#757575"
COLOR_THEME = "#54728e"
ICONS_ROOT = "/home/dominikh/.config/subtle/icons"
FONT = "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"

MODKEY   = "W"

# Settings
set :separator, "▞"

if BIG_PANEL
  set :padding, [1, 1, 3, 3]
  set :strut, [0, 0, 0, 16]
end

set :border,     2
set :step,       5
set :snap,       10
set :gravity,    :center
set :urgent,     false
set :resize,     true
set :font, FONT

1.upto(NUM_SCREENS) do |i|
  screen i do
    stipple false
    case HOST
    when "dominikh-netbook"
      top [:views, :separator, :title, :spacer, :separator, :tray, :sublets]
    else
      arch_logo = Subtlext::Icon.new("#{ICONS_ROOT}/arch.xpm")
      top [:views, :separator, :title, :spacer, :separator, :tray, :sublets, arch_logo]
    end
  end
end

# Colors
color :focus_fg,         PRI_PANEL_FG
color :focus_bg,          COLOR_THEME
color :focus_border,     "#303030"

color :title_fg,         PRI_PANEL_FG
color :title_bg,         PANEL_BG
color :title_border,     "#303030"

color :urgent_fg,        PRI_PANEL_FG
color :urgent_bg,        "#ff6565"
color :urgent_border,    "#303030"

color :occupied_fg,      SND_PANEL_FG
color :occupied_bg,      "#111111"
color :occupied_border,  "#303030"

color :views_fg,         SND_PANEL_FG
color :views_bg,         PANEL_BG
color :views_border,     "#303030"

color :sublets_fg,       SND_PANEL_FG
color :sublets_bg,       PANEL_BG
color :sublets_border,   "#303030"

color :stipple,        PRI_PANEL_FG
color :panel,          PANEL_BG

color :client_active,   COLOR_THEME # border around active client
color :client_inactive, PANEL_BG # border around inactive client

color :separator,       "#610000"

# Gravities
gravity :top_left,      [0, 0, 50, 50]
gravity :top_left66,    [0, 0, 50, 66]
gravity :top_left33,    [0, 0, 50, 34]
gravity :top,           [0, 0, 100, 50]
gravity :top66,         [0, 0, 100, 66]
gravity :top33,         [0, 0, 100, 34]
gravity :top_right,     [100, 0, 50, 50]
gravity :top_right66,   [100, 0, 50, 66]
gravity :top_right33,   [100, 0, 50, 34]
gravity :left,          [0, 0, 50, 100]
gravity :left66,        [0, 50, 50, 34]
gravity :left33,        [0, 50, 25, 34]
gravity :center,        [0, 0, 100, 100]
gravity :center66,      [0, 50, 100, 34]
gravity :center33,      [50, 50, 50, 34]
gravity :right,         [100, 0, 50, 100]
gravity :right66,       [100, 50, 50, 34]
gravity :right33,       [100, 50, 25, 34]
gravity :bottom_left,   [0, 100, 50, 50]
gravity :bottom_left66, [0, 100, 50, 66]
gravity :bottom_left33, [0, 100, 50, 34]
gravity :bottom,        [0, 100, 100, 50]
gravity :bottom66,      [0, 100, 100, 66]
gravity :bottom33,      [0, 100, 100, 34]
gravity :bottom_right,  [100, 100, 50, 50]
gravity :bottom_right66, [100, 100, 50, 66]
gravity :bottom_right33, [100, 100, 50, 34]

# Grabs
## ViewJump1-9
1.upto(9) do |n|
  grab "W-#{n}", "ViewJump#{n}".to_sym
end

## TODO anyone got more than 9 screens?
1.upto(NUM_SCREENS) do |n|
  grab "W-A-#{n}", "ScreenJump#{n}".to_sym
end

## All simple grabs that start with MODKEY
{
  # Gravities
  ["KP_7", "q"] => [:top_left, :top_left66, :top_left33],
  ["KP_8", "w"] => [:top, :top66, :top33],
  ["KP_9", "e"] => [:top_right, :top_right66, :top_right33],
  ["KP_4", "a"] => [:left, :left66, :left33],
  ["KP_5", "s"] => [:center, :center66, :center33],
  ["KP_6", "d"] => [:right, :right66, :right33],
  ["KP_1", "y"] => [:bottom_left, :bottom_left66, :bottom_left33],
  ["KP_2", "x"] => [:bottom, :bottom66, :bottom33], # TODO qwerty
  ["KP_3", "c"] => [:bottom_right, :bottom_right66, :bottom_right33],

  # Subtle control
  "C-r"   => :SubtleReload,
  "C-S-r" => :SubtleRestart,
  "C-q"   => :SubtleQuit,

  # Windows
  "B1"    => :WindowMove,
  "B3"    => :WindowResize,
  "f"     => :WindowFloat,
  "space" => :WindowFull,
  "r"     => :WindowRaise,
  "l"     => :WindowLower,
  "Left"  => :WindowLeft,
  "Down"  => :WindowDown,
  "Up"    => :WindowUp,
  "Right" => :WindowRight,
  "h"     => :WindowLeft,
  "j"     => :WindowDown,
  "u"     => :WindowUp,
  "k"     => :WindowRight,
  "S-k"   => :WindowKill,

  # Programs
  "Return" => "urxvt", # TODO put urxvt into constant
  "F2"     => "dmenu_run -b -fn '#{FONT}' -nb '#{PANEL_BG}' -nf '#{SND_PANEL_FG}' -sb '#{COLOR_THEME}' -sf '#{PRI_PANEL_FG}' -p 'Select:'", # TODO all colors in constants
}.each do |keys, commands|
  [*keys].each { |key| grab "#{MODKEY}-#{key}", commands }
end

## Swap views between two screens
## TODO support more than two screens
grab "#{MODKEY}-Tab" do
  screens = Subtlext::Screen.all
  current_screen = Subtlext::Screen.current
  views = screens.map(&:view)
  index = screens.index(current_screen)

  screens[index].view = views[(index - 1).abs]
end

case VOLUME_CONTROL
when :fancy
  grab "XF86AudioRaiseVolume", "~/bin/vol -i 1"
  grab "XF86AudioLowerVolume", "~/bin/vol -d 1"
  grab "XF86AudioMute", "~/bin/vol -t"
when :simple
  grab "XF86AudioRaiseVolume", "/usr/bin/amixer -q sset Master 2+"
  grab "XF86AudioLowerVolume", "/usr/bin/amixer -q sset Master 2-"
  grab "XF86AudioMute", "/usr/bin/amixer -q sset Master toggle"
end


if CUSTOM_BRIGHTNESS_CONTROLS
  grab "XF86MonBrightnessUp", "~/bin/brightness"
  grab "XF86MonBrightnessDown", "~/bin/brightness"
end

grab "XF86Display", "urxvtc -e sh ~/bin/display/interactive"
grab "XF86Sleep", "sudo hibernate -F /etc/hibernate/ususpend-ram.conf"
grab "XF86Launch2", "urxvtc -e sh ~/bin/iumount"

# Tags
tag "terms" do
  match "xterm|[u]?rxvt"
  exclude :name => "newsbeuter"
  if HOST == "dominikh-pc"
    gravity :top66
  else
    gravity :top
  end
end

tag "irc" do
  match "Weechat"
  if HOST == "dominikh-pc"
    gravity :bottom33
  else
    gravity :bottom
  end
end

tag "mail", "mutt|thunderbird|lanikai|shredder"
tag "news", "newsbeuter"
tag "browser", "uzbl|opera|firefox|navigator|chromium"
tag "editor" do
  match    "[g]?vim|emacs"
  resize   false
end

tag "pdf" do
  match "evince"
end

tag "stick" do
  match    "mplayer|imagemagick|Xmessage"
  float    true
  stick    true
end

tag "splash" do
  match :type => :splash
  stick true
end

tag "gimp" do
  match    "gimp"
  resize   false
end

tag "vm" do
  match    "VirtualBox"
end

tag "game" do
  match :name => "ryzom"
end

tag "gravity" do
  gravity  :center
end

tag "office" do
  match "libreoffice-writer"
end


# Views
view "terms" do
  match "terms|irc"
  icon "#{ICONS_ROOT}/terminal.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "www" do
  match "browser|default"
  icon "#{ICONS_ROOT}/world.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "news" do
  match "news"
  icon "#{ICONS_ROOT}/rss.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "dev" do
  match "editor"
  icon "#{ICONS_ROOT}/pencil.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "games" do
  match "game"
  icon "#{ICONS_ROOT}/game.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "pdf" do
  match "pdf"
  icon "#{ICONS_ROOT}/binder.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "office" do
  match "office"
  icon "#{ICONS_ROOT}/notepad.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "gimp" do
  match "gimp"
  icon "#{ICONS_ROOT}/paint.xbm"
  icon_only VIEWS_ICON_ONLY
end

if HAS_VM_VIEW
  view "vm" do
    match "vm"
  end
end

# Sublets
sublet :temp do
  separator " – "
end
