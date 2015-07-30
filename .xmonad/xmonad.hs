-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)
import Data.Ratio

import XMonad
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.Warp
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce
import XMonad.Hooks.SetWMName
import XMonad.Layout.Minimize
import XMonad.Util.EZConfig

main = do
     spawn "xloadimage -onroot -border black -at 3200,450 /home/philip/Pictures/Assertive-Vision-Logo-hi-res.png -at 650,450 /home/philip/Pictures/Assertive-Vision-Logo-hi-res.png"
     spawn "gnome-screensaver"
     session <- getEnv "DESKTOP_SESSION"
     let config = maybe desktopConfig desktop session
     xmonad  $ config { startupHook = setWMName "LG3D"
                      , terminal = "gnome-terminal" 
                      , modMask = mod5Mask
                      , manageHook = myManageHook <+> manageHook defaultConfig
                      }
                      `additionalKeysP`
                      [
                      	("M-S-l",    spawn "gnome-screensaver-command -l"),
                        ("M-t",      viewScreen 3),
                        ("M-S-t",    sendToScreen 3),
                        ("M-m",      warpToWindow (1 % 2) (1 % 2))
                      ]

myManageHook = composeAll
    [ title =? "xclock" --> doFloat ]

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-gnome" = gnomeConfig
desktop _ = desktopConfig
