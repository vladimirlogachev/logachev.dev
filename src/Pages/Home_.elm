module Pages.Home_ exposing (Model, Msg, page)

import Color
import Data exposing (CommercialExperience, Date, Detail, Education, EndDate(..), Project, Skill)
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import GridLayout2 exposing (LayoutState, ScreenClass(..))
import Html.Attributes
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Typography exposing (nbsp, preparedText)
import Util.Style exposing (contactsKeyColumnWidth, fontFamilyGeneral, itemHeading, keyColumnWidth, pageHeading, preparedParagraph, printLinkHorizontal, printableLinkVertical, screenLink, sectionHeading)
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
view { layout } =
    let
        viewContent : Element msg
        viewContent =
            column [ spacing 60, width fill, height fill ]
                [ viewContacts layout

                -- , viewSummary layout
                , viewIfNonEmpty "Skills" <| List.map viewSkill Data.skills
                , viewIfNonEmpty "Experience" (List.map (viewCommercialExperience layout) Data.commercialExperience)

                -- , viewIfNonEmpty "Showcase projects and assessments" (List.map (viewProject layout) Data.showcaseProjects)
                , viewIfNonEmpty "Education" (List.map (viewEducation layout) Data.education)
                , viewIfNonEmpty "Open Source Contributions" (List.map (viewProject layout) Data.contributions)
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
            [ wrap layout viewContent
            ]
    }


wrap : LayoutState -> Element msg -> Element msg
wrap layout content =
    let
        pageInnerWidth : Length
        pageInnerWidth =
            case layout.screenClass of
                MobileScreen ->
                    fill

                DesktopScreen ->
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


viewContacts : LayoutState -> Element msg
viewContacts layout =
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
    case layout.screenClass of
        MobileScreen ->
            column [ width fill, spacing 20 ] [ photo, summary ]

        DesktopScreen ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]



-- ====================================================
-- ========================== LEGACY ==========================
-- ====================================================


viewDetail : Detail -> Element msg
viewDetail y =
    row [ width fill ]
        [ el [ Font.color Color.detail, width (px keyColumnWidth), alignTop ] <| text (y.name ++ nbsp)
        , paragraph [ alignTop ] [ preparedText <| String.join ", " <| y.tags ]
        ]


viewCommercialExperience : LayoutState -> CommercialExperience msg -> Element msg
viewCommercialExperience layout x =
    column [ width fill, spacing 16 ]
        [ column [ width fill, spacing 10 ]
            [ el itemHeading <| preparedParagraph x.role
            , printableLinkVertical layout { url = x.url, label = el [ Region.heading 4, Font.medium, Font.size 20 ] <| preparedParagraph x.company }
            , (showDate x.startDate ++ " — " ++ showEndDate x.endDate)
                |> preparedText
                |> el [ Font.color Color.detail ]
            ]
        , column [ width fill, spacing 16 ] <| x.roleDescription
        , column [ width fill, spacing 10 ] <| List.map viewDetail x.details
        ]


viewSkill : Skill -> Element msg
viewSkill x =
    column [ alignTop, width fill, spacing 20 ]
        [ el (width fill :: itemHeading) <| preparedParagraph x.title
        , column [ width fill, spacing 16 ] <| List.map viewDetail x.details
        ]


viewIfNonEmpty : String -> List (Element msg) -> Element msg
viewIfNonEmpty title list =
    case list of
        [] ->
            none

        xs ->
            column [ spacing 32 ] [ el sectionHeading <| preparedParagraph title, column [ spacing 32 ] xs ]


viewProject : LayoutState -> Project -> Element msg
viewProject layout x =
    column [ spacing 16 ]
        [ printableLinkVertical layout { url = x.url, label = el itemHeading <| preparedParagraph x.title }
        , preparedParagraph x.description
        , el [ Font.color Color.detail ] <| preparedParagraph <| String.join ", " <| x.tags
        ]


viewEducation : LayoutState -> Education -> Element msg
viewEducation layout x =
    column [ spacing 10 ]
        [ printableLinkVertical layout { url = x.url, label = el itemHeading <| preparedParagraph x.title }
        , preparedParagraph x.details |> el [ Font.color Color.detail ]
        ]


showDate : Date -> String
showDate d =
    (String.padLeft 2 '0' <| String.fromInt d.month)
        ++ "/"
        ++ (String.padLeft 4 '0' <| String.fromInt d.year)


showEndDate : EndDate -> String
showEndDate ed =
    case ed of
        EndedOn d ->
            showDate d

        PresentFullTime ->
            "present (full time)"

        PresentSpareTime ->
            "present (spare time)"
