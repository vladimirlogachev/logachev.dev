module Pages.Home_ exposing (Model, Msg, page)

import Color
import Components.Image as Image
import Data
import Effect
import Element exposing (..)
import Element.Border as Border
import ExtraColor
import GridLayout2 exposing (..)
import Layouts
import Page exposing (Page)
import Route exposing (Route)
import Shared
import TextStyle
import Typography exposing (preparedText)
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
    column [ spacing layout.grid.gutter, width fill ]
        [ Image.view layout
            { widthSteps = 2, heightSteps = 2 }
            [ Border.rounded 1000, clip ]
            Data.photo
        , textSection layout
        ]


viewDesktop : LayoutState -> Element msg
viewDesktop layout =
    column [ spacing 60, width fill ]
        [ gridRow layout
            [ gridColumn layout
                { widthSteps = 6 }
                [ spacing layout.grid.gutter ]
                [ Image.view layout { widthSteps = 6, heightSteps = 10 } [ clip ] Data.photoHome
                ]
            , textSection layout
            ]
        ]


textSection : LayoutState -> Element msg
textSection layout =
    let
        showLink : { url : String, printAs : String } -> Element msg
        showLink { url, printAs } =
            newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedText printAs, url = url }
    in
    gridColumn layout
        { widthSteps = 6 }
        [ centerY, spacing <| layout.grid.gutter * 2 ]
        [ column [ spacing 16 ]
            [ paragraph TextStyle.headline.attrs [ text Data.myName ]
            , paragraph TextStyle.lead.attrs [ text "Software Engineer | Scala, Haskell, Elm, TypeScript" ]
            , paragraph [ width fill ] [ preparedText Data.location ]
            ]
        , column [ spacing 16 ] (List.map showLink Data.linksPrint)
        , newTabLink [ ExtraColor.fontColor Color.blue ] { label = preparedText "Download cv", url = "/cv_vladimir_logachev.pdf" }
        ]
