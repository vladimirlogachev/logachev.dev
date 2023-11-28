module Page.Cv.Data exposing (commercialExperience, contributions, education, skills)

import Page.Cv.CommercialExperience exposing (CommercialExperience)
import Page.Cv.Date exposing (Date)
import Page.Cv.Education exposing (Education)
import Page.Cv.Project exposing (Project)
import Page.Cv.Skill exposing (Skill)
import Typography exposing (preparedParagraph)


commercialExperience : List (CommercialExperience msg)
commercialExperience =
    [ { company = "Samokat.tech"
      , positionTitle = "Data Engineer"
      , startDate = Date 9 2023
      , endDate = Nothing
      , url = Just "https://samokat.tech/"
      , roleDescription =
            [ preparedParagraph "Samokat.tech develops solutions for real-time retail (the Samokat food delivery app and other marketplaces)."
            , preparedParagraph "I develop data pipelines using platform instruments."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "engineering", "code review" ]
              }
            , { name = "Backend"
              , tags =
                    [ "Scala"
                    , "Spark"
                    , "Kafka"
                    , "MinIO"
                    , "Airflow"
                    , "MS SQL"
                    , "Jenkins"
                    ]
              }
            ]
      }
    , { company = "Wolf"
      , positionTitle = "Founder and Engineering Lead"
      , startDate = Date 8 2021
      , endDate = Nothing
      , url = Nothing
      , roleDescription =
            [ preparedParagraph "The project is a full-stack web application for trading on the Binance crypto exchange. It consists of a trend-following trading algorithm, exchange simulation engine for backtesting, exhange API client for trading with real account, and a web application for inspecting and debugging the trading algorithm, and displaying stats."
            , preparedParagraph "We use several kinds of testing techniques, including snapshot testing and property-based testing, along with case-based testing. We have schema-first typesafe SQL queries to PostgreSQL. And the haskell-to-elm library generates Elm code from Haskell code. Also, we have a strong focus on the absence of partial functions. This combination of technologies allows us to catch most regressions in the compile-time."
            , preparedParagraph "The line count is ~17k of Haskell and ~10k of Elm code."
            , preparedParagraph "During a technical interview, I can demonstrate the project running in a production environment and its source code."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags =
                    [ "design"
                    , "technology strategy"
                    , "project management"
                    , "leading"
                    , "mentoring"
                    , "engineering"
                    , "testing"
                    , "code review"
                    , "devops"
                    ]
              }
            , { name = "Backend"
              , tags =
                    [ "Haskell"
                    , "servant-server"
                    , "postgresql-typed"
                    , "haskell-to-elm"
                    , "mtl"
                    , "lens"
                    , "conduit"
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
            , { name = "Infrastructure"
              , tags =
                    [ "Kubernetes"
                    , "Docker"
                    , "Nginx"
                    , "Grafana"
                    , "Loki"
                    , "DigitalOcean"
                    , "GitHub Actions"
                    , "GitHub Container Registry"
                    ]
              }
            ]
      }
    , { company = "Swift Invention"
      , positionTitle = "Backend Team Lead"
      , startDate = Date 8 2022
      , endDate = Just <| Date 5 2023
      , url = Just "https://www.swiftinvention.com"
      , roleDescription =
            [ preparedParagraph "I maintained two projects as a team lead, including implementing new features, writing tests, and fixing bugs."
            , preparedParagraph "Also, I mentored new developers to get on board with Scala (mostly, from a Java background), and ran a weekly Scala book reading club."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "leading", "mentoring", "technical interviews", "engineering", "testing", "code review" ]
              }
            , { name = "Backend"
              , tags =
                    [ "Scala"
                    , "zio"
                    , "zio-http"
                    , "zio-test"
                    , "tapir"
                    , "circe"
                    , "chimney"
                    , "enumeratum"
                    , "flyway"
                    , "testcontainers"
                    , "finagle"
                    , "scalatest"
                    , "MySQL"
                    , "Redis"
                    , "Docker"
                    ]
              }
            ]
      }
    , { company = "Fourier Labs"
      , positionTitle = "Software Engineer"
      , startDate = Date 3 2022
      , endDate = Just <| Date 4 2022
      , url = Just "https://fourierlabs.io"
      , roleDescription =
            [ preparedParagraph "I worked on the POC EVM implementation for the Cardano blockchain."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "engineering", "testing", "code review" ]
              }
            , { name = "Backend", tags = [ "Haskell", "Plutus" ] }
            , { name = "Infrastructure", tags = [ "Nix" ] }
            , { name = "Blockchain", tags = [ "Cardano", "Ethereum" ] }
            ]
      }
    , { company = "Pamir"
      , positionTitle = "Frontend Engineer"
      , startDate = Date 5 2020
      , endDate = Just <| Date 12 2020
      , url = Nothing
      , roleDescription =
            [ preparedParagraph """Developed a web application, which utilizes server-side rendering and covered it with unit tests.
                Packaged everything in Docker and set up CI."""
            , preparedParagraph "I also mentored the second frontend developer who joined the team later."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "mentoring", "engineering", "testing", "code review" ]
              }
            , { name = "Frontend"
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
    , { company = "Eldis"
      , positionTitle = "Software Engineer"
      , startDate = Date 10 2019
      , endDate = Just <| Date 12 2019
      , url = Just "https://eldis.ru"
      , roleDescription = [ preparedParagraph "I developed a declarative decoder for the internal binary document format, covered it with tests, including property-based testing." ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "engineering", "testing" ]
              }
            , { name = "Backend", tags = [ "Scala", "scodec", "cats", "fs2", "decline", "specs2", "scalacheck" ] }
            ]
      }
    , { company = "Neolab-Nsk"
      , positionTitle = "Fullstack Engineer"
      , startDate = Date 1 2019
      , endDate = Just <| Date 9 2019
      , url = Nothing
      , roleDescription = [ preparedParagraph "I implemented new functionality in existing web applications, fixed defects, and developed new applications, and microservices, covering them with unit tests and integration tests." ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "engineering", "testing" ]
              }
            , { name = "Frontend", tags = [ "TypeScript", "React", "Redux", "Saga", "RxJS", "FP-TS" ] }
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
      , positionTitle = "Frontend Engineer"
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
            [ { name = "Responsibilities"
              , tags = [ "engineering", "testing", "code review" ]
              }
            , { name = "Frontend", tags = [ "TypeScript", "Angular", "RxJS" ] }
            ]
      }
    , { company = "Allmax"
      , positionTitle = "Frontend Engineer"
      , startDate = Date 11 2017
      , endDate = Just <| Date 8 2018
      , url = Just "https://savl.com"
      , roleDescription =
            [ preparedParagraph "I worked in the Savl project — this is a mobile application, a wallet with support for 6 cryptocurrencies."
            , preparedParagraph """I was responsible for the data layer in the mobile application. I applied everything that I learned from books
                about functional programming and software design, and also completely covered the business logic with tests,
                as a result of which the application became fault-tolerant and modular, that is, it stopped crashing due to exceptions or unexpected behavior of external services, and allowed to enable and disable support for individual
                cryptocurrencies at any time."""
            , preparedParagraph "Also inside the company, I made several presentations on functional programming."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "mentoring", "engineering", "testing", "code review" ]
              }
            , { name = "Frontend"
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


contributions : List Project
contributions =
    [ { title = "haskell-to-elm/servant-to-elm-example"
      , url = Just "https://github.com/haskell-to-elm/servant-to-elm-example"
      , description = """An example full-stack web app, built in a code-first, typesafe, and functional way.
          The servant-to-elm generates types and decoders/encoders
          from Haskell types and Servant definition to Elm, which not only catches regressions
          in the compile-time but also provides ready (and highly configurable) Elm functions
          to fetch necessary data from the server."""
      , tags = [ "Haskell", "Elm", "servant-server", "haskell-to-elm", "servant-to-elm" ]
      }
    , { title = "higherkindness/mu-graphql-example-elm"
      , url = Just "https://github.com/higherkindness/mu-graphql-example-elm"
      , description = """An example full-stack web app, built in a schema-first, typesafe, and functional way.
          The mu-haskell library typechecks Haskell code against GraphQL schema at compile-time.
          The elm-graphql library generates types and decoders/encoders for Elm from GraphQL schema.
          I rebuilt its Elm frontend and made minor changes to the Haskell backend (and also discovered a couple of bugs in the mu-haskell library itself)."""
      , tags = [ "Haskell", "Elm", "GraphQL", "mu-haskell", "elm-graphql" ]
      }
    , { title = "Russian translation of the Mostly Adequate Guide to Functional Programming in JavaScript"
      , url = Just "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
      , description = """The book introduces the reader to the functional programming paradigm 
          and describes a functional approach to developing JavaScript applications.
          I joined the translation when it got stuck at 60%.
          Me and my friend refactored every chapter translated before us, and then finished the translation."""
      , tags = [ "JavaScript", "Ramda" ]
      }
    , { title = "FP Specialty"
      , url = Nothing
      , description = "From 2019 to 2021 I have maintained a functional programming reading group for people of all functional programming skills."
      , tags = []
      }
    ]


education : List Education
education =
    [ { title = "Mastering Haskell Programming"
      , url = Just "https://www.udemy.com/certificate/UC-DRMAMOQ5"
      , details = "Packt, 2019"
      }
    , { title = "Functional Programming in Haskell, part 2 (certificate with honors)"
      , url = Just "https://stepik.org/cert/207739"
      , details = "Stepik, Computer Science Center, 2019"
      }
    , { title = "Functional Programming in Haskell, part 1 (certificate with honors)"
      , url = Just "https://stepik.org/cert/196007"
      , details = "Stepik, Computer Science Center, 2019"
      }
    , { title = "Computer Science Summer School, Theory of Programming Languages"
      , url = Nothing
      , details = "Novosibirsk State University, 2019"
      }
    , { title = "Maintenance of computer equipment and computer networks"
      , url = Nothing
      , details = "Novosibirsk Aviation Technical College, 2004 — 2008"
      }
    ]


skills : List Skill
skills =
    [ { icon = Nothing
      , title = "Haskell"
      , details =
            [ { name = "Effects and Streaming"
              , tags =
                    [ "async"
                    , "conduit"
                    , "mtl"
                    , "parallel"
                    , "resource-pool"
                    , "retry"
                    ]
              }
            , { name = "HTTP and Networking"
              , tags =
                    [ "http-conduit"
                    , "servant-server"
                    , "ua-parser"
                    , "wai"
                    , "wai-extra"
                    , "warp"
                    ]
              }
            , { name = "Testing"
              , tags =
                    [ "generic-random"
                    , "hspec"
                    , "hspec-golden"
                    , "QuickCheck"
                    , "testcontainers"
                    ]
              }
            , { name = "Other"
              , tags =
                    [ "aeson"
                    , "fmt"
                    , "haskell-to-elm"
                    , "lens"
                    , "nonempty-containers"
                    , "optparse-applicative"
                    , "password"
                    , "pcg-random"
                    , "postgresql-typed"
                    , "pretty-simple"
                    , "relude"
                    , "safe-decimal"
                    , "text"
                    , "uuid"
                    , "zlib"
                    ]
              }
            ]
      }
    , { icon = Nothing
      , title = "Scala"
      , details =
            [ { name = "Effects and Streaming"
              , tags =
                    [ "akka"
                    , "akka-stream"
                    , "cats"
                    , "cats-effect"
                    , "fs2"
                    , "zio"
                    , "zio-streams"
                    ]
              }
            , { name = "HTTP"
              , tags =
                    [ "akka-http"
                    , "caliban"
                    , "finagle"
                    , "tapir"
                    , "zio-http"
                    ]
              }
            , { name = "Testing"
              , tags =
                    [ "scalacheck"
                    , "scalatest"
                    , "specs2"
                    , "testcontainers"
                    , "zio-test"
                    ]
              }
            , { name = "Other"
              , tags =
                    [ "chimney"
                    , "circe"
                    , "enumeratum"
                    , "flyway"
                    , "quill"
                    , "scala-parser-combinators"
                    , "scodec"
                    ]
              }
            ]
      }
    , { icon = Nothing
      , title = "Elm"
      , details =
            [ { name = "UI"
              , tags =
                    [ "elm-charts"
                    , "elm-css"
                    , "elm-datetime-picker"
                    , "elm-style-animation"
                    , "elm-ui"
                    , "elm-ui-dialog"
                    , "svg"
                    ]
              }
            , { name = "Testing"
              , tags =
                    [ "elm-test"
                    , "elm-review"
                    ]
              }
            , { name = "Other"
              , tags =
                    [ "remotedata"
                    , "elm-all-set"
                    , "elm-round"
                    , "elm-stat"
                    ]
              }
            ]
      }
    , { icon = Nothing
      , title = "TypeScript"
      , details =
            [ { name = "Functional programming"
              , tags = [ "fp-ts", "io-ts", "rxjs", "sanctuary-js", "ramda" ]
              }
            , { name = "Network"
              , tags = [ "Socket.io", "Apollo" ]
              }
            , { name = "Testing"
              , tags = [ "Jest", "Mocha", "Jasmine" ]
              }
            , { name = "Frontend"
              , tags = [ "React", "Angular", "Next.js", "Redux", "Redux-saga", "Vite", "Webpack", "ESLint", "SCSS", "Emotion" ]
              }
            ]
      }
    , { icon = Nothing
      , title = "Other"
      , details =
            [ { name = "Databases"
              , tags = [ "PostgreSQL", "MySQL", "MS SQL", "Greenplum", "Redis", "MinIO", "MongoDB" ]
              }
            , { name = "Infrastructure"
              , tags = [ "Kubernetes", "Docker", "Zitadel", "Keycloak", "Grafana", "Loki", "NGINX", "Traefik" ]
              }
            , { name = "Testing"
              , tags = [ "Cypress", "K6" ]
              }
            , { name = "CI and other tools"
              , tags = [ "GitHub Actions", "Just" ]
              }
            , { name = "APIs"
              , tags = [ "GraphQL", "OpenAPI" ]
              }
            , { name = "Project Management and Documentation"
              , tags = [ "GitHub Projects", "Figma", "Draw.io" ]
              }
            , { name = "Soft Skills"
              , tags =
                    [ "research and analysis"
                    , "project management"
                    , "code review"
                    , "leading"
                    , "mentoring"
                    , "conducting technical interviews"
                    , "preparing and giving presentations"
                    , "running meetup groups and reading groups"
                    , "initiative"
                    , "transparency"
                    , "conflict resolution"
                    , "providing feedback"
                    , "active listening"
                    ]
              }
            ]
      }
    ]
