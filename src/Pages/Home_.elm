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


viewMobile : LayoutState -> Element msg
viewMobile layout =
    column [ spacing 60, width fill ]
        [ viewContactsMobile layout
        , viewSkillsMobile layout
        , viewExperienceMobile layout
        , viewEducationMobile layout
        , viewContributionsMobile layout
        , viewIfNonEmpty "Experience" (List.map (viewCommercialExperience layout) Data.commercialExperience)
        , viewIfNonEmpty "Education" (List.map (viewEducation layout) Data.education)
        , viewIfNonEmpty "Open Source Contributions" (List.map (viewProject layout) Data.contributions)
        ]


viewDesktop : LayoutState -> Element msg
viewDesktop layout =
    column [ spacing 60, width fill ]
        [ viewContactsDesktop layout
        , viewSkillsDesktop layout
        , viewExperienceDesktop layout
        , viewEducationDesktop layout
        , viewContributionsDesktop layout
        , viewIfNonEmpty "Experience" (List.map (viewCommercialExperience layout) Data.commercialExperience)
        , viewIfNonEmpty "Education" (List.map (viewEducation layout) Data.education)
        , viewIfNonEmpty "Open Source Contributions" (List.map (viewProject layout) Data.contributions)
        ]


viewContactsMobile : LayoutState -> Element msg
viewContactsMobile layout =
    column [ width fill, spacing layout.grid.gutter ]
        [ Image.view layout
            { widthSteps = 4, heightSteps = 4 }
            [ Border.rounded 8, clip ]
            Data.photo
        , paragraph TextStyle.headline.attrs [ preparedText Data.myName ]
        , gridRow layout
            [ paragraph (Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText "Location" ]
            , paragraph (widthOfGridSteps layout 4) [ preparedText Data.location ]
            ]
        , wrappedRow [ spacing layout.grid.gutter ] <| List.map screenLink Data.linksScreen
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
            [ Border.rounded 8, clip ]
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
                , wrappedRow [ spacing layout.grid.gutter ] <| List.map screenLink Data.linksScreen
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


viewSkillsMobile : LayoutState -> Element msg
viewSkillsMobile layout =
    column [ spacing layout.grid.gutter ]
        [ paragraph TextStyle.header.attrs [ preparedText "Skills" ]
        , column [ spacing layout.grid.gutter ] <| List.map (viewSkillSet layout) Data.skills
        ]


viewSkillsDesktop : LayoutState -> Element msg
viewSkillsDesktop layout =
    column [ spacing layout.grid.gutter ]
        [ paragraph TextStyle.header.attrs [ preparedText "Skills" ]
        , column [ spacing layout.grid.gutter ] <| List.map (viewSkillSet layout) Data.skills
        ]


viewSkillSet : LayoutState -> Skill -> Element msg
viewSkillSet layout x =
    column [ width fill, spacing 20 ]
        [ paragraph (width fill :: TextStyle.lead.attrs) [ preparedText x.title ]
        , column [ width fill, spacing 16 ] <| List.map (viewDetail layout) x.details
        ]


viewExperienceMobile : LayoutState -> Element msg
viewExperienceMobile layout =
    none


viewExperienceDesktop : LayoutState -> Element msg
viewExperienceDesktop layout =
    none


viewEducationMobile : LayoutState -> Element msg
viewEducationMobile layout =
    none


viewEducationDesktop : LayoutState -> Element msg
viewEducationDesktop layout =
    none


viewContributionsMobile : LayoutState -> Element msg
viewContributionsMobile layout =
    none


viewContributionsDesktop : LayoutState -> Element msg
viewContributionsDesktop layout =
    none



-- Reusable helpers


viewDetail : LayoutState -> Detail -> Element msg
viewDetail layout x =
    gridRow layout
        [ paragraph (alignTop :: Font.color Color.detail :: widthOfGridSteps layout 2) [ preparedText x.name ]
        , paragraph [ alignTop, width fill ] [ preparedText <| String.join ", " <| x.tags ]
        ]



-- ====================================================
-- ========================== LEGACY ==========================
-- ====================================================


viewCommercialExperience : LayoutState -> CommercialExperience -> Element msg
viewCommercialExperience layout x =
    column [ width fill, spacing 16 ]
        [ column [ width fill, spacing 10 ]
            [ paragraph TextStyle.lead.attrs [ preparedText x.role ]
            , printableLinkVertical layout { url = x.url, label = paragraph TextStyle.companyName.attrs [ preparedText x.company ] }
            , (showDate x.startDate ++ " — " ++ showEndDate x.endDate)
                |> preparedText
                |> el [ Font.color Color.detail ]
            ]
        , column [ width fill, spacing 16 ] <| List.map (\line -> paragraph [] [ preparedText line ]) x.roleDescription
        , column [ width fill, spacing 10 ] <| List.map (viewDetail layout) x.details
        ]


viewIfNonEmpty : String -> List (Element msg) -> Element msg
viewIfNonEmpty title list =
    case list of
        [] ->
            none

        xs ->
            column [ spacing 32 ] [ paragraph TextStyle.header.attrs [ preparedText title ], column [ spacing 32 ] xs ]


viewProject : LayoutState -> Project -> Element msg
viewProject layout x =
    column [ spacing 16 ]
        [ printableLinkVertical layout { url = x.url, label = paragraph TextStyle.lead.attrs [ preparedText x.title ] }
        , paragraph [] [ preparedText x.description ]
        , paragraph [ Font.color Color.detail ] [ preparedText <| String.join ", " <| x.tags ]
        ]


viewEducation : LayoutState -> Education -> Element msg
viewEducation layout x =
    column [ spacing 10 ]
        [ printableLinkVertical layout { url = x.url, label = paragraph TextStyle.lead.attrs [ preparedText x.title ] }
        , paragraph [ Font.color Color.detail ] [ preparedText x.details ]
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
                    column [] [ label, newTabLink [ ExtraColor.fontColor Color.blue ] { label = paragraph [] [ preparedText urlString ], url = urlString } ]

                Nothing ->
                    label


screenLink : { url : String, labelText : String } -> Element msg
screenLink { url, labelText } =
    newTabLink [] { label = paragraph [ ExtraColor.fontColor Color.blue ] [ preparedText labelText ], url = url }
