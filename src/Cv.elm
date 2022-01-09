module Cv exposing (view)

import Css exposing (..)
import Css.Media as Media exposing (only, print, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, attribute, css, href, src, title)
import Typography exposing (text__)


styles =
    { page =
        css
            [ margin2 zero auto
            , fontFamilies [ "Source Sans Pro", "sans-serif" ]
            , fontStyle normal
            , color (hex "212121")
            , fontWeight normal
            , fromPx fontSize 16
            , fromPx lineHeight 20
            , mediaScreen [ maxWidth (px 768), padding4 (px 40) (px 16) (px 40) (px 16) ]
            , mediaPrint [ padding zero ]
            ]
    , itemBlock =
        css
            [ displayFlex
            , flexDirection column
            , marginBottom (px 28)
            , property "break-inside" "avoid"
            , firstOfType [ property "break-before" "avoid" ]
            ]
    , section =
        css
            [ marginBottom (px 60)
            ]
    , summary =
        css
            [ displayFlex
            , mediaMobile [ flexDirection column ]
            , marginBottom (px 40)
            ]
    , summaryTextContent =
        css
            [ displayFlex
            , flexDirection column
            , mediaDesktop [ fromPx marginLeft 32 ]
            , mediaMobile [ important <| marginLeft zero, marginTop (px 24) ]
            ]
    , photo =
        css
            [ fromPx width 200
            , fromPx height 200
            , borderRadius (px 8)
            , backgroundColor (hex "efefef")
            ]

    -- Text styles
    , headerPrimary =
        css
            [ fontWeight bold
            , fromPx fontSize 32
            , fromPx lineHeight 40
            , marginBottom (px 12)
            ]
    , subheader =
        css
            [ fontWeight bold
            , fromPx fontSize 24
            , fromPx lineHeight 30
            , marginBottom (px 20)
            , property "break-after" "avoid"
            ]
    , item =
        css
            [ fontWeight normal
            , fromPx fontSize 20
            , fromPx lineHeight 25
            , marginBottom (px 8)
            ]
    , link =
        css
            [ color (hex "0d7da9")
            , textDecoration none
            ]
    , period =
        css
            [ fontWeight normal
            , fromPx fontSize 20
            , fromPx lineHeight 25
            , color (hex "707070")
            , marginLeft (px 12)
            ]
    , detail = css [ color (hex "707070") ]
    }


view : Html msg
view =
    div [ styles.page ]
        [ summarySection
        , bioSection
        , skillsSection
        , showcaseProjectsSection
        , contributionsSection
        , educationSection
        , experienceSection
        ]



-- Summary


printableLink : String -> String -> Html msg
printableLink title url =
    span []
        [ span [ css [ marginRight (px 12), mediaPrint [ display none ] ] ]
            [ a [ styles.link, href url, targetBlank, noOpener ] [ text__ title ] ]
        , span [ css [ mediaScreen [ display none ] ] ]
            [ span [ css [ fromPx marginRight 6 ] ] [ text__ <| title ++ ":" ]
            , a [ styles.link, href url, targetBlank, noOpener ] [ text__ url ]
            ]
        ]


icon : String -> String -> Html msg
icon filename altText =
    img
        [ css [ height (px 28), marginRight (px 10) ]
        , src <| "/logos/" ++ filename
        , alt altText
        , title altText
        ]
        []


