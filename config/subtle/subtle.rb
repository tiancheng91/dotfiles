# -*- coding: utf-8 -*-
require "socket"
require "subtle/subtlext"

# Host specific options

# This configuration has been written with three different devices in
# mind, which can be distinguished by their host names.
#
# If you want to change the behaviour for the different devices, do so
# by adjusting the constants.
#
# Do not forget to add the correct hostnames.

HOST            = Socket.gethostname.freeze

## mapping of devices to host names
DEVICES = {
  "desktop" => ["dominikh-pc"],
  "notebook" => ["dominikh-laptop"],
  "netbook" => ["dominikh-netbook"],
}

DEVICE = DEVICES.find {|k,v| v.include?(HOST)}.first

def is_device?(device)
  DEVICES[device].include?(HOST)
end

SMALL_DEVICE    = is_device?("netbook")
NUM_SCREENS     = Subtlext::Screen.all.size
VIEWS_ICON_ONLY = SMALL_DEVICE
HAS_VM_VIEW     = is_device?("desktop")
BIG_PANEL       = !SMALL_DEVICE
CUSTOM_BRIGHTNESS_CONTROLS = is_device?("notebook")
VOLUME_CONTROL = if is_device?("notebook")
                   :fancy
                 else
                   :none
                 end

# Style
PANEL_BG     = "#202020"
PRI_PANEL_FG = "#ffffff"
SND_PANEL_FG = "#757575"
COLOR_THEME  = "#54728e"
COLOR_THEME2 = "#738F54"
ICONS_ROOT   = "/home/dominikh/.config/subtle/icons"
FONT         = "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
BORDER       = "#303030"

MODKEY = "W"

TERMINAL_EMULATOR = "urxvt"

# Settings

if BIG_PANEL
  PADDING = [3]
  STRUT   = [0, 0, 0, 0]
else
  PADDING = [2]
  STRUT   = [0]
end

set :step,    5
set :snap,    10
set :gravity, :center
set :urgent,  false
set :resize,  false

case DEVICE
when "notebook", "netbook"
  screen 1 do
    top [:views, :separator, :title, :spacer, :separator, :status, :tray, :sublets]
  end
when "desktop"
  screen 1 do
    top [:views, :separator, :title, :spacer, :separator, :status, :tray, :cpuchart, :separator, :clock]
  end

  screen 2 do
    top [:views, :separator, :title, :spacer, :separator, :status, :tray, :temp, :separator, :mpd]
  end
end

# Colors
## [:focus, :title, :views, :sublets, :urgent, :occupied, :separator] inherit from :all
style :all do
  padding(*PADDING)
  font FONT
  background PANEL_BG
  foreground PRI_PANEL_FG
  icon SND_PANEL_FG
end

style :views do
  foreground SND_PANEL_FG

  style :occupied do
    foreground SND_PANEL_FG
    icon PRI_PANEL_FG

    if BIG_PANEL
      border_bottom "#bbbbbb", 3
    else
      background "#111111"
    end
  end

  style :visible do
    if BIG_PANEL
      border_bottom COLOR_THEME2, 3
    else
      background COLOR_THEME2
    end
  end

  style :focus do
    icon PRI_PANEL_FG
    if BIG_PANEL
      border_bottom COLOR_THEME, 3
    else
      background COLOR_THEME
    end
  end

  style :urgent do
    background "#ff6565"
  end
end

style :title do
end

style :sublets do
  foreground SND_PANEL_FG
  icon PRI_PANEL_FG
end

style :separator do
  foreground COLOR_THEME
  padding    0
  margin     3

  if BIG_PANEL
    separator "◯"
  else
    separator "|"
  end
end

style :clients do
  active   COLOR_THEME, 2
  inactive PANEL_BG,    2
end

style :subtle do
  padding(*STRUT)
  panel PANEL_BG
end

# Gravities
## interactive
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,  50,  33, 100 ]
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]
# programmatically used
gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]
gravity :gobby_main,     [   0,   0,  90, 100 ]
gravity :gobby_list,     [  90,   0,  10, 100 ], :vert
# Grabs
## ViewJump1-9
1.upto(9) do |n|
  grab "W-#{n}", "ViewJump#{n}".to_sym
end

## TODO anyone got more than 9 screens?
1.upto(NUM_SCREENS) do |n|
  grab "W-C-#{n}", "ScreenJump#{n}".to_sym
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
  ["KP_1", "z"] => [:bottom_left, :bottom_left66, :bottom_left33],
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
  "y"   => :WindowZaphod,
  "S-s" => :WindowStick,

  # Programs
  "Return" => TERMINAL_EMULATOR,
  "F2"     => "dmenu_run -b -fn '#{FONT}' -nb '#{PANEL_BG}' -nf '#{SND_PANEL_FG}' -sb '#{COLOR_THEME}' -sf '#{PRI_PANEL_FG}' -p 'Select:'", # TODO all colors in constants
}.each do |keys, commands|
  [*keys].each { |key| grab "#{MODKEY}-#{key}", commands }
