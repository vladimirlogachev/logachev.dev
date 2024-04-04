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
        [ text (y.name ++ ":" ++ nbsp ++ nbsp)
        , el [ Font.color Color.detail ] <| preparedText <| String.join ", " <| y.tags
        ]