summarySection : Html msg
summarySection =
    div [ styles.summary ]
        [ img [ styles.photo, src "https://avatars2.githubusercontent.com/u/17773003?s=400" ] []
        , div
            [ styles.summaryTextContent ]
            [ h1 [ styles.headerPrimary ] [ text__ "Vladimir Logachev" ]
            , div [ css [ marginBottom (px 8) ] ]
                [ p [] [ text__ "Fullstack developer, FP enthusiast." ]
                , p [] [ text__ "Remote (Novosibirsk, Russia)" ]
                ]
            , a [ styles.link, css [ marginBottom (px 8) ], href "mailto: logachev.dev@ya.ru", targetBlank, noOpener ] [ text__ "logachev.dev@ya.ru" ]
            , div [ css [ displayFlex, marginBottom (px 8), mediaPrint [ flexDirection column ] ] ]
                [ span [ css [ mediaScreen [ display none ] ] ] [ printableLink "Site" "https://logachev.dev" ]
                , printableLink "GitHub" "https://github.com/vladimirlogachev"
                , printableLink "Telegram" "https://t.me/vladimirlogachev"
                , printableLink "Twitter" "https://twitter.com/logachev_dev"
                , printableLink "LinkedIn" "https://www.linkedin.com/in/vladimirlogachev"
                ]
            , div [ css [ marginBottom (px 8), mediaPrint [ display none ] ] ]
                [ a [ styles.link, href "https://logachev.dev/cv_vladimir_logachev.pdf", targetBlank, noOpener ] [ text__ "Download cv" ] ]
            ]
        ]



-- Bio


bioSection : Html msg
bioSection =
    section [ styles.section ]
        [ h2 [ styles.subheader ] [ text__ "About me" ]
        , p [ css [ marginBottom (px 12) ] ] [ text__ "I prefer functional languages that implement strict static typing, such as Haskell and Elm." ]
        , p [ css [ marginBottom (px 12) ] ] [ text__ "I associate the success in my career with FP, so I devote a lot of time and attention not only to code but also to people. My mission as a developer is to make functional programming deliver value to both companies and individual specialists." ]
        , p [ css [ marginBottom (px 12) ] ] [ text__ "I'm a big fan of meetups and reading groups, which I run at my workplaces from time to time, and also I consider pair programming and pair testing to be an effective practice." ]
        , p [ css [ marginBottom (px 12) ] ] [ text__ "In programming, I prefer not to rely on intuition (which, I believe, is usually based on previous experiences and tends to fail in unprecedented situations), but instead, read books well in advance." ]
        ]



-- Skills


type alias Detail =
    { name : String, text : String }


type alias SkillRecord =
    { icon : Maybe String
    , title : String
    , description : String
    , details : List Detail
    }


skillRecords : List SkillRecord
skillRecords =
    [ { icon = Just "haskell.svg"
      , title = "Haskell"
      , description = ""
      , details =
            [ { name = "Libraries I'm familiar with"
              , text =
                    [ "aeson"
                    , "Decimal"
                    , "fmt"
                    , "generic-random"
                    , "haskell-to-elm"
                    , "hspec-golden"
                    , "hspec"
                    , "http-conduit"
                    , "lens"
                    , "mtl"
                    , "mu-graphql"
                    , "nonempty-containers"
                    , "parsec"
                    , "persistent"
                    , "postgresql-typed"
                    , "QuickCheck"
                    , "relude"
                    , "retry"
                    , "servant-server"
                    , "time"
                    , "transformers"
                    , "wai"
                    ]
                        |> List.sort
                        |> String.join ", "
              }
            ]
      }
    , { icon = Just "elm.svg"
      , title = "Elm"
      , description = ""
      , details =
            [ { name = "Concepts"
              , text = "Tasks, Ports, JSON encoding/decoding, Browser API Interop (Websockets, LocalStorage)"
              }
            , { name = "Libraries"
              , text =
                    [ "elm-all-set"
                    , "elm-charts"
                    , "elm-crypto-string"
                    , "elm-css"
                    , "elm-dropbox"
                    , "elm-graphql"
                    , "elm-ordering"
                    , "elm-review"
                    , "elm-round"
                    , "elm-ui"
                    , "elm-units"
                    , "random"
                    , "remotedata"
                    , "svg"
                    , "test"
                    ]
                        |> List.sort
                        |> String.join ", "
              }
            ]
      }
    , { icon = Just "scala.svg"
      , title = "Scala"
      , description = ""
      , details =
            [ { name = "Libraries"
              , text =
                    [ "cats-core"
                    , "cats-effect"
                    , "fs2"
                    , "scala-parser-combinators"
                    , "scalatest"
                    , "scalacheck"
                    , "specs2"
                    , "scodec"
                    , "akka"
                    , "akka-http"
                    , "akka-stream"
                    , "scala-parser-combinators"
                    ]
                        |> List.sort
                        |> String.join ", "
              }
            ]
      }
    , { icon = Nothing
      , title = "Other"
      , description = ""
      , details =
            [ { name = "Databases"
              , text = "PostgreSQL, Redis, Clickhouse, MongoDB"
              }
            , { name = "Infrastructure and tooling"
              , text = "Docker, GitHub Actions, Dhall"
              }
            , { name = "APIs"
              , text = "GraphQL"
              }
            , { name = "Other tools"
              , text =
                    [ "GitHub Projects", "Miro", "Figma" ]
                        |> List.sort
                        |> String.join ", "
              }
            ]
      }
    ]


