module Pages.Home_ exposing (Model, Msg, page)

import Color
import Components.Image as Image
import Data exposing (CommercialExperience, Date, Detail, Education, EndDate(..), Project, Skill)
import Effect
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import ExtraColor
import GridLayout2 exposing (..)
import Html.Attributes
import Layouts
import Page exposing (Page)
import Route exposing (Route)
import Shared
import TextStyle
import Typography exposing (nbsp, preparedText)
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
        |> Page.withLayout (always <| Layouts.WebappLayout {})


view : Shared.Model -> View msg
view { layout } =
    { title = Data.myName
    , attributes = []
    , element =
        case layout.screenClass of
            MobileScreen ->
                viewMobile layout

            DesktopScreen ->
                viewDesktop layout
    }


viewMoreLink : Element msg
viewMoreLink =
    paragraph []
        [ text "More contributions are listed on "
        , newTabLink []
            { label = el [ ExtraColor.fontColor Color.blue ] (text "my GitHub profile")
            , url = "https://github.com/vladimirlogachev/"
            }
        , text "."
        ]


viewMobile : LayoutState -> Element msg
viewMobile layout =
    column [ spacing 60, width fill ]
        [ viewContactsMobile layout
        , viewSection layout "Skills" <| List.map (viewSkillSet layout) Data.skills
        , viewSection layout "Experience" (List.map (viewCommercialExperience layout) Data.commercialExperience)
        , viewSection layout "Education" (List.map (viewEducation layout) Data.education)
        , viewSection layout "Open Source Contributions" (List.map (viewProject layout) Data.contributions ++ [ viewMoreLink ])
        ]


viewDesktop : LayoutState -> Element msg
viewDesktop layout =
    column [ spacing 60, width fill ]
        [ viewContactsDesktop layout
        , viewSection layout "Skills" <| List.map (viewSkillSet layout) Data.skills
        , viewSection layout "Experience" (List.map (viewCommercialExperience layout) Data.commercialExperience)
        , viewSection layout "Education" (List.map (viewEducation layout) Data.education)
        , viewSection layout "Open Source Contributions" (List.map (viewProject layout) Data.contributions ++ [ viewMoreLink ])
        ]


viewContactsMobile : LayoutState -> Element msg
viewContactsMobile layout =
    column [ width fill, spacing layout.grid.gutter ]
        [ Image.view layout
            { widthSteps = 3, heightSteps = 3 }
            [ Border.rounded 1000, clip ]
            Data.photo
        , paragraph TextStyle.headline.attrs [ preparedText Data.myName ]
        , gridRow layout
            [ paragraph (Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText "Location" ]
            , paragraph (widthOfGridSteps layout 4) [ preparedText Data.location ]
            ]
        , wrappedRow [ spacing layout.grid.gutter ] <| List.map externalLink Data.linksScreen
        ]


viewContactsDesktop : LayoutState -> Element msg
viewContactsDesktop layout =
    let
        contactsLinkForPrint : { url : String, labelText : String, printAs : String } -> Element msg
        contactsLinkForPrint { url, labelText, printAs } =
            wrappedRow [ spacing layout.grid.gutter ]
                [ paragraph (Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText (labelText ++ nbsp) ]
                , newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedText printAs, url = url }
                ]
    in
    gridRow layout
        [ Image.view layout
            { widthSteps = 3, heightSteps = 3 }
            [ Border.rounded 1000, clip ]
            Data.photo
        , gridColumn layout
            { widthSteps = 9 }
            [ spacing layout.grid.gutter ]
            [ paragraph TextStyle.headline.attrs [ preparedText Data.myName ]
            , column
                [ spacing 16, htmlAttribute <| Html.Attributes.class "only-screen" ]
                [ gridRow layout
                    [ paragraph (Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText "Location" ]
                    , paragraph [ width fill ] [ preparedText Data.location ]
                    ]
                , wrappedRow [ spacing layout.grid.gutter ] <| List.map externalLink Data.linksScreen
                ]
            , column [ spacing 10, htmlAttribute <| Html.Attributes.class "only-print" ]
                [ gridRow layout
                    [ paragraph (Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText "Location" ]
                    , paragraph [ width fill ] [ preparedText Data.location ]
                    ]
                , column [ width fill, spacing 10 ] <| List.map contactsLinkForPrint Data.linksPrint
                ]
            ]
        ]


