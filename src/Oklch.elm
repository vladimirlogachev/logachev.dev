module Oklch exposing (ColorOklch(..), blue, fontColor)

import Color
import Element exposing (..)
import Html.Attributes


type ColorOklch
    = ColorOklch
        { l : Float
        , c : Float
        , h : Float
        }


oklch : Float -> Float -> Float -> ColorOklch
oklch l c h =
    ColorOklch { l = l, c = c, h = h }


olkchToCss : ColorOklch -> String
olkchToCss (ColorOklch { l, c, h }) =
    "oklch(" ++ String.join " " [ String.fromFloat l, String.fromFloat c, String.fromFloat h ] ++ ")"


fontColor : ColorOklch -> Attribute msg
fontColor c =
    String.concat [ "color:", Color.toCssColor blueFallback, ";", "color:", olkchToCss c, ";" ]
        |> Html.Attributes.attribute "style"
        |> htmlAttribute


blue : ColorOklch
blue =
    oklch 0.59 0.15 228.57


blueFallback : Color
blueFallback =
    rgb255 0x00 0x89 0xB3
