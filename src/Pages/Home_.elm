module Pages.Home_ exposing (Model, Msg, page)

import Color
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html.Attributes
import Page exposing (Page)
import Page.Cv.CommercialExperience exposing (viewCommercialExperience)
import Page.Cv.Data as Data
import Page.Cv.Education exposing (viewEducation)
import Page.Cv.Project exposing (viewProject)
import Page.Cv.Skill exposing (viewSkill)
import Page.Cv.SkillGroup exposing (viewIfNonEmpty)
import Route exposing (Route)
import Shared
import Typography exposing (nbsp, preparedParagraph)
import Util.Style exposing (contactsKeyColumnWidth, fontFamilyGeneral, pageHeading, printLinkHorizontal, screenLink)
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    ()


page : Shared.Model -> Route () -> Page Model Msg
page shared _ =
    Page.new
        { init = always ( (), Effect.none )
        , update = \_ _ -> ( (), Effect.none )
        , subscriptions = always Sub.none
        , view = always <| view shared
        }


view : Shared.Model -> View msg
view shared =
    let
        deviceClass : DeviceClass
        deviceClass =
            (classifyDevice shared.window).class

        viewContent : Element msg
        viewContent =
            column [ spacing 60, width fill, height fill ]
                [ viewContacts deviceClass

                -- , viewSummary deviceClass
                , viewIfNonEmpty "Skills" <| List.map viewSkill Data.skills
                , viewIfNonEmpty "Experience" (List.map (viewCommercialExperience deviceClass) Data.commercialExperience)

                -- , viewIfNonEmpty "Showcase projects and assessments" (List.map (viewProject deviceClass) Data.showcaseProjects)
                , viewIfNonEmpty "Education" (List.map (viewEducation deviceClass) Data.education)
                , viewIfNonEmpty "Open Source Contributions" (List.map (viewProject deviceClass) Data.contributions)
                ]
    in
    { title = "Vladimir Logachev"
    , attributes =
        [ Background.color Color.white
        , Font.color Color.black
        , width fill
        , Font.size 16
        , fontFamilyGeneral
        ]
    , element =
        column [ width fill, height fill ]
            [ wrap shared viewContent
            ]
    }


wrap : Shared.Model -> Element msg -> Element msg
wrap shared content =
    let
        pageInnerWidth : Length
        pageInnerWidth =
            case (classifyDevice shared.window).class of
                Phone ->
                    fill

                Tablet ->
                    fill

                _ ->
                    fill |> maximum Util.Style.maxDesktopInnerWidth
    in
    row [ width fill, height fill ]
        [ el
            [ width pageInnerWidth
            , centerX
            , paddingEach { top = 40, right = 20, bottom = 60, left = 20 }
            , height fill
            ]
            content
        ]


viewContacts : DeviceClass -> Element msg
viewContacts deviceClass =
    let
        photo : Element msg
        photo =
            column
                [ width (px 180)
                , height (px 180)
                , alignTop
                ]
                [ image
                    [ width fill
                    , height fill
                    , Border.rounded 10
                    , clip
                    ]
                    { src = "/images/photo.jpg"
                    , description = "Vladimir Logachev"
                    }
                ]

        summary : Element msg
        summary =
            column [ width fill, spacing 20, alignTop ]
                [ el pageHeading <| preparedParagraph "Vladimir Logachev"
                , column [ width fill, spacing 10 ]
                    [ column [ spacing 10, htmlAttribute <| Html.Attributes.class "only-screen" ]
                        [ row []
                            [ el [ Font.color Color.detail, width (px contactsKeyColumnWidth) ] <| preparedParagraph ("Location" ++ nbsp)
                            , text "Armenia (remote)"
                            ]
                        , linksScreen
                        ]
                    , column [ spacing 10, htmlAttribute <| Html.Attributes.class "only-print" ]
                        [ row []
                            [ el [ Font.color Color.detail, width (px contactsKeyColumnWidth) ] <| preparedParagraph ("Location" ++ nbsp)
                            , text "Armenia (remote)"
                            ]
                        , linksPrint
                        ]
                    ]
                ]

        linksScreen : Element msg
        linksScreen =
            wrappedRow [ spacing 20 ]
                [ screenLink
                    { labelText = "Mail"
                    , url = "mailto:vladimir@logachev.dev"
                    }
                , screenLink
                    { labelText = "Telegram"
                    , url = "https://t.me/vladimirlogachev"
                    }
                , screenLink
                    { labelText = "GitHub"
                    , url = "https://github.com/vladimirlogachev"
                    }
                , screenLink
                    { labelText = "LinkedIn"
                    , url = "https://www.linkedin.com/in/vladimirlogachev"
                    }
                , screenLink
                    { labelText = "Download cv"
                    , url = "https://logachev.dev/cv_vladimir_logachev.pdf"
                    }
                ]

        linksPrint : Element msg
        linksPrint =
            column [ width fill, spacing 10 ]
                [ printLinkHorizontal
                    { labelText = "Mail"
                    , url = "mailto:vladimir@logachev.dev"
                    , printAs = Just "vladimir@logachev.dev"
                    }
                , printLinkHorizontal
                    { labelText = "Telegram"
                    , url = "https://t.me/vladimirlogachev"
                    , printAs = Just "vladimirlogachev"
                    }
                , printLinkHorizontal
                    { labelText = "GitHub"
                    , url = "https://github.com/vladimirlogachev"
                    , printAs = Just "vladimirlogachev"
                    }
                , printLinkHorizontal
                    { labelText = "LinkedIn"
                    , url = "https://www.linkedin.com/in/vladimirlogachev"
                    , printAs = Just "vladimirlogachev"
                    }
                , printLinkHorizontal
                    { labelText = "Website"
                    , url = "https://logachev.dev"
                    , printAs = Just "logachev.dev"
                    }
                ]
    in
    case deviceClass of
        Phone ->
            column [ width fill, spacing 20 ] [ photo, summary ]

        Tablet ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]

        Desktop ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]

        BigDesktop ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]
