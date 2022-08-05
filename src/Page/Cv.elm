module Page.Cv exposing (view)

import Element exposing (..)
import Element.Border as Border
import Page exposing (ElementDocument)
import Page.Cv.Data exposing (skillGroups)
import Page.Cv.SkillGroup exposing (viewSkillGroup)
import Typography exposing (preparedParagraph)
import Util.Style exposing (pageHeading, printableLinkHorizontal, sectionHeading)


bioSection : Element msg
bioSection =
    column [ width fill, spacing 16 ]
        [ el sectionHeading <| preparedParagraph "About me"
        , preparedParagraph "In programming, I prefer not to rely on intuition (which, I believe, is usually based on previous experiences and tends to fail in unprecedented situations), but instead, read books well in advance."
        , preparedParagraph "I like to see functional programming deliver value to both companies and individual specialists, so I devote a lot of time and attention not only to code but also to people. I'm a big fan of meetups and reading groups, which I run at my workplaces from time to time, and also I consider pair programming and pair testing to be very effective practices."
        , preparedParagraph "In addition to technical experience, I have entrepreneurial experience, so on my personal projects, I act without a need for instructions, come up with ideas, fill in the missing pieces myself, produce an immediate result, and apply the polishing later."
        , preparedParagraph "That's why I prefer functional languages that implement strict static typing, such as Haskell and Elm. My preference is based on the idea that once we have strict static typing and ADTs, we can move very quickly without fear of making design mistakes because they become easy to solve later. (And we can move even more quickly with the help of code generation and mono repository)."
        , preparedParagraph "As a person, I love the win-win approach, I don't play a victim, I don't seek approval and I do publically respect everyone who helps others or has knowledge. So, the vision of my technical career is that FP and strong teamwork can make everyone involved rich."
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
                    { src = "https://avatars2.githubusercontent.com/u/17773003?s=600"
                    , description = "Vladimir Logachev"
                    }
                ]

        summary : Element msg
        summary =
            column [ width fill, spacing 20, alignTop ]
                [ el pageHeading <| preparedParagraph "Vladimir Logachev"
                , column [ width fill, spacing 10 ]
                    [ preparedParagraph "Haskell, Elm, PureScript, Scala, functional programming, crypto"
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
    { title = "Vladimir Logachev. Haskell, Elm, Functional programming"
    , content =
        column [ spacing 30, width fill, height fill ]
            [ summarySection deviceClass
            , bioSection
            , column [ spacing 60 ] <| List.map (viewSkillGroup deviceClass) skillGroups
            ]
    }
