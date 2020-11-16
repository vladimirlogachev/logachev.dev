module Cv exposing (view)

import Css exposing (..)
import Css.Media as Media exposing (only, orientation, portrait, print, screen, withMedia)
import Css.Transitions exposing (marginLeft3)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, attribute, css, href, src, title)


view : Html msg
view =
    div [ styles.page ]
        [ heading
        , aboutSection
        , contributionsSection
        , educationSection
        , experienceSection
        ]


mediaMobile : List Style -> Style
mediaMobile =
    withMedia [ only screen [ Media.maxWidth (px 600) ] ]


mediaScreen : List Style -> Style
mediaScreen =
    withMedia [ only screen [] ]


mediaPrint : List Style -> Style
mediaPrint =
    withMedia [ only print [] ]


noOpener : Html.Styled.Attribute msg
noOpener =
    attribute "rel" "noopener noreferrer"


targetBlank : Html.Styled.Attribute msg
targetBlank =
    Attributes.target "_blank"


styles =
    { page =
        css
            [ padding4 (px 32) (px 16) (px 16) (px 32)
            , margin2 zero auto
            , withMedia [ only screen [] ] [ maxWidth (px 768) ]
            , fontFamilies [ "Source Sans Pro", "sans-serif" ]
            , fontStyle normal
            , color (hex "212121")
            , fontWeight normal
            , fontSize (px 16)
            , lineHeight (px 20)
            ]
    , itemBox =
        css
            [ displayFlex
            , flexDirection column
            , marginBottom (px 16)
            , property "break-inside" "avoid"
            ]
    , section =
        css
            [ width (pct 100)
            , marginBottom (px 32)
            ]
    , headerSection =
        css
            [ displayFlex
            , mediaMobile [ flexDirection column ]
            ]
    , headerTextContent =
        css
            [ displayFlex
            , flexDirection column
            , marginLeft (px 32)
            , mediaMobile [ marginLeft zero, marginTop (px 24) ]
            ]
    , photo =
        css
            [ width (px 200)
            , height (px 200)
            , borderRadius (px 8)
            ]

    -- Text styles
    , headerPrimary =
        css
            [ fontWeight bold
            , fontSize (px 32)
            , lineHeight (px 40)
            , marginBottom (px 12)
            ]
    , subheader =
        css
            [ fontWeight bold
            , fontSize (px 24)
            , lineHeight (px 30)
            , marginBottom (px 8)
            , property "break-after" "avoid"
            ]
    , item =
        css
            [ fontWeight normal
            , fontSize (px 20)
            , lineHeight (px 25)
            , marginBottom (px 4)
            ]
    , link =
        css
            [ color (hex "0d7da9")
            , textDecoration none
            ]
    , period =
        css
            [ fontWeight normal
            , fontSize (px 20)
            , lineHeight (px 25)
            , color (hex "707070")
            , marginLeft (px 12)
            ]
    , detail = css [ color (hex "707070") ]
    }


printableLink : String -> String -> Html msg
printableLink title url =
    span []
        [ span [ css [ marginRight (px 12), mediaPrint [ display none ] ] ]
            [ a [ styles.link, href url, targetBlank, noOpener ] [ text title ] ]
        , span [ css [ mediaScreen [ display none ] ] ]
            [ text <| title ++ ": "
            , a [ styles.link, href url, targetBlank, noOpener ] [ text url ]
            ]
        ]


icon filename altText =
    img
        [ css [ height (px 20), marginRight (px 12) ]
        , src <| "/logos/" ++ filename
        , alt altText
        , title altText
        ]
        []


heading : Html msg
heading =
    div [ styles.section, styles.headerSection ]
        [ img [ styles.photo, src "https://avatars2.githubusercontent.com/u/17773003?s=400" ] []
        , div
            [ styles.headerTextContent ]
            [ h1 [ styles.headerPrimary ] [ text "Vladimir Logachev" ]
            , div []
                [ icon "haskell.svg" "Haskell"
                , icon "elm.svg" "Elm"
                , icon "scala.svg" "Scala"
                ]
            , div [ css [ margin2 (px 12) zero ] ]
                [ p [] [ text "Fullstack developer, FP enthusiast." ]
                , p [] [ text "Remote (Novosibirsk, Russia)" ]
                ]
            , a [ styles.link, href "mailto: logachev.dev@ya.ru", targetBlank, noOpener ] [ text "logachev.dev@ya.ru" ]
            , div [ css [ displayFlex, margin2 (px 12) zero, mediaPrint [ flexDirection column ] ] ]
                [ span [ css [ mediaScreen [ display none ] ] ] [ printableLink "Site" "https://logachev.dev" ]
                , printableLink "GitHub" "https://github.com/vladimirlogachev"
                , printableLink "Telegram" "https://t.me/vladimirlogachev"
                , printableLink "Twitter" "https://twitter.com/logachev_dev"
                , printableLink "LinkedIn" "https://www.linkedin.com/in/vladimirlogachev"
                ]
            , div [ css [ mediaPrint [ display none ] ] ]
                [ a [ styles.link, href "https://logachev.dev/cv_vladimir_logachev.pdf", targetBlank, noOpener ] [ text "Download cv" ] ]
            ]
        ]


