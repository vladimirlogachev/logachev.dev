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



-- oklchToRgb : Float -> Float -> Float -> Color
-- oklchToRgb l c h =
--     let
--         hRadians =
--             h * pi / 180.0
--         c1 =
--             c * cos hRadians
--         c2 =
--             c * sin hRadians
--         temp =
--             c1 ^ 2 + c2 ^ 2
--         s =
--             sqrt temp
--         l2 =
--             (1 - abs (2 * l - 1)) * s
--         m =
--             l - 0.5 * l2
--         r =
--             round (hueToRgb m c1 c2 (h + 2 * pi / 3) * 255)
--         g =
--             round (hueToRgb m c1 c2 h * 255)
--         b =
--             round (hueToRgb m c1 c2 (h - 2 * pi / 3) * 255)
--     in
--     rgb255 r g b
-- hueToRgb : Float -> Float -> Float -> Float -> Float
-- hueToRgb m c1 c2 h =
--     let
--         hNormalized =
--             if h < 0 then
--                 h + 2 * pi
--             else if h > 2 * pi then
--                 h - 2 * pi
--             else
--                 h
--         rgbValue =
--             if hNormalized < pi / 3 then
--                 m + c1 * (1 - cos hNormalized) / cos (pi / 6 - hNormalized)
--             else if hNormalized < 2 * pi / 3 then
--                 m + c2 * (1 - cos (hNormalized - 2 * pi / 3)) / cos (pi / 6 - (hNormalized - 2 * pi / 3))
--             else
--                 m + c1 * (1 - cos (hNormalized - 4 * pi / 3)) / cos (pi / 6 - (hNormalized - 4 * pi / 3))
--     in
--     rgbValue


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
