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
import Oklch
import Typography exposing (preparedParagraph)


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
    [ Region.heading 2, Font.semiBold, Font.size 40 ]


itemHeading : List (Attribute msg)
itemHeading =
    [ Region.heading 3, Font.semiBold, Font.size 20 ]


printableLinkVertical : DeviceClass -> { url : Maybe String, label : Element msg } -> Element msg
printableLinkVertical deviceClass { url, label } =
    let
        nonPrintableLink : Element msg
        nonPrintableLink =
            case url of
                Just urlString ->
                    newTabLink [] { label = el [ Oklch.fontColor Oklch.blue ] label, url = urlString }

                Nothing ->
                    el [ Font.color Color.black ] label

        printFriendlyLink : Element msg
        printFriendlyLink =
            case url of
                Just urlString ->
                    column [ spacing 7 ] [ label, newTabLink [ Oklch.fontColor Oklch.blue ] { label = preparedParagraph urlString, url = urlString } ]

                Nothing ->
                    label
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


printableLinkHorizontal : DeviceClass -> { url : String, labelText : String, printAs : Maybe String } -> Element msg
printableLinkHorizontal deviceClass { url, labelText, printAs } =
    let
        nonPrintableLink : Element msg
        nonPrintableLink =
            newTabLink [] { label = el [ Oklch.fontColor Oklch.blue ] <| preparedParagraph labelText, url = url }

        printFriendlyLink : Element msg
        printFriendlyLink =
            wrappedRow [ spacing 7 ]
                [ preparedParagraph (labelText ++ ":")
                , newTabLink [ Oklch.fontColor Oklch.blue ] { label = preparedParagraph <| Maybe.withDefault url printAs, url = url }
                ]
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
