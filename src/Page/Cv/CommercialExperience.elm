module Page.Cv.CommercialExperience exposing (CommercialExperience, viewCommercialExperience)

import Color
import Element exposing (..)
import Element.Font as Font
import Element.Region as Region
import Page.Cv.Date exposing (Date, EndDate, showDate, showEndDate)
import Page.Cv.Detail exposing (Detail, viewDetail)
import Typography exposing (preparedParagraph, preparedText)
import Util.Style exposing (itemHeading, printableLinkVertical)


type alias CommercialExperience msg =
    { company : String
    , role : String
    , startDate : Date
    , endDate : EndDate
    , url : Maybe String
    , roleDescription : List (Element msg)
    , details : List Detail
    }


viewCommercialExperience : DeviceClass -> CommercialExperience msg -> Element msg
viewCommercialExperience deviceClass x =
    column [ width fill, spacing 16 ]
        [ column [ width fill, spacing 10 ]
            [ el itemHeading <| preparedParagraph x.role
            , printableLinkVertical deviceClass { url = x.url, label = el [ Region.heading 4, Font.medium, Font.size 20 ] <| preparedParagraph x.company }
            , (showDate x.startDate ++ " — " ++ showEndDate x.endDate)
                |> preparedText
                |> el [ Font.color Color.detail ]
            ]
        , column [ width fill, spacing 16 ] <| x.roleDescription
        , column [ width fill, spacing 10 ] <| List.map viewDetail x.details
        ]
