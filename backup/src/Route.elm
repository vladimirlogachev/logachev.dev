module Route exposing (Route(..), parseUrl)

import Browser.Navigation as Nav
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, oneOf)


type Route
    = Cv


defaultRoute : Route
defaultRoute =
    Cv


routeToPieces : Route -> List String
routeToPieces _ =
    [ "cv" ]


toUrlPath : Route -> String
toUrlPath page =
    "/" ++ String.join "/" (routeToPieces page)


publicRoutes : List (Parser (Route -> c) c)
publicRoutes =
    [ Parser.map Cv (Parser.s "cv")
    ]


parseUrl : Nav.Key -> Url -> ( Route, Cmd msg )
parseUrl key url =
    let
        replaceUrl : Route -> Cmd msg
        replaceUrl route =
            Nav.pushUrl key (toUrlPath route)

        fallbackRoute : Route
        fallbackRoute =
            defaultRoute

        parseWithDefault : List (Parser (Route -> Route) Route) -> ( Route, Cmd msg )
        parseWithDefault a =
            Parser.parse (oneOf a) url
                |> Maybe.map (\m -> ( m, Cmd.none ))
                |> Maybe.withDefault ( fallbackRoute, replaceUrl fallbackRoute )
    in
    parseWithDefault publicRoutes
