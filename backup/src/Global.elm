module Global exposing (Flags, Global, WindowSize)

import Browser.Navigation as Nav


type alias Global =
    { windowSize : WindowSize
    , navKey : Nav.Key
    }


type alias WindowSize =
    { height : Int
    , width : Int
    }


type alias Flags =
    { windowSize : WindowSize
    }