type alias Date =
    { month : Int, year : Int }


showDate : Date -> String
showDate d =
    (String.padLeft 2 '0' <| String.fromInt d.month)
        ++ "/"
        ++ (String.padLeft 4 '0' <| String.fromInt d.year)


type alias ExperienceRecord =
    { companyAndTitle : String
    , startDate : Date
    , endDate : Date
    , url : String
    , roleDescription : String
    , tags : String
    }


experienceRecords : List ExperienceRecord
experienceRecords =
    [ { companyAndTitle = "Pamir, frontend developer"
      , startDate = Date 5 2020
      , endDate = Date 2 2021
      , url = ""
      , roleDescription = "Developed a web application, which utilizes server-side rendering and covered it with unit tests. Packaged everything in Docker and set up CI. I also mentored a second frontend developer who joined the team later."
      , tags = """Frontend: TypeScript, React, Next.js, GraphQL, Apollo, FP-TS, Emotion, Jest
        Infrastructure: Nginx, Docker, GitHub Actions"""
      }
    , { companyAndTitle = "Eldis, software engineer"
      , startDate = Date 10 2019
      , endDate = Date 12 2019
      , url = "https://eldis.ru"
      , roleDescription = "I developed a declarative decoder for the internal binary document format, covered it with tests, including property-based testing."
      , tags = "Scala, scodec, cats, fs2, decline, specs2, scalacheck"
      }
    , { companyAndTitle = "Neolab-Nsk, fullstack developer"
      , startDate = Date 1 2019
      , endDate = Date 9 2019
      , url = ""
      , roleDescription = "I've implemented new functionality in existing web applications, fixed defects and developed new applications, and microservices, covered them with unit tests and integration tests."
      , tags = """Frontend: TypeScript, React, Redux, Saga, RxJS, FP-TS
        Backend: TypeScript, Node, Redux, Saga, RxJS, Redis, Lua, Mongo, PostgreSQL, Clickhouse, Docker"""
      }
    , { companyAndTitle = "SocialSweet Inc, frontend developer"
      , startDate = Date 8 2018
      , endDate = Date 1 2019
      , url = "https://sweet.io"
      , roleDescription = """Sweet's product is a loyalty platform, social network and online store.
        I performed tasks related to business logic at the front end and was engaged in covering the existing code
        with unit tests and tuning them, thanks to which the tests were launched using CI pipeline, and the defects
        associated with an unsuccessful merging of Git branches in a huge codebase really began to be prevented."""
      , tags = "TypeScript, Angular, RxJS"
      }
    , { companyAndTitle = "Allmax, frontend developer"
      , startDate = Date 11 2017
      , endDate = Date 8 2018
      , url = "https://apps.apple.com/ru/app/savl/id1369912925"
      , roleDescription = """I worked in the Savl project — this is a mobile application, wallet with support for 6 cryptocurrencies.
        I was responsible for the data layer in the mobile application. I applied everything that I learned from books
        about functional programming and software design, and also completely covered the business logic with tests,
        as a result of which the application became fault-tolerant and modular, that is, it stopped crashing due to
        exceptions or unexpected behavior of external services, and allowed to enable and disable support for individual
        cryptocurrencies at any time. Also inside the company, I made several presentations on functional programming."""
      , tags = "JavaScript, Flow, React Native, Redux, Saga, Ramda, Sanctuary, Socket.io"
      }
    ]


showExperienceRecord : ExperienceRecord -> Html msg
showExperienceRecord x =
    div [ styles.itemBox ]
        [ span [ styles.item ] [ text x.companyAndTitle, span [ styles.period ] [ text (showDate x.startDate ++ " — " ++ showDate x.endDate) ] ]
        , a [ styles.link, href x.url, targetBlank, noOpener ] [ text x.url ]
        , span [] [ text x.roleDescription ]
        , span [ styles.detail ] [ text x.tags ]
        ]


experienceSection : Html msg
experienceSection =
    section [ styles.section ] (h2 [ styles.subheader ] [ text "Experience" ] :: List.map showExperienceRecord experienceRecords)