showDetail : Detail -> Html msg
showDetail x =
    div []
        [ span [ css [ fromPx marginRight 6 ] ] [ text__ (x.name ++ ": ") ]
        , span [ styles.detail ] [ text__ x.text ]
        ]


showSkillRecord : SkillRecord -> Html msg
showSkillRecord x =
    div [ styles.itemBlock ]
        [ h3 [ styles.item, css [ displayFlex, alignItems center ] ]
            [ Maybe.map (\iconFile -> icon iconFile x.title) x.icon |> Maybe.withDefault (text__ "")
            , text__ x.title
            ]
        , span [] [ text__ x.description ]
        , div [] <| List.map showDetail x.details
        ]


skillsSection : Html msg
skillsSection =
    section [ styles.section ]
        (h2 [ styles.subheader ] [ text__ "Skills and usage experience" ] :: List.map showSkillRecord skillRecords)



-- Showcase Projects


type alias Project =
    { title : String
    , url : String
    , description : String
    , tags : String
    }


showProject : Project -> Html msg
showProject x =
    div [ styles.itemBlock ]
        [ a
            [ css [ mediaPrint [ color (hex "212121") ] ]
            , styles.item
            , styles.link
            , href x.url
            , targetBlank
            , noOpener
            ]
            [ text__ x.title ]
        , a
            [ css [ mediaScreen [ display none ] ]
            , styles.item
            , styles.link
            , href x.url
            , targetBlank
            , noOpener
            ]
            [ text__ x.url ]
        , span [] [ text__ x.description ]
        , span [ styles.detail ] [ text__ x.tags ]
        ]


showcaseProjects : List Project
showcaseProjects =
    [ { title = "servant-to-elm example"
      , url = "https://github.com/VladimirLogachev/servant-to-elm-example"
      , description = """An example full-stack web application, built in a typesafe functional way. 
      What's cool there is that servant-to-elm does the job of generating types and decoders/encoders 
      from Haskell types and Servant definition to Elm, which not only catches regressions 
      in the compile-time but also provides ready (and highly configurable) Elm functions 
      to fetch necessary data from the server."""
      , tags = "Elm, Haskell, Servant, SQLite"
      }
    , { title = "Transitive Closure (assessment)"
      , url = "https://github.com/VladimirLogachev/transitive_closure"
      , description = """A function that accepts list of object ids and returns those objects 
      and all objects which they refer to (directly or indirectly) from some Repository 
      with monadic interface. The code is pretty abstract, 
      but still well-tested (including tests
      for cases like very large referencing graphs and cyclic references)."""
      , tags = "Scala, Cats, ScalaTest"
      }
    , { title = "Web crawler microservice (assessment)"
      , url = "https://github.com/VladimirLogachev/crawler"
      , description = """A microservice that accepts a list of page urls and returns 
      a list of page titles. It takes into account situations like bad urls, 
      duplicate urls, redirects, concurrency and backpressure."""
      , tags = "Scala, Akka HTTP"
      }
    ]


