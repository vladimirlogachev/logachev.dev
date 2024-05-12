module Util.Style exposing
    ( contactsKeyColumnWidth
    , fontFamilyGeneral
    , itemHeading
    , keyColumnWidth
    , maxDesktopInnerWidth
    , pageHeading
    , preparedParagraph
    , printLinkHorizontal
    , printableLinkVertical
    , screenLink
    , sectionHeading
    )

import Color
import Element exposing (..)
import Element.Font as Font
import Element.Region as Region
import GridLayout2 exposing (..)
import Oklch
import Typography exposing (nbsp, preparedText)


{-| TODO: remove
-}
preparedParagraph : String -> Element msg
preparedParagraph text =
    paragraph [] [ preparedText text ]


fontFamilyGeneral : Attribute msg
fontFamilyGeneral =
    Font.family [ Font.typeface "Source Sans Pro", Font.sansSerif ]


maxDesktopInnerWidth : Int
maxDesktopInnerWidth =
    900


pageHeading : List (Attribute msg)
pageHeading =
    [ Region.heading 1, Font.semiBold, Font.size 48 ]


sectionHeading : List (Attribute msg)
sectionHeading =
    [ Region.heading 2, Font.semiBold, Font.size 36 ]


itemHeading : List (Attribute msg)
itemHeading =
    [ Region.heading 3, Font.semiBold, Font.size 20 ]


printableLinkVertical : LayoutState -> { url : Maybe String, label : Element msg } -> Element msg
printableLinkVertical layout { url, label } =
    case layout.screenClass of
        MobileScreen ->
            -- nonPrintableLink
            case url of
                Just urlString ->
                    newTabLink [] { label = el [ Oklch.fontColor Oklch.blue ] label, url = urlString }

                Nothing ->
                    el [ Font.color Color.black ] label

        DesktopScreen ->
            -- printFriendlyLink
            case url of
                Just urlString ->
                    column [] [ label, newTabLink [ Oklch.fontColor Oklch.blue ] { label = preparedParagraph urlString, url = urlString } ]

                Nothing ->
                    label


screenLink : { url : String, labelText : String } -> Element msg
screenLink { url, labelText } =
    newTabLink [] { label = el [ Oklch.fontColor Oklch.blue ] <| preparedParagraph labelText, url = url }


printLinkHorizontal : { url : String, labelText : String, printAs : Maybe String } -> Element msg
printLinkHorizontal { url, labelText, printAs } =
    wrappedRow []
        [ el [ Font.color Color.detail, width (px contactsKeyColumnWidth) ] <| preparedParagraph (labelText ++ nbsp)
        , newTabLink [ Oklch.fontColor Oklch.blue ] { label = preparedParagraph <| Maybe.withDefault url printAs, url = url }
        ]


keyColumnWidth : Int
keyColumnWidth =
    140


contactsKeyColumnWidth : Int
contactsKeyColumnWidth =
    140
