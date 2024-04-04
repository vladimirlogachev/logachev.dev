module Page.Cv.Date exposing (Date, EndDate(..), showDate, showEndDate)


type alias Date =
    { month : Int, year : Int }


showDate : Date -> String
showDate d =
    (String.padLeft 2 '0' <| String.fromInt d.month)
        ++ "/"
        ++ (String.padLeft 4 '0' <| String.fromInt d.year)


type EndDate
    = EndedOn Date
    | PresentFullTime
    | PresentSpareTime


showEndDate : EndDate -> String
showEndDate ed =
    case ed of
        EndedOn d ->
            showDate d

        PresentFullTime ->
            "present (full time)"

        PresentSpareTime ->
            "present (spare time)"
