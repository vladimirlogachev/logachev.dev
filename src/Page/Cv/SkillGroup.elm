module Page.Cv.SkillGroup exposing (viewIfNonEmpty)

import Element exposing (..)
import Typography exposing (preparedParagraph)
import Util.Style exposing (sectionHeading)


viewIfNonEmpty : String -> List (Element msg) -> Element msg
viewIfNonEmpty title list =
    case list of
        [] ->
            none

        xs ->
            column [ spacing 32 ] [ el sectionHeading <| preparedParagraph title, column [ spacing 32 ] xs ]