showcaseProjectsSection : Html msg
showcaseProjectsSection =
    section [ styles.section ]
        (h2 [ styles.subheader ] [ text__ "Showcase projects and assessments" ] :: List.map showProject showcaseProjects)



-- Contributions


contributionRecords : List Project
contributionRecords =
    [ { title = "higherkindness/mu-graphql-example-elm"
      , url = "https://github.com/higherkindness/mu-graphql-example-elm"
      , description = "An example of how to implement both frontend and backend in a schema-first, typesafe, and functional way (for the mu-haskell library, demonstrating its GraphQL capabilities). I rebuilt its Elm frontend and made minor changes to Haskell backend (and also discovered a couple of bugs)."
      , tags = "Elm, Haskell, GraphQL"
      }
    , { title = "Russian translation of the Mostly Adequate Guide to Functional Programming in JavaScript"
      , url = "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
      , description = """The book introduces the reader to the functional programming paradigm and describes a functional approach to developing JavaScript applications.
        The translation was initiated by Maxim Filippov and stopped at 60%. Then me and Sakayama joined the translation, refactored every chapter translated before us and then finished the translation."""
      , tags = "JavaScript"
      }
    , { title = "FP Specialty"
      , url = "https://fpspecialty.github.io"
      , description = "I lead a functional programming reading group for English speaking users of all functional programming skills."
      , tags = "Reading group"
      }
    ]


contributionsSection : Html msg
contributionsSection =
    section [ styles.section ] (h2 [ styles.subheader ] [ text__ "Notable contributions" ] :: List.map showProject contributionRecords)



