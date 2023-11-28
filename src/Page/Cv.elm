module Page.Cv exposing (view)

import Element exposing (..)
import Element.Border as Border
import Page exposing (ElementDocument)
import Page.Cv.CommercialExperience exposing (viewCommercialExperience)
import Page.Cv.Data as Data
import Page.Cv.Education exposing (viewEducation)
import Page.Cv.Project exposing (viewProject)
import Page.Cv.Skill exposing (viewSkill)
import Page.Cv.SkillGroup exposing (viewIfNonEmpty)
import Typography exposing (preparedParagraph)
import Util.Style exposing (pageHeading, printableLinkHorizontal)
import VitePluginHelper


summarySection : DeviceClass -> Element msg
summarySection deviceClass =
    let
        photo : Element msg
        photo =
            column
                [ width (px 180)
                , height (px 180)
                , alignTop
                ]
                [ image
                    [ width fill
                    , height fill
                    , Border.rounded 10
                    , clip
                    ]
                    { src = VitePluginHelper.asset "/assets/images/photo.jpg"
                    , description = "Vladimir Logachev"
                    }
                ]

        summary : Element msg
        summary =
            column [ width fill, spacing 20, alignTop ]
                [ el pageHeading <| preparedParagraph "Vladimir Logachev"
                , column [ width fill, spacing 10 ]
                    [ preparedParagraph "Location: Armenia (remote)"
                    , links
                    , preparedParagraph "🏴\u{200D}☠️ Creating products. 🔋 Engineering every day."
                    ]
                ]

        linksContainer : List (Element msg) -> Element msg
        linksContainer =
            case deviceClass of
                Phone ->
                    wrappedRow [ spacing 10 ]

                Tablet ->
                    wrappedRow [ spacing 10 ]

                Desktop ->
                    column [ width fill, spacing 10 ]

                BigDesktop ->
                    column [ width fill, spacing 10 ]

        links : Element msg
        links =
            linksContainer
                [ printableLinkHorizontal deviceClass
                    { labelText = "Mail"
                    , url = "mailto:vladimir@logachev.dev"
                    , printAs = Just "vladimir@logachev.dev"
                    }

                -- , printableLinkHorizontal deviceClass { labelText = "Telegram", url = "https://t.me/vladimirlogachev" }
                , printableLinkHorizontal deviceClass
                    { labelText = "GitHub"
                    , url = "https://github.com/vladimirlogachev"
                    , printAs = Nothing
                    }

                -- , printableLinkHorizontal deviceClass { labelText = "Twitter", url = "https://twitter.com/logachev_dev" }
                -- , printableLinkHorizontal deviceClass { labelText = "LinkedIn", url = "https://www.linkedin.com/in/vladimirlogachev" }
                -- , printableLinkHorizontal deviceClass { labelText = "Website", url = "https://logachev.dev" }
                -- , printableLinkHorizontal deviceClass { labelText = "Download cv", url = "https://logachev.dev/cv_vladimir_logachev.pdf" }
                ]
    in
    case deviceClass of
        Phone ->
            column [ width fill, spacing 20 ] [ photo, summary ]

        Tablet ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]

        Desktop ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]

        BigDesktop ->
            wrappedRow [ width fill, spacing 50 ] [ photo, summary ]


view : DeviceClass -> ElementDocument msg
view deviceClass =
    { title = "Vladimir Logachev." --  🏴\u{200D}☠️ Creating products. 🔋 Engineering every day. 🧰 FP, Haskell, Elm, Scala, whatever.
    , content =
        column [ spacing 30, width fill, height fill ]
            [ summarySection deviceClass

            -- , bioSection
            , viewIfNonEmpty "Experience" (List.map (viewCommercialExperience deviceClass) Data.commercialExperience)
            , viewIfNonEmpty "Open Source Contributions" (List.map (viewProject deviceClass) Data.contributions)

            -- , viewIfNonEmpty "Showcase projects and assessments" (List.map (viewProject deviceClass) Data.showcaseProjects)
            , viewIfNonEmpty "Education" (List.map (viewEducation deviceClass) Data.education)
            , column [ height (px 50) ] []
            , viewIfNonEmpty "Skills" <| List.map viewSkill Data.skills
            ]
    }
