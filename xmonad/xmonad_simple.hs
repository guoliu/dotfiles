-------------------------------------------------------------------------------
-- |
--
-- xmonad.hs, pbrisbin 2012
--
-- <https://github.com/pbrisbin/xmonad-config>
--
-------------------------------------------------------------------------------
import XMonad
  import XMonad.Hooks.DynamicLog
  import XMonad.Hooks.ManageHelpers
  import XMonad.Hooks.UrgencyHook
  import XMonad.Util.EZConfig
  import XMonad.Util.WorkspaceCompare

  main :: IO ()
  main = do
    conf <- statusBar "dzen2 -p -xs 1 -ta l -fn Verdana-12 -e 'onstart=lower'"
                dzenPP
                    { ppHidden = pad
                    , ppTitle  = pad . dzenColor "#bbb" "" . dzenEscape
                    , ppLayout = const ""
                    , ppSort   = getSortByXineramaRule
                    }
                toggleStrutsKey
                $ withUrgencyHook NoUrgencyHook
                $ defaultConfig
                    { modMask = mod4Mask
                    , terminal   = "gnome-terminal"
                    , manageHook = composeAll
                        [ isFullscreen --> doFullFloat
                        , manageHook defaultConfig
                        ]
                    }
                    `additionalKeysP`
                        [ --("M-p", spawn "x=$(yeganesh -x -- -i -fn Verdana-12) && exec $x")
                        ("M-q", spawn "killall dzen2; xmonad --recompile && xmonad --restart")
                        , ("<XF86AudioRaiseVolume>", spawn "amixer sset Master 3%+")
                        , ("<XF86AudioLowerVolume>", spawn "amixer sset Master 3%-")
                        , ("<XF86AudioMute>",        spawn "amixer sset Master toggle")
                        ]

    xmonad conf

-- | The unexported X.H.DynamicLog.toggleStrutsKey
toggleStrutsKey :: XConfig l -> (KeyMask, KeySym)
toggleStrutsKey XConfig { modMask = modm } = (modm, xK_b)


startupHook = startup

startup :: X ()
startup = do
  spawn "pidgin"
  spawn "firefox"
