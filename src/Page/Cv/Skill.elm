module Page.Cv.Skill exposing (Skill, viewSkill)

import Element exposing (..)
import Page.Cv.Detail exposing (Detail, viewDetail)
import Typography exposing (preparedParagraph)
import Util.Style exposing (sectionHeading)


type alias Skill =
    { icon : Maybe String
    , title : String
    , details : List Detail
    }


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
    container [ width fill, spacing 30 ]
        [ column
            [ alignTop
            , width (px 120)
            ]
            [ case x.icon of
                Just src ->
                    image [ height fill, width fill ] { src = src, description = x.title }

                Nothing ->
                    none
            ]
        , column [ alignTop, width fill, spacing 20 ]
            [ el (width fill :: sectionHeading) <| preparedParagraph x.title
            , column [ width fill, spacing 16 ] <| List.map viewDetail x.details
            ]
        ]
