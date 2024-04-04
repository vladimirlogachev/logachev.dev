module Main exposing (Model, Msg(..), PageModel, main)

import Browser
import Browser.Events as E
import Browser.Navigation as Nav
import Element exposing (classifyDevice)
import Global exposing (Flags, Global, WindowSize)
import Page
import Page.Cv as Cv
import Route exposing (Route)
import Url


type alias PageModel =
    ()


type alias Model =
    { global : Global
    , pageModel : PageModel
    }


type Msg
    = -- global Msgs
      GotNewWindowSize WindowSize
    | RouteChange Url.Url
    | UrlRequested Browser.UrlRequest


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , subscriptions = subscriptions
        , view = view
        , update = update
        , onUrlChange = RouteChange
        , onUrlRequest = UrlRequested
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    let
        childSub : Sub Msg
        childSub =
            Sub.none
    in
    Sub.batch
        [ childSub
        , E.onResize (\w h -> GotNewWindowSize { height = h, width = w })
        ]


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url navKey =
    let
        global : Global
        global =
            fromFlags flags navKey

        ( route, navCmd ) =
            Route.parseUrl navKey url

        ( newModel, initCmd ) =
            changeRouteTo route global
    in
    ( newModel
    , Cmd.batch
        [ navCmd
        , initCmd
        ]
    )


fromFlags : Flags -> Nav.Key -> Global
fromFlags flags navKey =
    { windowSize = flags.windowSize
    , navKey = navKey
    }


changeRouteTo : Route -> Global -> ( Model, Cmd Msg )
changeRouteTo _ global =
    ( (), Cmd.none )
        |> updateWith global (always ()) identity


updateWindowSize : WindowSize -> Global -> Global
updateWindowSize windowSize global =
    { global | windowSize = windowSize }


updateWith : Global -> (subModel -> PageModel) -> (subMsg -> Msg) -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith global wrapModel wrapMsg ( subModel, subCmd ) =
    ( { global = global
      , pageModel = wrapModel subModel
      }
    , Cmd.map wrapMsg subCmd
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ global, pageModel } as model) =
    case ( msg, pageModel ) of
        -- global Msgs
        ( GotNewWindowSize windowSize, _ ) ->
            ( { model | global = updateWindowSize windowSize global }, Cmd.none )

        ( RouteChange url, _ ) ->
            let
                ( route, navCmd ) =
                    Route.parseUrl global.navKey url

                ( newModel, initCmd ) =
                    changeRouteTo route global
            in
            ( newModel, Cmd.batch [ navCmd, initCmd ] )

        ( UrlRequested urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl global.navKey (Url.toString url) )

                Browser.External url ->
                    ( model, Nav.load url )


view : Model -> Browser.Document Msg
view ({ global } as model) =
    let
        viewPage : Page.Page -> (msg -> Msg) -> Page.ElementDocument msg -> Browser.Document Msg
        viewPage page toMsg document =
            Page.view toMsg model.global page document
    in
    viewPage Page.Cv identity (Cv.view (classifyDevice global.windowSize).class)
