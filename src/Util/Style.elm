module Util.Style exposing
    ( fontFamilyGeneral
    , itemHeading
    , maxDesktopInnerWidth
    , pageHeading
    , printableLinkHorizontal
    , printableLinkVertical
    , sectionHeading
    )

import Color
import Element exposing (..)
import Element.Font as Font
import Element.Region as Region
import Typography exposing (preparedParagraph)


fontFamilyGeneral : Attribute msg
fontFamilyGeneral =
    Font.family [ Font.typeface "Source Sans Pro", Font.sansSerif ]


maxDesktopInnerWidth : Int
maxDesktopInnerWidth =
    1200


pageHeading : List (Attribute msg)
pageHeading =
    [ Region.heading 1, Font.semiBold, Font.size 48 ]


sectionHeading : List (Attribute msg)
sectionHeading =
    [ Region.heading 3, Font.semiBold, Font.size 32 ]


itemHeading : List (Attribute msg)
itemHeading =
    [ Region.heading 4, Font.semiBold, Font.size 20 ]


printableLinkVertical : DeviceClass -> { url : String, label : Element msg } -> Element msg
printableLinkVertical deviceClass { url, label } =
    let
        nonPrintableLink : Element msg
        nonPrintableLink =
            newTabLink [] { label = el [ Font.color Color.blue ] label, url = url }

        printFriendlyLink : Element msg
        printFriendlyLink =
            column [ spacing 7 ] [ label, newTabLink [ Font.color Color.blue ] { label = preparedParagraph url, url = url } ]
    in
    case deviceClass of
        Phone ->
            nonPrintableLink

        Tablet ->
            nonPrintableLink

        Desktop ->
            printFriendlyLink

        BigDesktop ->
            printFriendlyLink


printableLinkHorizontal : DeviceClass -> { url : String, labelText : String } -> Element msg
printableLinkHorizontal deviceClass { url, labelText } =
    let
        nonPrintableLink : Element msg
        nonPrintableLink =
            newTabLink [] { label = el [ Font.color Color.blue ] <| preparedParagraph labelText, url = url }

        printFriendlyLink : Element msg
        printFriendlyLink =
            wrappedRow [ spacing 7 ] [ preparedParagraph (labelText ++ ":"), newTabLink [ Font.color Color.blue ] { label = preparedParagraph url, url = url } ]
    in
    case deviceClass of
        Phone ->
            nonPrintableLink

        Tablet ->
            nonPrintableLink

        Desktop ->
            printFriendlyLink

        BigDesktop ->
            printFriendlyLink
