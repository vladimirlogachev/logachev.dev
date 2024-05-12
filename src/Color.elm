module Color exposing (black, blue, detail, white)

import Element exposing (..)
import ExtraColor exposing (ExtraColor)


white : Color
white =
    rgb255 255 255 255


black : Element.Color
black =
    rgb255 0 0 0


detail : Element.Color
detail =
    rgb255 111 111 111


blue : ExtraColor
blue =
    ExtraColor.oklch 0.59 0.15 228.57