end

## Swap views between two screens
## TODO support more than two screens
grab "#{MODKEY}-Tab" do
  other_screen = Subtlext::Screen.all.find {|s| s != Subtlext::Screen.current}
  Subtlext::Screen.current.view = other_screen.view
end

case VOLUME_CONTROL
when :fancy
  grab "XF86AudioRaiseVolume", "~/bin/vol -i 1"
  grab "XF86AudioLowerVolume", "~/bin/vol -d 1"
  grab "XF86AudioMute",        "~/bin/vol -t"
when :simple
  grab "XF86AudioRaiseVolume", "/usr/bin/amixer -q sset Master 2+"
  grab "XF86AudioLowerVolume", "/usr/bin/amixer -q sset Master 2-"
  grab "XF86AudioMute",        "/usr/bin/amixer -q sset Master toggle"
end


if CUSTOM_BRIGHTNESS_CONTROLS
  grab "XF86MonBrightnessUp",   "~/bin/brightness"
  grab "XF86MonBrightnessDown", "~/bin/brightness"
end

grab "XF86Display", "#{TERMINAL_EMULATOR} -e sh ~/bin/display/interactive"
grab "XF86Sleep",   "sudo hibernate -F /etc/hibernate/ususpend-ram.conf"
grab "XF86Launch2", "#{TERMINAL_EMULATOR} -e sh ~/bin/iumount"

# Tags
tag "terms" do
  match :instance => "xterm|[u]?rxvt"
  if is_device?("desktop")
    gravity :top66
  else
    gravity :top
  end
end

tag "irc" do
  match "Weechat"
  if is_device?("desktop")
    gravity :bottom33
  else
    gravity :bottom
  end
end

tag "thunderbird_dialogs" do
  urgent true
  match :instance => "Dialog", :class => "Thunderbird"
end

tag "mail",    "mutt|thunderbird|lanikai|shredder"
tag "fm",      "thunderbird|tellico"
tag "news",    "newsbeuter"
tag "browser", "uzbl|opera|firefox|navigator|chromium"
tag "editor" do
  match    "[g]?vim|emacs|Eclipse"
  resize   false
end

tag "gobby_list" do
  match :instance => "gobby", :name => "User\\slist"
  match :instance => "gobby", :name => "Document\\slist"
  gravity :gobby_list
end

tag "gobby_main" do
  match :instance => "gobby", :name => ".*Gobby"
  gravity :gobby_main
end

tag "pdf" do
  match "evince|fbreader|calibre"
end

tag "stick" do
  match    "imagemagick|Xmessage|pinentry-gtk-2"
  float    true
  stick    true
end

tag "mplayer" do
  match "mplayer"
  float true
  stick 1
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
  match "Dwarf_Fortress"
  match "FrozenSynapse"
  match :name => "ePSXe"
  match :class => "net-minecraft-MinecraftLauncher"
  match "Steam"
  match "dota_linux"
end

tag "gravity" do
  gravity  :center
end

tag "office" do
  match "libreoffice-.+|LibreOffice|eagle"
  match "gnucash"
end

tag "xbmc" do
  match "xbmc.bin"
  full true
  geometry [0, 0, 1920, 1080]
end


# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

# Views
view "terms" do
  match     "terms|irc"
  icon      "#{ICONS_ROOT}/terminal.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "www" do
  match     "browser|default"
  icon      "#{ICONS_ROOT}/world.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "fm" do
  match "fm|gobby_.+"
end

view "dev" do
  match     "editor"
  icon      "#{ICONS_ROOT}/pencil.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "games" do
  match     "game"
  icon      "#{ICONS_ROOT}/game.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "pdf" do
  match     "pdf"
  icon      "#{ICONS_ROOT}/binder.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "office" do
  match     "office|xbmc"
  icon      "#{ICONS_ROOT}/notepad.xbm"
  icon_only VIEWS_ICON_ONLY
end

view "gimp" do
  match     "gimp"
  icon      "#{ICONS_ROOT}/paint.xbm"
  icon_only VIEWS_ICON_ONLY
end

if HAS_VM_VIEW
  view "vm" do
    match "vm"
    icon      "#{ICONS_ROOT}/cpu.xbm"
    icon_only VIEWS_ICON_ONLY
  end

  1.upto(4) do |i|
    view "vm#{i}" do
      match     "vm#{i}"
      icon      "#{ICONS_ROOT}/cpu.xbm"
      icon_only VIEWS_ICON_ONLY
    end
  end
end

# Sublets
sublet :temp do
  separator " – "
end

sublet :mpd do
  draw_icons true
  use_colors true
end
