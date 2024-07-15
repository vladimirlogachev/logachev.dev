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
import InlineStyle
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
                viewDesktop layout

            DesktopScreen ->
                viewDesktop layout
    }


viewMobile : LayoutState -> Element msg
viewMobile layout =
    column [ spacing 60, width fill ]
        [ text "no mobile" ]


viewDesktop : LayoutState -> Element msg
viewDesktop layout =
    let
        contactsLinkForPrint : { url : String, labelText : String, printAs : String } -> Element msg
        contactsLinkForPrint { url, labelText, printAs } =
            newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedText printAs, url = url }
    in
    column [ spacing 60, width fill ]
        [ gridRow layout
            [ gridColumn layout
                { widthSteps = 6 }
                [ spacing layout.grid.gutter ]
                [ Image.view layout { widthSteps = 6, heightSteps = 10 } [ clip ] Data.photoHome
                ]
            , gridColumn layout
                { widthSteps = 6 }
                [ centerY, spacing 48 ]
                [ column [ spacing 16 ]
                    [ paragraph TextStyle.headline.attrs [ text Data.myName ]
                    , paragraph TextStyle.lead.attrs [ text "Software Engineer | Scala, Haskell, Elm, TypeScript" ]
                    , paragraph [ width fill ] [ preparedText Data.location ]
                    ]
                , column [ spacing 16 ] (List.map contactsLinkForPrint Data.linksPrint)
                , newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedText "Download cv", url = "https://logachev.dev/cv_vladimir_logachev.pdf" }
                ]
            ]
        ]
