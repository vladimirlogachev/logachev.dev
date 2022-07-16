module Page.Cv.Data exposing (skillGroups)

import Element exposing (..)
import Element.Font as Font
import Page.Cv.Date exposing (Date)
import Page.Cv.SkillGroup exposing (SkillGroup)
import Typography exposing (preparedParagraph)


skillGroups : List (SkillGroup msg)
skillGroups =
    [ haskellSkillGroup
    , scalaSkillGroup
    , jsSkillGroup
    ]


haskellSkillGroup : SkillGroup msg
haskellSkillGroup =
    { skills =
        [ { icon = Just "/assets/images/haskell.svg"
          , title = "Haskell"
          , details =
                [ { name = "Libraries"
                  , tags =
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
                  }
                ]
          }
        , { icon = Just "/assets/images/elm.svg"
          , title = "Elm"
          , details =
                [ { name = "Libraries"
                  , tags =
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
                  }
                , { name = "Concepts"
                  , tags = [ "Browser API interop (Websockets, LocalStorage), Ports, Tasks" ]
                  }
                ]
          }
        , { icon = Nothing
          , title = "Other"
          , details =
                [ { name = "Databases"
                  , tags = [ "PostgreSQL", "Redis", "Clickhouse", "MongoDB" ]
                  }
                , { name = "Infrastructure and tooling"
                  , tags = [ "Docker", "GitHub Actions" ]
                  }
                , { name = "APIs"
                  , tags = [ "GraphQL" ]
                  }
                , { name = "Misc"
                  , tags = [ "GitHub Projects", "Figma", "Miro" ]
                  }
                ]
          }
        ]
    , commercialExperience =
        [ { company = "Fourier Labs"
          , positionTitle = "Software Engineer"
          , startDate = Date 3 2022
          , endDate = Just <| Date 4 2022
          , url = Just "https://fourierlabs.io"
          , roleDescription = []
          , details =
                [ { name = "Backend", tags = [ "Haskell", "Plutus" ] }
                , { name = "Infrastructure", tags = [ "Nix" ] }
                , { name = "Blockchain", tags = [ "Cardano", "Ethereum" ] }
                ]
          }
        , { company = "Wolf, private trading platform"
          , positionTitle = "Principal engineer and founder"
          , startDate = Date 8 2021
          , endDate = Just <| Date 7 2022
          , url = Nothing
          , roleDescription =
                [ el [ Font.semiBold ] <| preparedParagraph "My role:"
                , [ "make technical decisions to produce an MVP as soon as possible without sacrificing the reliability or maintainability"
                  , "design and implement features as a full-stack developer, solely and via pair programming, and write unit tests"
                  , "design the trading algorithm"
                  , "describe tasks and manage the project"
                  , "review pull requests"
                  , "mentor new developers"
                  ]
                    |> List.map (\t -> preparedParagraph ("• " ++ t))
                    |> column [ width fill, spacing 10 ]
                , el [ Font.semiBold ] <| preparedParagraph "Technical details:"
                , [ "9+ KLOC of Haskell code and 9+ KLOC of Elm code"
                  , "Backend type declarations serve as a contract, and Frontend types and JSON codecs are generated from the backend type declarations"
                  , "Postgres queries are type-checked against a real DB at compile time"
                  , "Docker containers are built with Github Actions and pushed to GitHub container registry"
                  , "Every algorithm can be run in a real environment or simulated (with heavy use of Haskell parallelism and concurrency)"
                  , "The project has a strong focus on the absence of partial functions"
                  , "In general the whole system is reliable, stable, and behaves correctly, despite the fact that the domain and external APIs have lots of edge cases, and are sensitive even to small deviations from valid values and ranges."
                  , "Tested with different kinds of tests: unit tests, snapshot tests, property-based tests"
                  , "The entry threshold for the Haskell codebase is relatively low – it doesn't require an understanding of advanced concepts for everyday work"
                  , "The project has documentation, and the development tasks are well-described and tagged in GitHub Projects"
                  ]
                    |> List.map (\t -> preparedParagraph ("• " ++ t))
                    |> column [ width fill, spacing 10 ]
                , preparedParagraph "All these points lead to ease of development – refactors are fast and do not cause regressions, creating tasks and updating their status does not require much effort, no unnecessary/routine actions are required from the developer. Relatively little time is spent on fixing technical issues – therefore, there is a lot of time left for substantive things and implementing new features."
                , preparedParagraph "Although the source code of this project isn't publicly available, I can demonstrate and discuss it during the technical interview."
                ]
          , details =
                [ { name = "Backend"
                  , tags =
                        [ "Haskell"
                        , "servant-server"
                        , "postgresql-typed"
                        , "haskell-to-elm"
                        , "mtl"
                        , "Decimal"
                        , "relude"
                        , "hspec"
                        , "QuickCheck"
                        ]
                  }
                , { name = "Frontend"
                  , tags =
                        [ "Elm"
                        , "elm-ui"
                        , "elm-charts"
                        , "remotedata"
                        , "elm-review"
                        , "elm-test"
                        ]
                  }
                , { name = "Infrastructure", tags = [ "Nginx", "Docker", "GitHub Actions" ] }
                , { name = "Project management", tags = [ "GitHub Projects" ] }
                ]
          }
        ]
    , showcaseProjects =
        [ { title = "servant-to-elm example"
          , url = "https://github.com/VladimirLogachev/servant-to-elm-example"
          , description = """An example full-stack web application, built in a typesafe functional way.
          What's cool there is that servant-to-elm does the job of generating types and decoders/encoders
          from Haskell types and Servant definition to Elm, which not only catches regressions
          in the compile-time but also provides ready (and highly configurable) Elm functions
          to fetch necessary data from the server."""
          , tags = [ "Elm", "Haskell", "Servant", "SQLite" ]
          }
        ]
    , contributions =
        [ { title = "higherkindness/mu-graphql-example-elm"
          , url = "https://github.com/higherkindness/mu-graphql-example-elm"
          , description = "An example of how to implement both frontend and backend in a schema-first, typesafe, and functional way (for the mu-haskell library, demonstrating its GraphQL capabilities). I rebuilt its Elm frontend and made minor changes to the Haskell backend (and also discovered a couple of bugs)."
          , tags = [ "Elm", "Haskell", "GraphQL" ]
          }

        -- , { title = "FP Specialty"
        --   , url = "https://fpspecialty.github.io"
        --   , description = "I lead a functional programming reading group for English speaking users of all functional programming skills."
        --   , tags = "Reading group"
        --   }
        ]
    , education =
        [ { title = "Mastering Haskell Programming"
          , url = "https://www.udemy.com/certificate/UC-DRMAMOQ5"
          , details = "Packt, 2019"
          }
        , { title = "Functional Programming in Haskell, part 2 (certificate with honors)"
          , url = "https://stepik.org/cert/207739"
          , details = "Stepik, Computer Science Center, 2019"
          }
        , { title = "Functional Programming in Haskell, part 1 (certificate with honors)"
          , url = "https://stepik.org/cert/196007"
          , details = "Stepik, Computer Science Center, 2019"
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
    }


scalaSkillGroup : SkillGroup msg
scalaSkillGroup =
    { skills =
        [ { icon = Just "/assets/images/scala.svg"
          , title = "Scala"
          , details =
                [ { name = "Libraries"
                  , tags =
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
                  }
                ]
          }
        ]
    , commercialExperience =
        [ { company = "Eldis"
          , positionTitle = "Software engineer"
          , startDate = Date 10 2019
          , endDate = Just <| Date 12 2019
          , url = Just "https://eldis.ru"
          , roleDescription = [ preparedParagraph "I developed a declarative decoder for the internal binary document format, covered it with tests, including property-based testing." ]
          , details =
                [ { name = "Backend", tags = [ "Scala", "scodec", "cats", "fs2", "decline", "specs2", "scalacheck" ] }
                ]
          }
        ]
    , showcaseProjects =
        [ { title = "Transitive Closure (assessment)"
          , url = "https://github.com/VladimirLogachev/transitive_closure"
          , description = """A function that accepts a list of object ids and returns those objects
      and all objects which they refer to (directly or indirectly) from some Repository
      with a monadic interface. The code is pretty abstract,
      but still well-tested (including tests
      for cases like very large referencing graphs and cyclic references)."""
          , tags = [ "Scala", "Cats", "ScalaTest" ]
          }
        , { title = "Web crawler microservice (assessment)"
          , url = "https://github.com/VladimirLogachev/crawler"
          , description = """A microservice that accepts a list of page URLs, and returns
      a list of page titles. It takes into account situations like bad URLs,
      duplicate urls, redirects, concurrency, and backpressure."""
          , tags = [ "Scala", "Akka HTTP" ]
          }
        ]
    , contributions = []
    , education = []
    }


jsSkillGroup : SkillGroup msg
jsSkillGroup =
    { skills =
        [ { icon = Just "/assets/images/typescript.svg"
          , title = "TypeScript"
          , details =
                [ { name = "Functional programming"
                  , tags = [ "fp-ts", "io-ts", "rxjs", "sanctuary-js", "ramda" ]
                  }
                , { name = "Frameworks and related"
                  , tags = [ "Angular", "React", "Next.js", "Redux", "Redux-saga" ]
                  }
                , { name = "Network"
                  , tags = [ "Socket.io", "Apollo" ]
                  }
                , { name = "Testing"
                  , tags = [ "Jest", "Mocha", "Jasmine" ]
                  }
                , { name = "Styling"
                  , tags = [ "SCSS", "Emotion" ]
                  }
                ]
          }
        ]
    , commercialExperience =
        [ { company = "Pamir"
          , positionTitle = "Frontend developer"
          , startDate = Date 5 2020
          , endDate = Just <| Date 12 2020
          , url = Nothing
          , roleDescription =
                [ preparedParagraph """Developed a web application, which utilizes server-side rendering and covered it with unit tests.
                Packaged everything in Docker and set up CI."""
                , preparedParagraph "I also mentored the second frontend developer who joined the team later."
                ]
          , details =
                [ { name = "Frontend"
                  , tags =
                        [ "TypeScript"
                        , "React"
                        , "Next.js"
                        , "GraphQL"
                        , "Apollo"
                        , "FP-TS"
                        , "Emotion"
                        , "Jest"
                        ]
                  }
                , { name = "Infrastructure", tags = [ "Nginx", "Docker", "GitHub Actions" ] }
                ]
          }
        , { company = "Neolab-Nsk"
          , positionTitle = "Fullstack developer"
          , startDate = Date 1 2019
          , endDate = Just <| Date 9 2019
          , url = Nothing
          , roleDescription = [ preparedParagraph "I implemented new functionality in existing web applications, fixed defects, and developed new applications, and microservices, covering them with unit tests and integration tests." ]
          , details =
                [ { name = "Frontend", tags = [ "TypeScript", "React", "Redux", "Saga", "RxJS", "FP-TS" ] }
                , { name = "Backend"
                  , tags =
                        [ "TypeScript"
                        , "Node"
                        , "Redux"
                        , "Saga"
                        , "RxJS"
                        , "Redis"
                        , "Lua"
                        , "Mongo"
                        , "PostgreSQL"
                        , "Clickhouse"
                        , "Docker"
                        ]
                  }
                ]
          }
        , { company = "SocialSweet Inc"
          , positionTitle = "Frontend developer"
          , startDate = Date 8 2018
          , endDate = Just <| Date 1 2019
          , url = Just "https://sweet.io"
          , roleDescription =
                [ preparedParagraph "Sweet's product is a loyalty platform, social network, and online store."
                , preparedParagraph """I performed tasks related to business logic at the front end and was engaged in covering the existing code
                with unit tests and tuning them, thanks to which the tests were launched using CI pipeline, and the defects
                associated with an unsuccessful merging of Git branches in a huge codebase really began to be prevented."""
                ]
          , details =
                [ { name = "Frontend", tags = [ "TypeScript", "Angular", "RxJS" ] }
                ]
          }
        , { company = "Allmax"
          , positionTitle = "Frontend developer"
          , startDate = Date 11 2017
          , endDate = Just <| Date 8 2018
          , url = Just "https://savl.com"
          , roleDescription =
                [ preparedParagraph "I worked in the Savl project — this is a mobile application, a wallet with support for 6 cryptocurrencies."
                , preparedParagraph """I was responsible for the data layer in the mobile application. I applied everything that I learned from books
                about functional programming and software design, and also completely covered the business logic with tests,
                as a result of which the application became fault-tolerant and modular, that is, it stopped crashing due to
                exceptions or unexpected behavior of external services, and allowed to enable and disable support for individual
                cryptocurrencies at any time."""
                , preparedParagraph "Also inside the company, I made several presentations on functional programming."
                ]
          , details =
                [ { name = "Frontend"
                  , tags =
                        [ "JavaScript"
                        , "Flow"
                        , "React Native"
                        , "Redux"
                        , "Saga"
                        , "Ramda"
                        , "Sanctuary"
                        , "Socket.io"
                        ]
                  }
                ]
          }
        ]
    , showcaseProjects = []
    , contributions =
        [ { title = "Russian translation of the Mostly Adequate Guide to Functional Programming in JavaScript"
          , url = "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
          , description = """The book introduces the reader to the functional programming paradigm 
          and describes a functional approach to developing JavaScript applications.
          The translation was initiated by Maxim Filippov and stopped at 60%. Then I and Sakayama joined the translation, 
          refactored every chapter translated before us, and then finished the translation."""
          , tags = [ "JavaScript", "Ramda" ]
          }
        ]
    , education = []
    }