type alias ContributionRecord =
    { title : String
    , url : String
    , description : String
    , tags : String
    }


contributionRecords : List ContributionRecord
contributionRecords =
    [ { title = "FP Specialty"
      , url = "https://t.me/fpspecialty_ru"
      , description = "I run this FP reading group for russian-speaking users. During COVID lockdown we discuss PF books and courses remotely, on a weekly basis, but in the past it was an offline group."
      , tags = "Reading group"
      }
    , { title = "Russian translation of the Mostly Adequate Guide to Functional Programming in JavaScript"
      , url = "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
      , description = """The book introduces the reader to the functional programming paradigm and describes a functional approach to developing JavaScript applications.
        The translation was initiated by Maxim Filippov and stopped at 60%. Then me and Sakayama joined the translation, refactored every chapter translated before us and then finished the translation."""
      , tags = "JavaScript"
      }
    , { title = "higherkindness/mu-graphql-example-elm"
      , url = "https://github.com/higherkindness/mu-graphql-example-elm"
      , description = "I rebuilt an Elm example, which serves as an illustrative frontend for the mu-haskell library (demonstrating its GraphQL capabilities)."
      , tags = "Elm, GraphQL"
      }
    , { title = "higherkindness/mu-haskell"
      , url = "https://github.com/higherkindness/mu-haskell"
      , description = "I made minor changes to the example project (which should be treated as a part of the documentation), and also helped to discover couple of bugs in the mu-haskell library itself."
      , tags = "Haskell, GraphQL"
      }
    ]


showContributionRecord : ContributionRecord -> Html msg
showContributionRecord x =
    div [ styles.itemBox ]
        [ a [ css [ mediaPrint [ color (hex "212121") ] ], styles.item, styles.link, href x.url, targetBlank, noOpener ] [ text x.title ]
        , a [ css [ mediaScreen [ display none ] ], styles.item, styles.link, href x.url, targetBlank, noOpener ] [ text x.url ]
        , span [] [ text x.description ]
        , span [ styles.detail ] [ text x.tags ]
        ]


contributionsSection : Html msg
contributionsSection =
    section [ styles.section ] (h2 [ styles.subheader ] [ text "Notable contributions" ] :: List.map showContributionRecord contributionRecords)


aboutSection : Html msg
aboutSection =
    section [ styles.section ]
        [ h2 [ styles.subheader ] [ text "Bio" ]
        , p [ css [ marginBottom (px 12) ] ] [ text "I prefer functional languages that implement strict static typing. I actively use Scala, Haskell and Elm, but am also ready to take on any other typed functional language." ]
        , p [ css [ marginBottom (px 12) ] ] [ text "I associate the success in my career with FP, so I invest a lot of my time and attention not only to the code, but also to people. My intention is to make sure that FP brings benefits to both companies and individual specialists." ]
        , p [ css [ marginBottom (px 12) ] ] [ text "I'm a great fan of meetups and reading groups, which I run at my workplaces from time to time, and also I consider pair programming and pair testing to be an effective practice." ]
        ]


type alias EducationRecord =
    { title : String
    , url : String
    , details : String
    }


educationRecords : List EducationRecord
educationRecords =
    [ { title = "Mastering Haskell Programming"
      , url = "https://www.udemy.com/certificate/UC-DRMAMOQ5"
      , details = "Packt, 2019"
      }
    , { title = "Functional Programming in Haskell, part 2 (certificate with distinction)"
      , url = "https://stepik.org/cert/207739"
      , details = "Computer Science Center, 2019"
      }
    , { title = "Functional Programming in Haskell, part 1 (certificate with distinction)"
      , url = "https://stepik.org/cert/196007"
      , details = "Computer Science Center, 2019"
      }
    , { title = "Computer Science Summer School, Theory of Programming Languages"
      , url = ""
      , details = "Novosibirsk State University, 2019"
      }
    , { title = "Maintenance of computer equipment and computer networks"
      , url = ""
      , details = "Novosibirsk Aviation Technical College, 2004 — 2008"
      }
    ]


showEducationRecord : EducationRecord -> Html msg
showEducationRecord x =
    div [ styles.itemBox ]
        [ span [] [ text x.title ]
        , a [ styles.link, href x.url, targetBlank, noOpener ] [ text x.url ]
        , span [ styles.detail ] [ text x.details ]
        ]


educationSection : Html msg
educationSection =
    section [ styles.section ]
        (h2 [ styles.subheader ] [ text "Education and courses" ] :: List.map showEducationRecord educationRecords)
