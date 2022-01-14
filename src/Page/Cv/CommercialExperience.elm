module Page.Cv.CommercialExperience exposing (CommercialExperience, viewCommercialExperience)

import Color
import Element exposing (..)
import Element.Font as Font
import Page.Cv.Date exposing (Date, showDate)
import Page.Cv.Detail exposing (Detail, viewDetail)
import Typography exposing (preparedParagraph, preparedText)
import Util.Style exposing (itemHeading, printableLinkVertical)


type alias CommercialExperience msg =
    { company : String
    , positionTitle : String
    , startDate : Date
    , endDate : Maybe Date
    , url : Maybe String
    , roleDescription : List (Element msg)
    , details : List Detail
    }


viewCommercialExperience : DeviceClass -> CommercialExperience msg -> Element msg
viewCommercialExperience deviceClass x =
    column [ width fill, spacing 16 ]
        [ column [ width fill, spacing 10 ]
            [ case x.url of
                Just url ->
                    printableLinkVertical deviceClass { url = url, label = el itemHeading <| preparedParagraph x.company }

                Nothing ->
                    el itemHeading <| preparedParagraph x.company
            , wrappedRow [ width fill, spacing 10 ]
                [ el [ Font.medium ] <| preparedText x.positionTitle
                , (showDate x.startDate ++ " — " ++ (x.endDate |> Maybe.map showDate |> Maybe.withDefault "present"))
                    |> preparedText
                    |> el [ Font.color Color.gray600 ]
                ]
            ]
        , column [ width fill, spacing 16 ] <| x.roleDescription
        , column [ width fill, spacing 10 ] <| List.map viewDetail x.details
        ]
