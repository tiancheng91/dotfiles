# -*- coding: utf-8 -*-
require "socket"
require "subtle/subtlext"

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

COLOR_BLUEISH = "#54728e"
ICONS_ROOT = "/home/dominikh/.config/subtle/icons"

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
set :font,       "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"


#
# == Panel
#
# The next configuration values determine the layout and placement of the panel. Generally,
# the panel in subtle consists of two independent bars, one on the top and one at the bottom
# of the screen. In Xinerama setups there will only be panels visible on the first screen.
#
# The top and bottom bar can contain different items and will be hidden when empty.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons
# [*:sublets*]   Catch-all for installed sublets
# [*:spacer*]    Variable spacer
# [*:separator*] Insert separator
#

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

#
# == Colors
#
# Colors directly define the look of subtle, valid values are:
#
# [*hexadecimal*] #0000ff
# [*decimal*]     (0, 0, 255)
# [*names*]       blue
#
# Whenever there is no valid value for a color set - subtle will use a default one. There
# is only one exception to this: If no background color is given no color will be set. This
# will ensure a custom background pixmap won't be overwritten.
#

color :focus_fg,         "#ffffff"
color :focus_bg,          COLOR_BLUEISH
color :focus_border,     "#303030"

color :title_fg,         "#ffffff"
color :title_bg,         "#202020"
color :title_border,     "#303030"

color :urgent_fg,        "#ffffff"
color :urgent_bg,        "#ff6565"
color :urgent_border,    "#303030"

color :occupied_fg,      "#757575"
color :occupied_bg,      "#111111"
color :occupied_border,  "#303030"

color :views_fg,         "#757575"
color :views_bg,         "#202020"
color :views_border,     "#303030"

color :sublets_fg,       "#757575"
color :sublets_bg,       "#202020"
color :sublets_border,   "#303030"

color :stipple,        "#ffffff"
color :panel,          "#202020"

color :client_active,   COLOR_BLUEISH # border around active client
color :client_inactive, "#202020" # border around inactive client

color :separator,       "#610000"

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways to set a
# certain gravity, most convenient is to define a gravity via a tag or change them during
# runtime via grab. Subtler and subtlext can also modify gravities.
#
# A gravity consists of four values which are a percentage value of the screen size. The first
# two values are x and y starting at the center of the screen and he last two values are the
# width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   :example = [ 0, 0, 100, 100 ]
#
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

# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be assigned either
# to a key and/or to a mouse button combination. A grab consists of a chain and an action.
#
# === Chain
#
# A chain is a string of modifiers, mouse buttons and normal keys separated by a hyphen.
#
# ==== Modifiers:
#
# [*S*] Shift key
# [*A*] Alt key
# [*C*] Control key
# [*W*] Super (Windows key)
# [*M*] Meta key
#
# ==== Mouse buttons:
#
# [*B1*] Button1
# [*B2*] Button2
# [*B3*] Button3
# [*B4*] Button4
# [*B5*] Button5
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a xterm when Alt+Enter are pressed:
#
#   "A-Return" => "xterm"
#

# Host specific

modkey   = "W"
gravkeys = [ "q", "w", "e", "a", "s", "d", "y", "x", "c" ]
gravkeys.map! { |g| "#{modkey}-#{g}" }

grab "W-1", :ViewJump1
grab "W-2", :ViewJump2
grab "W-3", :ViewJump3
grab "W-4", :ViewJump4
grab "W-5", :ViewJump5
grab "W-6", :ViewJump6
grab "W-7", :ViewJump7
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4
grab "W-C-r", :SubtleReload
grab "W-C-S-r", :SubtleRestart
grab "W-C-q", :SubtleQuit
grab "W-B1", :WindowMove
grab "W-B3", :WindowResize
grab "W-f", :WindowFloat
grab "W-space", :WindowFull
grab "W-s", [:center, :center66, :center33]
grab "W-r", :WindowRaise
grab "W-l", :WindowLower
grab "W-Left", :WindowLeft
grab "W-Down", :WindowDown
grab "W-Up", :WindowUp
grab "W-Right", :WindowRight
grab "W-h", :WindowLeft
grab "W-j", :WindowDown
grab "W-u", :WindowUp
grab "W-k", :WindowRight
grab "W-S-k", :WindowKill
grab "W-KP_7", [:top_left, :top_left66, :top_left33]
grab "W-KP_8", [:top, :top66, :top33]
grab "W-KP_9", [:top_right, :top_right66, :top_right33]
grab "W-KP_4", [:left, :left66, :left33]
grab "W-KP_5", [:center, :center66, :center33]
grab "W-KP_6", [:right, :right66, :right33]
grab "W-KP_1", [:bottom_left, :bottom_left66, :bottom_left33]
grab "W-KP_2", [:bottom, :bottom66, :bottom33]
grab "W-KP_3", [:bottom_right, :bottom_right66, :bottom_right33]
grab "W-q", [:top_left, :top_left66, :top_left33]
grab "W-w", [:top, :top66, :top33]
grab "W-e", [:top_right, :top_right66, :top_right33]
grab "W-a", [:left, :left66, :left33]
grab "W-d", [:right, :right66, :right33]
grab "W-y", [:bottom_left, :bottom_left66, :bottom_left33]
grab "W-x", [:bottom, :bottom66, :bottom33]
grab "W-c", [:bottom_right, :bottom_right66, :bottom_right33]
grab "W-Return", "urxvt"
grab "W-F2", "dmenu_run -b -fn '-*-*-medium-*-*-*-14-*-*-*-*-*-*-*' -nb '#202020' -nf '#757575' -sb '#{COLOR_BLUEISH}' -sf '#ffffff' -p 'Select:'"

