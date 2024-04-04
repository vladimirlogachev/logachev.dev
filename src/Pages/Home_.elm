module Pages.Home_ exposing (Model, Msg, page)

import Color
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Page exposing (Page)
import Page.Cv.CommercialExperience exposing (viewCommercialExperience)
import Page.Cv.Data as Data
import Page.Cv.Education exposing (viewEducation)
import Page.Cv.Project exposing (viewProject)
import Page.Cv.Skill exposing (viewSkill)
import Page.Cv.SkillGroup exposing (viewIfNonEmpty)
import Route exposing (Route)
import Shared
import Typography exposing (preparedParagraph)
import Util.Style exposing (fontFamilyGeneral, pageHeading, printableLinkHorizontal)
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
        deviceClass =
            (classifyDevice shared.window).class

        viewContent =
            column [ spacing 30, width fill, height fill ]
                [ viewContacts deviceClass

                -- , viewSummary deviceClass
                , viewIfNonEmpty "Skills" <| List.map viewSkill Data.skills
                , viewIfNonEmpty "Experience" (List.map (viewCommercialExperience deviceClass) Data.commercialExperience)

                -- , viewIfNonEmpty "Showcase projects and assessments" (List.map (viewProject deviceClass) Data.showcaseProjects)
                , viewIfNonEmpty "Education" (List.map (viewEducation deviceClass) Data.education)

                -- , column [ height (px 0) ] [] -- separator
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
                    [ {- preparedParagraph "🏴\u{200D}☠️ I make software succeed"
                         ,
                      -}
                      preparedParagraph "Location: Armenia (remote)"
                    , links
                    ]
                ]

        linksContainer : List (Element msg) -> Element msg
        linksContainer =
            case deviceClass of
                Phone ->
                    wrappedRow [ spacing 10 ]

                Tablet ->
                    wrappedRow [ spacing 10 ]

                Desktop ->
                    column [ width fill, spacing 10 ]

                BigDesktop ->
                    column [ width fill, spacing 10 ]

        links : Element msg
        links =
            linksContainer
                [ printableLinkHorizontal deviceClass
                    { labelText = "Mail"
                    , url = "mailto:vladimir@logachev.dev"
                    , printAs = Just "vladimir@logachev.dev"
                    }
                , printableLinkHorizontal deviceClass
                    { labelText = "Telegram"
                    , url = "https://t.me/vladimirlogachev"
                    , printAs = Just "vladimirlogachev"
                    }
                , printableLinkHorizontal deviceClass
                    { labelText = "GitHub"
                    , url = "https://github.com/vladimirlogachev"
                    , printAs = Just "vladimirlogachev"
                    }

                -- , printableLinkHorizontal deviceClass
                --     { labelText = "Twitter"
                --     , url = "https://twitter.com/logachev_dev"
                --     , printAs = Just "logachev_dev"
                --     }
                , printableLinkHorizontal deviceClass
                    { labelText = "LinkedIn"
                    , url = "https://www.linkedin.com/in/vladimirlogachev"
                    , printAs = Just "vladimirlogachev"
                    }

                -- , printableLinkHorizontal deviceClass
                --     { labelText = "Website"
                --     , url = "https://logachev.dev"
                --     , printAs = Just "logachev.dev"
                --     }
                , printableLinkHorizontal deviceClass
                    { labelText = "Download cv"
                    , url = "https://logachev.dev/cv_vladimir_logachev.pdf"
                    , printAs = Just "cv_vladimir_logachev.pdf"
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
