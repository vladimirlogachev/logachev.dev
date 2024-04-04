module Pages.Home_ exposing (Model, Msg, page)

import Color
import Effect
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (address)
import Html.Attributes
import InlineStyle
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Typography exposing (nbsp, preparedText)
import View exposing (View)
import Window exposing (ScreenClass(..))


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
    { title = "Vladimir Logachev"
    , attributes = []
    , element = text "Oh hi! :D"
    }
