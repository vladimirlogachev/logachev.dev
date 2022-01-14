module Page.Cv.Date exposing (Date, showDate)


type alias Date =
    { month : Int, year : Int }


showDate : Date -> String
showDate d =
    (String.padLeft 2 '0' <| String.fromInt d.month)
        ++ "/"
        ++ (String.padLeft 4 '0' <| String.fromInt d.year)
