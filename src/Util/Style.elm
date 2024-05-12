module Util.Style exposing
    ( contactsKeyColumnWidth
    , keyColumnWidth
    , preparedParagraph
    , printLinkHorizontal
    , printableLinkVertical
    , screenLink
    )

import Color
import Element exposing (..)
import Element.Font as Font
import ExtraColor
import GridLayout2 exposing (..)
import Typography exposing (nbsp, preparedText)


{-| TODO: remove
-}
preparedParagraph : String -> Element msg
preparedParagraph text =
    paragraph [] [ preparedText text ]


printableLinkVertical : LayoutState -> { url : Maybe String, label : Element msg } -> Element msg
printableLinkVertical layout { url, label } =
    case layout.screenClass of
        MobileScreen ->
            -- nonPrintableLink
            case url of
                Just urlString ->
                    newTabLink [] { label = el [ ExtraColor.fontColor Color.blue ] label, url = urlString }

                Nothing ->
                    el [ Font.color Color.black ] label

        DesktopScreen ->
            -- printFriendlyLink
            case url of
                Just urlString ->
                    column [] [ label, newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedParagraph urlString, url = urlString } ]

                Nothing ->
                    label


screenLink : { url : String, labelText : String } -> Element msg
screenLink { url, labelText } =
    newTabLink [] { label = el [ ExtraColor.fontColor Color.blue ] <| preparedParagraph labelText, url = url }


printLinkHorizontal : { url : String, labelText : String, printAs : Maybe String } -> Element msg
printLinkHorizontal { url, labelText, printAs } =
    wrappedRow []
        [ el [ Font.color Color.detail, width (px contactsKeyColumnWidth) ] <| preparedParagraph (labelText ++ nbsp)
        , newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedParagraph <| Maybe.withDefault url printAs, url = url }
        ]


keyColumnWidth : Int
keyColumnWidth =
    140


contactsKeyColumnWidth : Int
contactsKeyColumnWidth =
    140
