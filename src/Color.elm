module Color exposing (blue, gray600, gray800, white)

import Element exposing (..)


white : Color
white =
    rgb255 255 255 255


gray800 : Element.Color
gray800 =
    rgb255 0x1D 0x20 0x21


gray600 : Element.Color
gray600 =
    rgb255 0x73 0x7C 0x82


blue : Element.Color
blue =
    rgb255 13 125 169
