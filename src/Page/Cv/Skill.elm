module Page.Cv.Skill exposing (Skill, viewSkill)

import Element exposing (..)
import Page.Cv.Detail exposing (Detail, viewDetail)
import Typography exposing (preparedParagraph)
import Util.Style exposing (itemHeading, sectionHeading)


type alias Skill =
    { icon : Maybe String
    , title : String
    , details : List Detail
    }



-- column
--             [ alignTop
--             , width (px 40)
--             , paddingEach { top = 10, right = 0, bottom = 0, left = 0 }
--             ]
--             [ case x.icon of
--                 Just src ->
--                     image [ height fill, width fill ] { src = src, description = x.title }
--                 Nothing ->
--                     none
--             ]


viewSkill : DeviceClass -> Skill -> Element msg
viewSkill deviceClass x =
    let
        container : List (Attribute msg) -> List (Element msg) -> Element msg
        container =
            case deviceClass of
                Phone ->
                    column

                _ ->
                    row
    in
    column [ alignTop, width fill, spacing 20 ]
        [ el (width fill :: itemHeading) <| preparedParagraph x.title
        , column [ width fill, spacing 16 ] <| List.map viewDetail x.details
        ]
