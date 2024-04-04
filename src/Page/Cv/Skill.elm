module Page.Cv.Skill exposing (Skill, viewSkill)

import Element exposing (..)
import Page.Cv.Detail exposing (Detail, viewDetail)
import Typography exposing (preparedParagraph)
import Util.Style exposing (itemHeading)


type alias Skill =
    { icon : Maybe String
    , title : String
    , details : List Detail
    }


viewSkill : Skill -> Element msg
viewSkill x =
    column [ alignTop, width fill, spacing 20 ]
        [ el (width fill :: itemHeading) <| preparedParagraph x.title
        , column [ width fill, spacing 16 ] <| List.map viewDetail x.details
        ]
