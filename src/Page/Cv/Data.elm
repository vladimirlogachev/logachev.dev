module Page.Cv.Data exposing (commercialExperience, contributions, education, skills)

import Page.Cv.CommercialExperience exposing (CommercialExperience)
import Page.Cv.Date exposing (Date, EndDate(..))
import Page.Cv.Education exposing (Education)
import Page.Cv.Project exposing (Project)
import Page.Cv.Skill exposing (Skill)
import Typography exposing (preparedParagraph)


commercialExperience : List (CommercialExperience msg)
commercialExperience =
    [ { company = "Samokat.tech"
      , role = "Data Engineer"
      , startDate = Date 9 2023
      , endDate = EndedOn <| Date 4 2024
      , url = Just "https://samokat.tech/"
      , roleDescription =
            [ preparedParagraph "Samokat.tech develops real-time retail solutions, including the Samokat food delivery app and other marketplaces."
            , preparedParagraph "I develop data pipelines using platform tools."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Engineering", "code review" ]
              }
            , { name = "Backend"
              , tags =
                    [ "Scala"
                    , "Spark"
                    , "Kafka"
                    , "MinIO"
                    , "Airflow"
                    ]
              }
            ]
      }
    , { company = "Wolf"
      , role = "Product Manager and Engineering Lead"
      , startDate = Date 8 2021
      , endDate = EndedOn <| Date 3 2024
      , url = Nothing
      , roleDescription =
            [ preparedParagraph "The project is a full-stack web application designed for trading on the Binance crypto exchange. It incorporates a trend-following trading algorithm, an exchange simulation engine for backtesting, an exchange API client for live trading, and a web application for inspecting, debugging the trading algorithm, and displaying statistics."
            , preparedParagraph "We employ various testing techniques, including snapshot testing, property-based testing, and case-based testing. Our approach includes schema-first typesafe SQL queries to PostgreSQL. Additionally, we utilize the Haskell-to-Elm library to generate Elm code from Haskell Also, we have a strong focus on the absence of partial functions. This technological combination enables us to catch most regressions at compile time."
            , preparedParagraph "The project consists of approximately 17,000 lines of Haskell code and 10,000 lines of Elm code. During a technical interview, I can provide a demonstration of the project running in a production environment and highlight relevant sections of its source code."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags =
                    [ "Design"
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
    , { company = "Tian"
      , role = "Fullstack Engineer"
      , startDate = Date 7 2023
      , endDate = EndedOn <| Date 2 2024
      , url = Just "http://radar.tian.solutions"
      , roleDescription =
            [ preparedParagraph "A real-time flight tracker on a 3D Earth map, with elevations combined with textures."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags =
                    [ "Engineering"
                    , "code review"
                    , "devops"
                    ]
              }
            , { name = "Backend"
              , tags =
                    [ "Haskell"
                    , "servant-server"
                    , "hasql"
                    , "haskell-to-elm"
                    , "mtl"
                    , "lens"
                    , "conduit"
                    , "relude"
                    , "hspec"
                    ]
              }
            , { name = "Frontend"
              , tags =
                    [ "Elm"
                    , "elm-ui"
                    , "elm-3d-scene"
                    , "elm-review"
                    , "elm-test"
                    ]
              }
            , { name = "Infrastructure"
              , tags =
                    [ "Docker"
                    , "Nginx"
                    , "DigitalOcean"
                    , "GitHub Actions"
                    , "GitHub Container Registry"
                    ]
              }
            ]
      }
    , { company = "Swift Invention"
      , role = "Backend Team Lead"
      , startDate = Date 8 2022
      , endDate = EndedOn <| Date 5 2023
      , url = Just "https://www.swiftinvention.com"
      , roleDescription =
            [ preparedParagraph "As a team lead, I managed two projects, overseeing the implementation of new features, writing tests, and addressing bugs."
            , preparedParagraph "Additionally, I mentored new developers, predominantly with a Java background, to familiarize them with Scala. I also organized and led a weekly Scala book reading club."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Leading", "mentoring", "technical interviews", "engineering", "testing", "code review" ]
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

    -- , { company = "Fourier Labs"
    --   , role = "Backend Engineer"
    --   , startDate = Date 3 2022
    --   , endDate = EndedOn <| Date 4 2022
    --   , url = Just "https://fourierlabs.io"
    --   , roleDescription =
    --         [ preparedParagraph "I worked on the POC EVM implementation for the Cardano blockchain."
    --         ]
    --   , details =
    --         [ { name = "Responsibilities"
    --           , tags = [ "Engineering", "testing", "code review" ]
    --           }
    --         , { name = "Backend", tags = [ "Haskell", "Plutus" ] }
    --         , { name = "Infrastructure", tags = [ "Nix" ] }
    --         , { name = "Blockchain", tags = [ "Cardano", "Ethereum" ] }
    --         ]
    --   }
    , { company = "Pamir"
      , role = "Frontend Engineer"
      , startDate = Date 5 2020
      , endDate = EndedOn <| Date 12 2020
      , url = Nothing
      , roleDescription =
            [ preparedParagraph "I developed a web application that employs server-side rendering and implemented comprehensive unit test coverage. I containerized the application using Docker and established continuous integration (CI)."
            , preparedParagraph "Additionally, I provided mentorship to the second frontend developer who joined the team later."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Mentoring", "engineering", "testing", "code review" ]
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
      , role = "Backend Engineer"
      , startDate = Date 10 2019
      , endDate = EndedOn <| Date 12 2019
      , url = Just "https://eldis.ru"
      , roleDescription = [ preparedParagraph "I developed a declarative decoder for the internal binary document format, ensuring comprehensive test coverage, including property-based testing." ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Engineering", "testing" ]
              }
            , { name = "Backend", tags = [ "Scala", "scodec", "cats", "fs2", "decline", "specs2", "scalacheck" ] }
            ]
      }
    , { company = "Neolab-Nsk"
      , role = "Fullstack Engineer"
      , startDate = Date 1 2019
      , endDate = EndedOn <| Date 9 2019
      , url = Nothing
      , roleDescription = [ preparedParagraph "I implemented new functionality in existing web applications, addressed defects, and developed new applications and microservices, ensuring coverage with both unit tests and integration tests." ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Engineering", "testing" ]
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
      , role = "Frontend Engineer"
      , startDate = Date 8 2018
      , endDate = EndedOn <| Date 1 2019
      , url = Just "https://sweet.io"
      , roleDescription =
            [ preparedParagraph "Sweet's product is a combination of a loyalty platform, a social network, and an online store."
            , preparedParagraph """In my role, I focused on tasks related to front-end business logic. I actively contributed to enhancing code quality by covering existing code with unit tests and fine-tuning them. This effort resulted in the successful integration of tests into the CI pipeline, effectively preventing defects associated with unsuccessful Git branch mergers in our extensive codebase."""
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Engineering", "testing", "code review" ]
              }
            , { name = "Frontend", tags = [ "TypeScript", "Angular", "RxJS" ] }
            ]
      }
    , { company = "Allmax"
      , role = "Frontend Engineer"
      , startDate = Date 11 2017
      , endDate = EndedOn <| Date 8 2018
      , url = Just "https://savl.com"
      , roleDescription =
            [ preparedParagraph """I contributed to the Savl project, a mobile application functioning as a wallet with support for several cryptocurrencies.
            My primary focus was on the data layer within the mobile application.
            Applying principles from functional programming and software design, 
            I implemented changes that enhanced the application's modularity and fault tolerance, 
            effectively preventing crashes due to exceptions or unexpected behavior from external services. 
            Furthermore, these modifications facilitated the seamless enabling and disabling of support for individual cryptocurrencies, 
            coupled with the implementation of comprehensive unit testing."""
            , preparedParagraph "Within the company, I conducted several presentations on functional programming."
            ]
      , details =
            [ { name = "Responsibilities"
              , tags = [ "Mentoring", "engineering", "testing", "code review" ]
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
    [ { title = "servant-to-elm-example"
      , url = Just "https://github.com/haskell-to-elm/servant-to-elm-example"
      , description = """An example full-stack web app, constructed in a code-first, typesafe, and functional way. 
          The servant-to-elm tool generates Elm types, decoders/encoders from Haskell types, and Servant definitions. 
          This not only detects regressions during compile time but also provides customizable Elm functions 
          for fetching data from the server."""
      , tags = [ "Haskell", "Elm", "servant-server", "haskell-to-elm", "servant-to-elm" ]
      }
    , { title = "mu-graphql-example-elm"
      , url = Just "https://github.com/higherkindness/mu-graphql-example-elm"
      , description = """An example full-stack web app, developed with a schema-first, typesafe, and functional approach. 
          Leveraging the mu-haskell library, it performs type checking of Haskell code against GraphQL schema during compile time. 
          Additionally, the elm-graphql library generates Elm types, decoders/encoders from GraphQL schema. 
          I revamped the Elm frontend and made minor adjustments to the Haskell backend, 
          and uncovered some bugs in the mu-haskell library itself in the process."""
      , tags = [ "Haskell", "Elm", "GraphQL", "mu-haskell", "elm-graphql" ]
      }
    , { title = "Translation of the Mostly Adequate Guide to Functional Programming in JavaScript"
      , url = Just "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
      , description = """Translated the Mostly Adequate Guide to Functional Programming in JavaScript into Russian. 
          The book introduces the functional programming paradigm and outlines a functional approach to JavaScript application development. 
          I joined the translation effort when progress was at 60%. Collaborating with a friend, 
          we refactored each previously translated chapter before completing the translation."""
      , tags = [ "JavaScript", "Ramda" ]
      }
    , { title = "FP Specialty"
      , url = Nothing
      , description = "Maintained a functional programming reading group from 2019 to 2021, welcoming individuals of all functional programming skill levels."
      , tags = []
      }
    ]


education : List Education
education =
    [ { title = "Product Management Essentials"
      , url = Just "https://www.coursera.org/account/accomplishments/verify/DU4BJFRJH99A"
      , details = "The University of Maryland, 2024"
      }
    , { title = "Mastering Haskell Programming"
      , url = Just "https://www.udemy.com/certificate/UC-DRMAMOQ5"
      , details = "Packt, 2019"
      }
    , { title = "Functional Programming in Haskell, part 2"
      , url = Just "https://stepik.org/cert/207739?lang=en"
      , details = "Stepik, Computer Science Center, 2019"
      }
    , { title = "Functional Programming in Haskell, part 1"
      , url = Just "https://stepik.org/cert/196007?lang=en"
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
      , title = "Leadership and Product Management"
      , details =
            [ { name = "Responsibilities"
              , tags =
                    [ "Project management"
                    , "product management"
                    , "team leadership"
                    , "presenting"
                    , "planning"
                    , "risk management"
                    , "schedule management"
                    , "release management"
                    , "issue resolution"
                    , "stakeholder communication"
                    , "providing feedback"
                    ]
              }
            , { name = "Values"
              , tags = [ "Collaboration", "transparency", "accountability", "proactivity", "empathy" ]
              }
            , { name = "Tools"
              , tags = [ "GitHub Projects", "Notion", "Jira", "Confluence", "Figma", "Draw.io" ]
              }
            ]
      }
    , { icon = Nothing
      , title = "Technical Expertise"
      , details =
            [ { name = "Responsibilities"
              , tags =
                    [ "Research and analysis"
                    , "engineering"
                    , "code review"
                    , "mentorship"
                    , "technical interviews"
                    , "running meetups and reading groups"
                    ]
              }
            , { name = "Backend"
              , tags =
                    [ "Haskell (mtl)"
                    , "Scala (ZIO, cats, Akka)"
                    , "Rust (Tokio)"
                    , "TypeScript"
                    ]
              }
            , { name = "Frontend"
              , tags =
                    [ "Elm"
                    , "TypeScript"
                    , "React"
                    , "Angular"
                    , "Next.js"
                    ]
              }
            , { name = "DevOps"
              , tags =
                    [ "Terraform"
                    , "Kubernetes"
                    , "Docker"
                    , "GitHub Actions"
                    ]
              }
            , { name = "Databases"
              , tags =
                    [ "PostgreSQL"
                    , "MySQL"
                    , "Redis"
                    , "MongoDB"
                    , "S3"
                    ]
              }
            , { name = "Streaming"
              , tags =
                    [ "Pulsar"
                    , "Kafka"
                    ]
              }
            , { name = "Auth"
              , tags =
                    [ "Zitadel"
                    , "Keycloak"
                    ]
              }
            , { name = "Monitoring"
              , tags =
                    [ "Grafana"
                    , "Loki"
                    ]
              }
            , { name = "Testing"
              , tags = [ "Cypress", "K6", "Percy" ]
              }
            , { name = "API Design"
              , tags =
                    [ "REST"
                    , "GraphQL"
                    ]
              }
            ]
      }
    ]
