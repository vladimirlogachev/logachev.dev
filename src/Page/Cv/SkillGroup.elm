module Page.Cv.SkillGroup exposing (SkillGroup, viewSkillGroup)

import Element exposing (..)
import Page.Cv.CommercialExperience exposing (CommercialExperience, viewCommercialExperience)
import Page.Cv.Education exposing (Education, viewEducation)
import Page.Cv.Project exposing (Project, viewProject)
import Page.Cv.Skill exposing (Skill, viewSkill)
import Typography exposing (preparedParagraph)
import Util.Style exposing (sectionHeading)


type alias SkillGroup msg =
    { skills : List Skill
    , commercialExperience : List (CommercialExperience msg)
    , showcaseProjects : List Project
    , contributions : List Project
    , education : List Education
    }


viewEmptyList : String -> List (Element msg) -> Element msg
viewEmptyList title list =
    case list of
        [] ->
            none

        xs ->
            column [ spacing 20 ] [ el sectionHeading <| preparedParagraph title, column [ spacing 20 ] xs ]


viewSkillGroup : DeviceClass -> SkillGroup msg -> Element msg
viewSkillGroup deviceClass x =
    column [ spacing 40 ]
        [ column [ spacing 30 ] <| List.map (viewSkill deviceClass) x.skills
        , viewEmptyList "Commercial experience" (List.map (viewCommercialExperience deviceClass) x.commercialExperience)
        , viewEmptyList "Showcase projects and assessments" (List.map (viewProject deviceClass) x.showcaseProjects)
        , viewEmptyList "Notable contributions" (List.map (viewProject deviceClass) x.contributions)
        , viewEmptyList "Education and courses" (List.map (viewEducation deviceClass) x.education)
        ]
