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
import Util.Style exposing (pageHeading, printableLinkHorizontal, sectionHeading)
import VitePluginHelper


bioSection : Element msg
bioSection =
    column [ width fill, spacing 16 ]
        [ el sectionHeading <| preparedParagraph "About me"
        , preparedParagraph "In programming, I thrive on a proactive and strategic approach that goes beyond relying solely on intuition, especially in unprecedented situations. I firmly believe in the importance of continuous learning and staying ahead of the curve. That's why I not only invest time in reading books well in advance but also actively engage in prototyping and experimenting with new technologies, ensuring that I am well-prepared to leverage them when the situation calls for it."
        , preparedParagraph "I am deeply passionate about functional programming and its ability to bring value to both companies and individual specialists. I not only focus on writing high-quality code but also invest significant time and attention in fostering strong relationships within the team. I actively organize meetups and reading groups at my workplaces, as well as promote collaborative practices like pair programming and pair testing, which I find to be highly effective."
        , preparedParagraph "Beyond my technical expertise, I bring entrepreneurial experience to the table. When working on personal projects, I take initiative, generate ideas, fill in any missing pieces, and deliver immediate results. I believe in taking ownership and refining the details later."
        , preparedParagraph "This is why I gravitate towards functional languages with strict static typing, such as Haskell, Elm, and Scala. I value the assurance provided by strict typing and algebraic data types (ADTs), enabling rapid development without the fear of design mistakes, as they can be easily resolved later. Additionally, leveraging code generation and utilizing a mono repository further accelerates our pace."
        , preparedParagraph "As an individual, I embrace a win-win mindset, avoiding a victim mentality and the need for constant approval. I openly respect and appreciate those who contribute to the growth and knowledge of others. My vision for my technical career is to create wealth and success for all involved through a combination of functional programming and strong teamwork."
        ]


summarySection : DeviceClass -> Element msg
summarySection deviceClass =
    let
        photo : Element msg
        photo =
            column
                [ width (px 260)
                , height (px 260)
                , alignTop
                ]
                [ image
                    [ width fill
                    , height fill
                    , Border.rounded 10
                    , clip
                    ]
                    { src = VitePluginHelper.asset "/assets/images/photo_460px.jpg"
                    , description = "Vladimir Logachev"
                    }
                ]

        summary : Element msg
        summary =
            column [ width fill, spacing 20, alignTop ]
                [ el pageHeading <| preparedParagraph "Vladimir Logachev"
                , column [ width fill, spacing 10 ]
                    [ preparedParagraph "🏴\u{200D}☠️ Creating products."
                    , preparedParagraph "🔋 Engineering every day."
                    , preparedParagraph "🧰 FP, Haskell, Elm, Scala, whatever."
                    , preparedParagraph ""
                    , preparedParagraph "Location: Remote"
                    , links
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
                [ printableLinkHorizontal deviceClass { labelText = "Mail", url = "mailto:vladimir@logachev.dev" }
                , printableLinkHorizontal deviceClass { labelText = "Telegram", url = "https://t.me/vladimirlogachev" }
                , printableLinkHorizontal deviceClass { labelText = "GitHub", url = "https://github.com/vladimirlogachev" }
                , printableLinkHorizontal deviceClass { labelText = "Twitter", url = "https://twitter.com/logachev_dev" }
                , printableLinkHorizontal deviceClass { labelText = "LinkedIn", url = "https://www.linkedin.com/in/vladimirlogachev" }
                , printableLinkHorizontal deviceClass { labelText = "Website", url = "https://logachev.dev" }
                , printableLinkHorizontal deviceClass { labelText = "Download cv", url = "https://logachev.dev/cv_vladimir_logachev.pdf" }
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
    { title = "Vladimir Logachev. 🏴\u{200D}☠️ Creating products. 🔋 Engineering every day. 🧰 FP, Haskell, Elm, Scala, whatever."
    , content =
        column [ spacing 30, width fill, height fill ]
            [ summarySection deviceClass
            , bioSection
            , column [ spacing 30 ] <| List.map (viewSkill deviceClass) Data.skills
            , viewIfNonEmpty "Commercial experience" (List.map (viewCommercialExperience deviceClass) Data.commercialExperience)
            , viewIfNonEmpty "Showcase projects and assessments" (List.map (viewProject deviceClass) Data.showcaseProjects)
            , viewIfNonEmpty "Notable contributions" (List.map (viewProject deviceClass) Data.contributions)
            , viewIfNonEmpty "Education and courses" (List.map (viewEducation deviceClass) Data.education)
            ]
    }