grab "W-Tab" do
  screens = Subtlext::Screen.all
  current_screen = Subtlext::Screen.current
  views = screens.map(&:view)
  index = screens.index(current_screen)

  screens[index].view = views[(index - 1).abs]
end

grab "W-F3" do
  require "dmenu"
  require "subtle/subtlext"

  view = Subtlext::View.current
  clients = view.clients

  menu = Dmenu.new
  menu.position = :bottom
  menu.font = "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
  menu.prompt = "Select:"
  menu.selected_background = COLOR_BLUEISH
  menu.selected_foreground = "#ffffff"
  menu.background = "#202020"
  menu.foreground = "#757575"
  menu.items = clients.map { |c| Dmenu::Item.new("%s (%s) [%s]" % [c.name, c.klass, c.win], c) }

  if item = menu.run
    item.value.focus
  end
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

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is strict,
# that means that - aside from other tiling window managers - windows must have a matching
# tag to be on a certain view. This also includes that windows that are started on a certain
# view will not automatically be placed there.
#
# There are to ways to define a tag:
#
# [*string*] With a WM_CLASS/WM_NAME
# [*hash*]   With a hash of properties
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the default view.
# The default view can either be set by the user with adding the default tag to a view by
# choice or otherwise the first defined view will be chosen automatically.
#
# === Properties
#
# Additionally tags can do a lot more then just control the placement - they also have properties
# than can define and control some aspects of a window like the default gravity or the default
# screen per view.
#
# [*:float*]   This property either sets the tagged client floating or prevents it from being
#              floating depending on the value.
# [*:full*]    This property either sets the tagged client to fullscreen or prevents it from being
#              set to fullscreen depending on the value.
# [*:gravity*] This property sets a certain to gravity to the tagged client, but only on views that
#              have this tag too.
# [*:match*]   This property influcences the matching of tags, per default tags will only match the
#              WM_NAME and the WM_CLASS portion of a client. Match expects an array with following
#              possible values:
#
#              [*:name*]       match the WM_NAME
#              [*:instance*]   match the first (instance) part from WM_CLASS
#              [*:class*]      match the second (class) part from WM_CLASS
#              [*:role*]       match the window role
# [*:regex*]   This property sets the matching pattern for a tag. Matching works either via plain,
#              regex (see regex) or window id. If a pattern matches more than once ONLY the first
#              match will be used.
# [*:resize*]  This property either enables or disables honoring of client resize hints and is
#              independent of the global option.
# [*:screen*]  This property sets a certain to screen to the tagged client, but only on views that
#              have this tag too. Please keep in mind that screen count starts with 0 for the first
#              screen.
# [*:size*]    This property sets a certain to size as well as floating to the tagged client, but
#              only on views that have this tag too. It expects an array with x, y, width and height
#              values.
# [*:stick*]   This property either sets the tagged client to stick or prevents it from being set to
#              stick depending on the value. Stick clients are visible on every view.
# [*:urgent*]  This property either sets the tagged client to be urgent or prevents it from being
#              urgent depending on the value. Urgent clients will get keyboard and mouse focus
#              automatically.

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

tag "fixed" do
  geometry [10, 10, 100, 100]
  stick    true
end

tag "resize" do
  match    "sakura|gvim"
  resize   true
end

tag "gravity" do
  gravity  :center
end

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

view "pdf" do
  match "pdf"
  icon "#{ICONS_ROOT}/binder.xbm"
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

sublet :temp do
  separator " – "
end
