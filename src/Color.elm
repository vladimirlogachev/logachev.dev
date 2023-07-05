module Color exposing (black, blue, detail, fontColor, white)

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
fontColor =
    olkchToCss
        >> Html.Attributes.style "color"
        >> htmlAttribute


white : Color
white =
    rgb255 255 255 255


black : Element.Color
black =
    rgb255 0 0 0


detail : Element.Color
detail =
    rgb255 0x6B 0x33 0xB9


blue : ColorOklch
blue =
    oklch 0.59 0.15 228.57