viewSkillSet : LayoutState -> Skill -> Element msg
viewSkillSet layout x =
    column [ width fill, spacing 20 ]
        [ paragraph (width fill :: TextStyle.header2.attrs) [ preparedText x.title ]
        , column [ width fill, spacing 16 ] <| List.map (viewDetail layout) x.details
        ]


viewCommercialExperience : LayoutState -> CommercialExperience -> Element msg
viewCommercialExperience layout x =
    column [ width fill, spacing 16 ]
        [ column [ width fill, spacing 10 ]
            [ paragraph TextStyle.header2.attrs [ preparedText x.role ]
            , titleWithOptionalLink layout
                { url = x.url
                , label = paragraph TextStyle.lead.attrs [ preparedText x.company ]
                }
            , paragraph [ Font.color Color.detail ]
                [ preparedText (showDate x.startDate ++ " — " ++ showEndDate x.endDate) ]
            ]
        , column [ width fill, spacing 10 ] <| List.map (\line -> paragraph [] [ preparedText line ]) x.roleDescription
        , column [ width fill, spacing 10 ] <| List.map (viewDetail layout) x.details
        ]


viewEducation : LayoutState -> Education -> Element msg
viewEducation layout x =
    column [ spacing 10 ]
        [ titleWithOptionalLink layout
            { url = x.url
            , label = paragraph TextStyle.header2.attrs [ preparedText x.title ]
            }
        , paragraph [ Font.color Color.detail ] [ preparedText x.details ]
        ]


viewProject : LayoutState -> Project -> Element msg
viewProject layout x =
    column [ spacing 16 ]
        [ titleWithOptionalLink layout { url = x.url, label = paragraph TextStyle.header2.attrs [ preparedText x.title ] }
        , paragraph [] [ preparedText x.description ]
        , paragraph [ Font.color Color.detail ] [ preparedText <| String.join ", " <| x.tags ]
        ]



-- Reusable helpers


viewDetail : LayoutState -> Detail -> Element msg
viewDetail layout x =
    gridRow layout
        [ paragraph (alignTop :: Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText x.name ]
        , paragraph [ alignTop, width fill ] [ preparedText <| String.join ", " <| x.tags ]
        ]


{-| Works as long as mobile and desktop have the same text styles.
If they become different, the whole helper better be removed.
-}
viewSection : LayoutState -> String -> List (Element msg) -> Element msg
viewSection layout title xs =
    column [ spacing layout.grid.gutter ]
        [ paragraph TextStyle.header.attrs [ preparedText title ]
        , column [ spacing layout.grid.gutter ] <| xs
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

        Present ->
            "present"


titleWithOptionalLink : LayoutState -> { url : Maybe String, label : Element msg } -> Element msg
titleWithOptionalLink layout { url, label } =
    case layout.screenClass of
        MobileScreen ->
            -- Mobile
            case url of
                Just urlString ->
                    newTabLink [] { label = el [ ExtraColor.fontColor Color.blue ] label, url = urlString }

                Nothing ->
                    el [ Font.color Color.black ] label

        -- Desktop and Print
        -- TODO: Separate desktop and print?
        DesktopScreen ->
            case url of
                Just urlString ->
                    column [ spacing 10 ]
                        [ label
                        , newTabLink [ ExtraColor.fontColor Color.blue ]
                            { label = paragraph [] [ preparedText urlString ], url = urlString }
                        ]

                Nothing ->
                    label


externalLink : { url : String, labelText : String } -> Element msg
externalLink { url, labelText } =
    newTabLink [] { label = paragraph [ ExtraColor.fontColor Color.blue ] [ preparedText labelText ], url = url }
