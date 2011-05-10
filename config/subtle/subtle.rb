# -*- coding: utf-8 -*-
require "socket"
require "subtle/subtlext"

# Host specific options
HOST            = Socket.gethostname.freeze
SMALL_DEVICE    = HOST == "dominikh-netbook"
NUM_SCREENS     = HOST == "dominikh-pc" ? 2 : 1
VIEWS_ICON_ONLY = SMALL_DEVICE
HAS_VM_VIEW     = HOST != "dominikh-netbook"
BIG_PANEL       = !SMALL_DEVICE
CUSTOM_BRIGHTNESS_CONTROLS = HOST == "dominikh-laptop"
VOLUME_CONTROL = case HOST
                 when "dominikh-lapop" then :fancy
                 when "dominikh-netbook", "dominikh-pc" then :simple
                 else :none
                 end

# Style
PANEL_BG = "#202020"
PRI_PANEL_FG = "#ffffff"
SND_PANEL_FG = "#757575"
COLOR_THEME = "#54728e"
ICONS_ROOT = "/home/dominikh/.config/subtle/icons"
FONT = "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
BORDER = "#303030"

MODKEY   = "W"

TERMINAL_EMULATOR = "urxvt"

# Settings
set :separator, "◯"

if BIG_PANEL
  PADDING = [3, 3]
  STRUT   = [0, 0, 16, 0]
else
  PADDING = [0, 0, 3, 3]
  STRUT   = [0, 0, 0, 0]
end

set :step,       5
set :snap,       10
set :gravity,    :center
set :urgent,     false
set :resize,     true
set :font, FONT

case HOST
when "dominikh-lapop", "dominikh-netbook"
  screen 1 do
    top [:views, :separator, :title, :spacer, :separator, :tray, :sublets]
  end
when "dominikh-pc"
  screen 1 do
    top [:views, :separator, :title, :spacer, :separator, :tray, :cpuchart, :separator, :clock]
  end

  screen 2 do
    top [:views, :separator, :title, :spacer, :separator, :tray, :temp, :separator, :mpd]
  end
end

# Colors
[:focus, :title, :views, :sublets, :urgent, :occupied].each do |s|
  style s do
    padding(*PADDING)
  end
end

[:focus, :title, :urgent].each do |s|
  style s do
    foreground PRI_PANEL_FG
  end
end

[:views, :sublets, :occupied].each do |s|
  style s do
    foreground SND_PANEL_FG
  end
end

[:views, :title, :sublets, :separator].each do |s|
  style s do
    background PANEL_BG
  end
end

style :focus do
  if BIG_PANEL
    background PANEL_BG
    border_bottom COLOR_THEME, 3
  else
    background COLOR_THEME
  end
end

style :separator do
  foreground COLOR_THEME
  margin 3
end

style :title do
end

style :clients do
  active COLOR_THEME, 2
  inactive PANEL_BG, 2
end

style :urgent do
  background "#ff6565"
end

style :occupied do
  if BIG_PANEL
    background PANEL_BG
    border_bottom "#bbbbbb", 3
  else
    background "#111111"
  end
end

style :subtle do
  padding(*STRUT)
  panel PANEL_BG
end

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
  "Return" => TERMINAL_EMULATOR,
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

grab "XF86Display", "#{TERMINAL_EMULATOR} -e sh ~/bin/display/interactive"
grab "XF86Sleep", "sudo hibernate -F /etc/hibernate/ususpend-ram.conf"
grab "XF86Launch2", "#{TERMINAL_EMULATOR} -e sh ~/bin/iumount"

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
    icon "#{ICONS_ROOT}/cpu.xbm"
    icon_only VIEWS_ICON_ONLY
  end
end

# Sublets
sublet :temp do
  separator " – "
end
