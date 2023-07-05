module Page exposing (ElementDocument, Page(..), view)

import Browser
import Color
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Global exposing (Global)
import Util.Style exposing (fontFamilyGeneral, maxDesktopInnerWidth)


type alias ElementDocument msg =
    { title : String, content : Element msg }


type Page
    = Cv


view : (subMsg -> msg) -> Global -> Page -> ElementDocument subMsg -> Browser.Document msg
view toMsg global _ { title, content } =
    { title = title
    , body =
        [ Element.layout
            [ Background.color Color.white
            , Font.color Color.black
            , width fill
            , Font.size 16
            , fontFamilyGeneral
            ]
            (column [ width fill, height fill ]
                [ viewContent toMsg global content
                ]
            )
        ]
    }


viewContent : (subMsg -> msg) -> Global -> Element subMsg -> Element msg
viewContent toMsg global content =
    let
        pageInnerWidth : Length
        pageInnerWidth =
            case (classifyDevice global.windowSize).class of
                Phone ->
                    fill

                Tablet ->
                    fill

                _ ->
                    fill |> maximum maxDesktopInnerWidth
    in
    row [ width fill, height fill ]
        [ el
            [ width pageInnerWidth
            , centerX
            , paddingEach { top = 40, right = 20, bottom = 60, left = 20 }
            , height fill
            ]
            (Element.map toMsg content)
        ]