-- Education


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
    , { title = "Functional Programming in Haskell, part 2 (certificate with honors)"
      , url = "https://stepik.org/cert/207739"
      , details = "Computer Science Center, 2019"
      }
    , { title = "Functional Programming in Haskell, part 1 (certificate with honors)"
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
    div [ styles.itemBlock ]
        [ span [ styles.item ] [ text__ x.title ]
        , a [ styles.link, href x.url, targetBlank, noOpener ] [ text__ x.url ]
        , span [ styles.detail ] [ text__ x.details ]
        ]


educationSection : Html msg
educationSection =
    section [ styles.section ]
        (h2 [ styles.subheader ] [ text__ "Education and courses" ] :: List.map showEducationRecord educationRecords)



-- Experience


type alias ExperienceRecord =
    { company : String
    , title : String
    , startDate : Date
    , endDate : Maybe Date
    , url : String
    , roleDescription : String
    , tags : String
    }


showDate : Date -> String
showDate d =
    (String.padLeft 2 '0' <| String.fromInt d.month)
        ++ "/"
        ++ (String.padLeft 4 '0' <| String.fromInt d.year)


experienceRecords : List ExperienceRecord
experienceRecords =
    [ { company = "Wolf, private trading platform"
      , title = "Principal engineer, founder"
      , startDate = Date 8 2021
      , endDate = Nothing
      , url = ""
      , roleDescription = """
      Role:
      - design and implement features
      - manage the project
      - mentor new developers

      Implementation details: 
      - Docker containers are built with GithubActions and pushed to GitHub container registry 
      - Frontend code is generated from the backend code
      - Postgres queries are typechecked against a real DB at compile time
      - Every algorithm can be run in real environment or simulated
      - Unit tests, snapshot tests, property-based tests

      """
      , tags = """
        Backend: Haskell, Servant, lens, mtl, Decimal, Relude, HSpec, Quickcheck, Haskell-to-Elm, PostgreSQL Typed;
        Frontend: Elm, elm-ui, elm-charts, remotedata, elm-revew, elm-test;
        Infrastructure: Nginx, Docker, GitHub Actions"""
      }
    , { company = "Pamir"
      , title = "Frontend developer"
      , startDate = Date 5 2020
      , endDate = Just <| Date 12 2020
      , url = ""
      , roleDescription = "Developed a web application, which utilizes server-side rendering and covered it with unit tests. Packaged everything in Docker and set up CI. I also mentored the second frontend developer who joined the team later."
      , tags = """Frontend: TypeScript, React, Next.js, GraphQL, Apollo, FP-TS, Emotion, Jest;
        Infrastructure: Nginx, Docker, GitHub Actions"""
      }
    , { company = "Eldis"
      , title = "Software engineer"
      , startDate = Date 10 2019
      , endDate = Just <| Date 12 2019
      , url = "https://eldis.ru"
      , roleDescription = "I developed a declarative decoder for the internal binary document format, covered it with tests, including property-based testing."
      , tags = "Scala, scodec, cats, fs2, decline, specs2, scalacheck"
      }
    , { company = "Neolab-Nsk"
      , title = "Fullstack developer"
      , startDate = Date 1 2019
      , endDate = Just <| Date 9 2019
      , url = ""
      , roleDescription = "I implemented new functionality in existing web applications, fixed defects and developed new applications, and microservices, covered them with unit tests and integration tests."
      , tags = """Frontend: TypeScript, React, Redux, Saga, RxJS, FP-TS;
        Backend: TypeScript, Node, Redux, Saga, RxJS, Redis, Lua, Mongo, PostgreSQL, Clickhouse, Docker"""
      }
    , { company = "SocialSweet Inc"
      , title = "Frontend developer"
      , startDate = Date 8 2018
      , endDate = Just <| Date 1 2019
      , url = "https://sweet.io"
      , roleDescription = """Sweet's product is a loyalty platform, social network and online store.
        I performed tasks related to business logic at the front end and was engaged in covering the existing code
        with unit tests and tuning them, thanks to which the tests were launched using CI pipeline, and the defects
        associated with an unsuccessful merging of Git branches in a huge codebase really began to be prevented."""
      , tags = "TypeScript, Angular, RxJS"
      }
    , { company = "Allmax"
      , title = "Frontend developer"
      , startDate = Date 11 2017
      , endDate = Just <| Date 8 2018
      , url = "https://savl.com/"
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
    div [ styles.itemBlock ]
        [ span [ styles.item ]
            [ p [] [ text__ x.company ]
            , text__ x.title
            , span [ styles.period ]
                [ text__
                    (showDate x.startDate
                        ++ " — "
                        ++ (x.endDate |> Maybe.map showDate |> Maybe.withDefault "present")
                    )
                ]
            ]
        , a [ styles.link, href x.url, targetBlank, noOpener ] [ text__ x.url ]
        , span [] [ text__ x.roleDescription ]
        , span [ styles.detail ] [ text__ x.tags ]
        ]


experienceSection : Html msg
experienceSection =
    section [ styles.section ]
        (h2 [ styles.subheader ]
            [ text__ "Experience" ]
            :: List.map showExperienceRecord experienceRecords
        )



-- Reusable stuff


type alias Date =
    { month : Int, year : Int }


mobileBreakpoint : Float
mobileBreakpoint =
    600


mediaMobile : List Style -> Style
mediaMobile =
    withMedia [ only screen [ Media.maxWidth (px (mobileBreakpoint - 1)) ] ]


mediaDesktop : List Style -> Style
mediaDesktop =
    withMedia [ only screen [ Media.minWidth (px mobileBreakpoint) ] ]


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



-- Print specific


screenMultiplier : Float
screenMultiplier =
    0.75


printMultiplier : Float
printMultiplier =
    1.18


{-| Convert pixels (like in figma) to both screen- and print-friendly units
-}
fromPx : (Pt -> Style) -> Int -> Style
fromPx f pixels =
    batch
        [ mediaScreen [ f <| pt (toFloat pixels * screenMultiplier) ]
        , mediaPrint [ f <| pt (toFloat pixels * printMultiplier) ]
        ]
