module Page.Cv.Detail exposing (Detail, viewDetail)

import Color
import Element exposing (..)
import Element.Font as Font
import Typography exposing (nbsp, preparedText)
import Util.Style exposing (keyColumnWidth)


type alias Detail =
    { name : String, tags : List String }


viewDetail : Detail -> Element msg
viewDetail y =
    row [ width fill ]
        [ el [ Font.color Color.detail, width (px keyColumnWidth), alignTop ] <| text (y.name ++ nbsp)
        , paragraph [ alignTop ] [ preparedText <| String.join ", " <| y.tags ]
        ]
