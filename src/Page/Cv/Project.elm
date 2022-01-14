module Page.Cv.Project exposing (Project, viewProject)

import Color
import Element exposing (..)
import Element.Font as Font
import Typography exposing (preparedParagraph)
import Util.Style exposing (itemHeading, printableLinkVertical)


type alias Project =
    { title : String
    , url : String
    , description : String
    , tags : List String
    }


viewProject : DeviceClass -> Project -> Element msg
viewProject deviceClass x =
    column [ spacing 16 ]
        [ printableLinkVertical deviceClass { url = x.url, label = el itemHeading <| preparedParagraph x.title }
        , preparedParagraph x.description
        , el [ Font.color Color.gray600 ] <| preparedParagraph <| String.join ", " <| x.tags
        ]
