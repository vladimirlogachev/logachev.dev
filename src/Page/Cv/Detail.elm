module Page.Cv.Detail exposing (Detail, viewDetail)

import Color
import Element exposing (..)
import Element.Font as Font
import Typography exposing (nbsp, preparedText)


type alias Detail =
    { name : String, tags : List String }


viewDetail : Detail -> Element msg
viewDetail y =
    paragraph [ width fill ]
        [ el [ paddingEach { top = 0, right = 8, bottom = 0, left = 0 } ] <| preparedText (y.name ++ ":" ++ nbsp)
        , el [ Font.color Color.gray600 ] <| preparedText <| String.join ", " <| y.tags
        ]
