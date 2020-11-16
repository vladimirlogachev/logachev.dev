module Cv exposing (view)

import Css exposing (..)
import Css.Media as Media exposing (only, orientation, portrait, print, screen, withMedia)
import Css.Transitions exposing (marginLeft3)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, attribute, css, href, src, title)


mediaMobile : List Style -> Style
mediaMobile =
    withMedia [ only screen [ Media.maxWidth (px 600) ] ]


mediaScreen : List Style -> Style
mediaScreen =
    withMedia [ only screen [] ]


mediaPrint : List Style -> Style
mediaPrint =
    withMedia [ only print [] ]


styles =
    { page =
        css
            [ padding4 (px 32) (px 16) (px 16) (px 32)
            , margin2 zero auto
            , withMedia [ only screen [] ] [ maxWidth (px 1000) ]
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
            ]
    , section =
        css
            [ width (pct 100)
            , marginBottom (px 32)
            , property "break-before" "always"
            , property "break-inside" "avoid"
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


view : Html msg
view =
    div [ styles.page ]
        [ heading
        , experienceSection
        , otherSection
        , aboutSection
        , educationSection
        ]


printableLink : String -> String -> Html msg
printableLink title url =
    span []
        [ span [ css [ marginRight (px 12), mediaPrint [ display none ] ] ] [ a [ styles.link, href url ] [ text title ] ]
        , span [ css [ mediaScreen [ display none ] ] ] [ text <| title ++ ": ", a [ styles.link, href url ] [ text url ] ]
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
            , a [ styles.link, href "mailto: logachev.dev@ya.ru" ] [ text "logachev.dev@ya.ru" ]
            , div [ css [ displayFlex, margin2 (px 12) zero, mediaPrint [ flexDirection column ] ] ]
                [ span [ css [ mediaScreen [ display none ] ] ] [ printableLink "Site" "https://logachev.dev" ]
                , printableLink "GitHub" "https://github.com/vladimirlogachev"
                , printableLink "Telegram" "https://t.me/vladimirlogachev"
                , printableLink "Twitter" "https://twitter.com/logachev_dev"
                , printableLink "LinkedIn" "http://www.linkedin.com/in/vladimirlogachev"
                ]
            , div [ css [ mediaPrint [ display none ] ] ]
                [ a [ styles.link, href "https://logachev.dev/cv_vladimir_logachev.pdf" ] [ text "Download cv" ] ]
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
      , url = "http://eldis.ru"
      , roleDescription = "I developed a declarative decoder for the internal binary document format, covered it with tests, including property-based testing."
      , tags = "Scala, scodec, cats, fs2, decline, specs2, scalacheck"
      }
    , { companyAndTitle = "Neolab-Nsk, fullstack developer"
      , startDate = Date 1 2019
      , endDate = Date 9 2019
      , url = "https://www.neolab.io"
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
        , span [ styles.link ] [ text x.url ]
        , span [] [ text x.roleDescription ]
        , span [ styles.detail ] [ text x.tags ]
        ]


experienceSection : Html msg
experienceSection =
    section [ styles.section ] (h2 [ styles.subheader ] [ text "Experience" ] :: List.map showExperienceRecord experienceRecords)


type alias OtherRecord =
    { url : String
    , roleDescription : String
    }


otherRecords : List OtherRecord
otherRecords =
    [ { url = "https://t.me/fpspecialty_ru"
      , roleDescription = "I organize meetups with practice, code review and FP reading group"
      }
    , { url = "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
      , roleDescription = "Translated Mostly Adequate Guide to Functional Programming in JavaScript into Russian"
      }
    ]


showOtherRecord : OtherRecord -> Html msg
showOtherRecord x =
    div [ styles.itemBox ]
        [ span [] [ text x.roleDescription ]
        , span [ styles.link ] [ text x.url ]
        ]


otherSection : Html msg
otherSection =
    section [ styles.section ] (h2 [ styles.subheader ] [ text "Other" ] :: List.map showOtherRecord otherRecords)


aboutSection : Html msg
aboutSection =
    section [ styles.section ]
        [ h2 [ styles.subheader ] [ text "About" ]
        , p [] [ text "I see my future in working with functional languages that implement strict static typing. I actively use Scala, Haskell and Elm, but am also ready to take on any other typed functional language, for example: OCaml, Idris, F #, PureScript." ]
        , p [] [ text "I associate the success in my career with FP, so I will invest a lot of my time and attention in ensuring that FP brings benefits to both companies and individual specialists." ]
        , p [] [ text "I’m ready to regularly explain everything that I understand myself, and to pay time and attention not only to the code, but also to people. I consider pair programming and pair testing to be an effective practice." ]
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
    , { title = "Functional Programming in Haskell, part 2"
      , url = "https://stepik.org/cert/207739 (certificate with distinction)"
      , details = "Computer Science Center, 2019"
      }
    , { title = "Functional Programming in Haskell, part 1"
      , url = "https://stepik.org/cert/196007 (certificate with distinction)"
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
        , span [ styles.link ] [ text x.url ]
        , span [ styles.detail ] [ text x.details ]
        ]


educationSection : Html msg
educationSection =
    section [ styles.section ]
        (h2 [ styles.subheader ] [ text "Education and courses" ] :: List.map showEducationRecord educationRecords)
