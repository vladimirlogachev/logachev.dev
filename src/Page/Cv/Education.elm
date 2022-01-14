module Page.Cv.Education exposing (Education, viewEducation)

import Color
import Element exposing (..)
import Element.Font as Font
import Typography exposing (preparedParagraph)
import Util.Style exposing (itemHeading, printableLinkVertical)


type alias Education =
    { title : String
    , url : String
    , details : String
    }


viewEducation : DeviceClass -> Education -> Element msg
viewEducation deviceClass x =
    column [ spacing 10 ]
        [ printableLinkVertical deviceClass { url = x.url, label = el itemHeading <| preparedParagraph x.title }
        , preparedParagraph x.details |> el [ Font.color Color.gray600 ]
        ]
