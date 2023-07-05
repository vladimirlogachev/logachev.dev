module Color exposing (black, detail, toCssColor, white)

import Element exposing (..)


toCssColor : Color -> String
toCssColor x =
    let
        { red, green, blue, alpha } =
            toRgb x

        colors : List String
        colors =
            [ red, green, blue ]
                |> List.map ((*) 255 >> round >> String.fromInt)
    in
    "rgba("
        ++ String.join "," colors
        ++ ","
        ++ String.fromFloat alpha
        ++ ")"


white : Color
white =
    rgb255 255 255 255


black : Element.Color
black =
    rgb255 0 0 0


detail : Element.Color
detail =
    rgb255 0x6B 0x33 0xB9
