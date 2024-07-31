module Data exposing
    ( CommercialExperience
    , Date
    , Detail
    , Education
    , EndDate(..)
    , PrintLink
    , Project
    , Skill
    , commercialExperience
    , contributions
    , education
    , linksPrint
    , location
    , myName
    , photo
    , photoHome
    , skills
    )

import Color
import Components.Image exposing (Image)


myName : String
myName =
    "Vladimir Logachev"


photo : Image
photo =
    { url = "/images/photo.jpg"
    , description = "Vladimir Logachev"
    , placeholderColor = Color.black
    }


photoHome : Image
photoHome =
    { url = "/images/photo-home.jpg"
    , description = "Vladimir Logachev"
    , placeholderColor = Color.black
    }


location : String
location =
    "Yerevan, Armenia"


type alias PrintLink =
    { url : String, printAs : String }


linksCommon : List PrintLink
linksCommon =
    [ { url = "mailto:vladimir@logachev.dev"
      , printAs = "vladimir@logachev.dev"
      }
    , { url = "https://t.me/vladimirlogachev"
      , printAs = "t.me/vladimirlogachev"
      }
    , { url = "https://github.com/vladimirlogachev"
      , printAs = "github.com/vladimirlogachev"
      }
    , { url = "https://www.linkedin.com/in/vladimirlogachev"
      , printAs = "linkedin.com/in/vladimirlogachev"
      }
    ]


linksPrint : List PrintLink
linksPrint =
    linksCommon


type alias Detail =
    { key : String, value : String }


type alias Skill =
    { icon : Maybe String
    , title : String
    , details : List Detail
    }


skills : List Skill
skills =
    [ { icon = Nothing
      , title = "Technical Expertise"
      , details =
            [ { key = "Responsibilities"
              , value = "Research and analysis, system design, engineering, code review, mentorship, technical interviews, running meetups and reading groups"
              }

            -- , "Rust Backend (Tokio)"
            , { key = "Scala Backend"
              , value = "Scala, ZIO, Cats, Akka, scodec, fs2, decline, zio-test, scalatest, scalacheck, zio-http, akka-http,  circe, chimney, flyway, enumeratum, Finagle"

              -- "Spark"
              }
            , { key = "Haskell Backend"
              , value = "Haskell, mtl, lens, conduit, servant, postgresql-typed, haskell-to-elm, relude, hspec, QuickCheck"
              }
            , { key = "Elm Frontend"
              , value = "Elm, elm-ui, elm-charts, remotedata, elm-review, elm-test"
              }
            , { key = "TypeScript Frontend"
              , value = "TypeScript, fp-ts, io-ts, Apollo, Emotion, Jest, Redux, Saga, RxJS, socket.io, Ramda, Sanctuary, React, SCSS, Next.js, Angular"
              }
            , { key = "Blockchain"
              , value = "Bitcoin, Ethereum, Cardano, Plutus"
              }
            , { key = "Databases"
              , value = "PostgreSQL, MySQL, Redis, MongoDB, S3"
              }
            , { key = "Streaming"
              , value = "Pulsar, Kafka"
              }
            , { key = "Testing"
              , value = "Cypress, K6, Percy, testcontainers"
              }
            , { key = "Authentication"
              , value = "Zitadel, Keycloak"
              }
            , { key = "Infrastructure"
              , value = "Terraform, Kubernetes, Docker, Nginx, Airflow, GitHub Actions, GitHub Container Registry, GitLab CI, DigitalOcean"
              }
            , { key = "Monitoring"
              , value = "Grafana, Loki"
              }
            , { key = "API Design"
              , value = "REST, GraphQL"
              }
            ]
      }
    , { icon = Nothing
      , title = "Communication"
      , details =
            [ { key = "Responsibilities"
              , value = "Team leadership, presenting, planning, issue resolution, stakeholder communication, providing feedback, release management, documentation"

              -- , "Project management"
              -- , "product management"
              -- , "schedule management"
              }
            , { key = "Agile software development"
              , value = "Scrum, Kanban, Shape Up"
              }
            , { key = "Tools"
              , value = "GitHub Projects, Jira, Confluence, Figma, Draw.io, Notion, Trello"
              }
            , { key = "Values"
              , value = "Collaboration, transparency, accountability, proactivity, empathy"
              }
            ]
      }
    ]


type alias Date =
    { month : Int, year : Int }


type EndDate
    = EndedOn Date
    | Present


type alias CommercialExperience =
    { company : String
    , role : String
    , startDate : Date
    , endDate : EndDate
    , url : Maybe String
    , details : List Detail
    }


commercialExperience : List CommercialExperience
commercialExperience =
    [ { company = "Samokat.tech"
      , role = "Data Engineer"
      , startDate = Date 9 2023
      , endDate = EndedOn <| Date 4 2024
      , url = Just "https://samokat.tech/"
      , details =
            [ { key = "Project"
              , value = "Samokat.tech develops real-time retail solutions, including the Samokat food delivery app and other marketplaces."
              }
            , { key = "Responsibilities"
              , value = "Engineering, code review"
              }
            , { key = "Key achievements"
              , value = """I developed data pipelines using platform tools (near real-time), set up monitoring and alerting systems to ensure the reliability and availability. Improved coding standards for a Python codebase, improved the documentation. I also organized a weekly book reading club."""
              }
            , { key = "Results"
              , value = """Empowered business teams with reliable and timely data, leading to more informed and effective decision-making."""
              }
            ]
      }
    , { company = "Wolf"
      , role = "Engineering Team Lead"
      , startDate = Date 8 2021
      , endDate = EndedOn <| Date 3 2024
      , url = Nothing
      , details =
            [ { key = "Project"
              , value = "A full-stack web application designed for trading on the Binance crypto exchange. It incorporates a trend-following trading algorithm, an exchange simulation engine for backtesting, an exchange API client for live trading, and a web application for inspecting, debugging the trading algorithm, and displaying statistics. The project consists of approximately 17,000 lines of Haskell code and 10,000 lines of Elm code. During a technical interview, I can provide a demonstration of the project running and highlight relevant sections of its source code."
              }
            , { key = "Responsibilities"
              , value = "Design, technology strategy, project management, leading, mentoring, engineering, testing, code review, devops."
              }
            , { key = "Key achievements"
              , value = """The team employed various testing techniques, including snapshot testing, property-based testing, and case-based testing. Our approach included schema-first typesafe SQL queries to PostgreSQL. Additionally, we utilize the Haskell-to-Elm library to generate Elm code from Haskell Also, we have a strong focus on the absence of partial functions. This technological combination enables us to catch most regressions at compile time."""
              }
            , { key = "Results"
              , value = """The application was developed, and the trading algorithm outperforms the "buy and hold" stategy on average, on high market cap asset pairs."""
              }
            ]
      }
    , { company = "Tian"
      , role = "Fullstack Engineer"
      , startDate = Date 7 2023
      , endDate = EndedOn <| Date 2 2024
      , url = Just "http://radar.tian.solutions"
      , details =
            [ { key = "Project"
              , value = "A real-time flight tracker with flight history, on a 3D Earth map, with elevations combined with textures."
              }
            , { key = "Responsibilities"
              , value = "Engineering, code review, devops"
              }
            , { key = "Key achievements"
              , value = """Helped the project team in various ways: to develop an Elm application, set up development tooling, develop build scripts, improve documentation, set up aggressive caching for the client, and suggested performance improvements for loading of large amounts of the elevation data, which was the major blocker for the project."""
              }
            , { key = "Results"
              , value = """A web application was developed and available for users. The combination of its features positioned the application as a unique offering in the market."""
              }
            ]
      }
    , { company = "Swift Invention"
      , role = "Backend Team Lead"
      , startDate = Date 8 2022
      , endDate = EndedOn <| Date 5 2023
      , url = Just "https://www.swiftinvention.com"
      , details =
            [ { key = "Project"
              , value = "Swift Invention is an outsourcing company, And I was involved in 2 projects: 1. An application for internal users in the compliance industry. 2. Corporate learning software tailored to reduce operational risk for high-performance teams."
              }
            , { key = "Responsibilities"
              , value = "Leading, mentoring, technical interviews, engineering, testing, code review"
              }
            , { key = "Key achievements"
              , value = """As a team lead, I managed two projects, overseeing the implementation of new features, writing tests, and addressing bugs. Additionally, I mentored new developers, predominantly with a Java background, to familiarize them with Scala. I also organized and led a weekly Scala book reading club."""
              }
            , { key = "Results"
              , value = """A web application was developed and is used by users. Team efficiency was improved through effective mentoring, resulting in timely delivery of projects."""
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
    --   }
    , { company = "Pamir"
      , role = "Frontend Engineer"
      , startDate = Date 5 2020
      , endDate = EndedOn <| Date 12 2020
      , url = Nothing
      , details =
            [ { key = "Project"
              , value = "Real estate portal and marketplace."
              }
            , { key = "Responsibilities"
              , value = "Mentoring, engineering, testing, code review"
              }
            , { key = "Key achievements"
              , value = """I developed a web application that employs server-side rendering and implemented comprehensive unit test coverage. I containerized the application using Docker and established continuous integration (CI). Additionally, I provided mentorship to the second frontend developer who joined the team later. Also I organized and led a weekly reading club."""
              }
            , { key = "Results"
              , value = """Developed a web application, improved operational efficiency, improved the team's capacity and expertise."""
              }
            ]
      }
    , { company = "Eldis"
      , role = "Backend Engineer"
      , startDate = Date 10 2019
      , endDate = EndedOn <| Date 12 2019
      , url = Just "https://eldis.ru"
      , details =
            [ { key = "Project"
              , value = "Eldis develops software for maintaining registers of shareholders, mutual funds, holding meetings of shareholders and other related areas. The company has their own binary document format containing instructions for filling out table documents, originally developed in C++. I was working on a modern and reliable Scala implementation of this format."
              }
            , { key = "Responsibilities"
              , value = "Engineering, testing."
              }
            , { key = "Key achievements"
              , value = """I developed a declarative decoder for the internal binary document format, ensuring comprehensive test coverage, including property-based testing, and streaming (for expectedly large files). Effectively collaborated with other teams to ensure the correctness of the Scala implementation."""
              }
            , { key = "Results"
              , value = """The Scala implementation of the binary document format was successfully integrated into a new larger project, expanding the company's technological capabilities."""
              }
            ]
      }
    , { company = "Neolab-Nsk"
      , role = "Fullstack Engineer"
      , startDate = Date 1 2019
      , endDate = EndedOn <| Date 9 2019
      , url = Nothing
      , details =
            [ { key = "Project"
              , value = "NDA."
              }
            , { key = "Responsibilities"
              , value = "Engineering, testing."
              }
            , { key = "Key achievements"
              , value = """I implemented new functionality in existing web applications, addressed defects, and developed new applications and microservices, ensuring coverage with unit and integration tests."""
              }
            , { key = "Results"
              , value = """Contributed to the successful delivery of projects and achieving business objectives. Comprehensive testing and defect resolution resulted in more stable and reliable applications, maintenance costs."""
              }
            ]
      }
    , { company = "SocialSweet Inc"
      , role = "Frontend Engineer"
      , startDate = Date 8 2018
      , endDate = EndedOn <| Date 1 2019
      , url = Just "https://sweet.io"
      , details =
            [ { key = "Project"
              , value = "Sweet app, a combination of a loyalty platform, a social network, and an online store."
              }
            , { key = "Responsibilities"
              , value = "Engineering, testing, code review"
              }
            , { key = "Key achievements"
              , value = """I focused on tasks related to front-end business logic. I actively contributed to enhancing code quality by covering existing code with unit tests and fine-tuning them. This effort resulted in the successful integration of tests into the CI pipeline, effectively preventing defects associated with unsuccessful Git branch mergers in the extensive codebase. Also I shared knowledge and best practices with the team, contributing to the overall improvement of the development process."""
              }
            , { key = "Results"
              , value = """Improved operational efficiency, reduced manual effort and errors, increased the reliability, enhanced user satisfaction, boosted team productivity."""
              }
            ]
      }
    , { company = "Allmax"
      , role = "Frontend Engineer"
      , startDate = Date 11 2017
      , endDate = EndedOn <| Date 8 2018
      , url = Just "https://savl.com"
      , details =
            [ { key = "Project"
              , value = "Savl, a mobile application, cryptocurrency wallet with support for several cryptocurrencies."
              }
            , { key = "Responsibilities"
              , value = "Engineering, testing, code review, mentoring, meetups."
              }
            , { key = "Key achievements"
              , value = """My primary focus was on the data layer within the mobile application.
            Applying principles from functional programming and software design, I implemented changes that enhanced the application's modularity and fault tolerance, effectively preventing crashes due to exceptions or unexpected behavior from external services. 
            Furthermore, these modifications allowed for the seamless enabling and disabling of support for individual cryptocurrencies, coupled with the implementation of comprehensive unit testing. Also, within the company, I conducted several presentations on functional programming, and helped new developers to onboard."""
              }
            , { key = "Results"
              , value = """Improved stability, reduced crashes, enhanced user satisfaction, improved development efficiency."""
              }
            ]
      }
    ]


type alias Project =
    { title : String
    , url : Maybe String
    , description : String
    , tech : String
    }


contributions : List Project
contributions =
    [ { title = "elm-modular-grid"
      , url = Just "https://github.com/vladimirlogachev/elm-modular-grid"
      , description = """An Elm library. Responsive modular grid layouts for Elm."""
      , tech = "Elm, elm-ui, elm-land"
      }
    , { title = "elm-package-insights"
      , url = Just "https://github.com/vladimirlogachev/elm-package-insights"
      , description = """A CLI that scans the Elm package registry and detects broken packages."""
      , tech = "Haskell, mtl"
      }
    , { title = "servant-to-elm-example"
      , url = Just "https://github.com/haskell-to-elm/servant-to-elm-example"
      , description = """An example full-stack web app, constructed in a code-first, typesafe, and functional way. 
          The servant-to-elm tool generates Elm types, decoders/encoders from Haskell types, and Servant definitions. 
          This not only detects regressions during compile time but also provides customizable Elm functions 
          for fetching data from the server."""
      , tech = "Haskell, Elm, servant-server, haskell-to-elm, servant-to-elm"
      }
    , { title = "mu-graphql-example-elm"
      , url = Just "https://github.com/higherkindness/mu-graphql-example-elm"
      , description = """An example full-stack web app, developed with a schema-first, typesafe, and functional approach. 
          Leveraging the mu-haskell library, it performs type checking of Haskell code against GraphQL schema during compile time. 
          Additionally, the elm-graphql library generates Elm types, decoders/encoders from GraphQL schema. 
          I revamped the Elm frontend and made minor adjustments to the Haskell backend, 
          and uncovered some bugs in the mu-haskell library itself in the process."""
      , tech = "Haskell, Elm, GraphQL, mu-haskell, elm-graphql"
      }
    , { title = "Translation of the Mostly Adequate Guide to Functional Programming in JavaScript"
      , url = Just "https://github.com/MostlyAdequate/mostly-adequate-guide-ru"
      , description = """Translated the Mostly Adequate Guide to Functional Programming in JavaScript into Russian. 
          The book introduces the functional programming paradigm and outlines a functional approach to JavaScript application development. 
          I joined the translation effort when progress was at 60%. Collaborating with a friend, 
          we refactored each previously translated chapter before completing the translation."""
      , tech = "JavaScript, Ramda"
      }

    -- , { title = "FP Specialty"
    --   , url = Nothing
    --   , description = "Maintained a functional programming reading group from 2019 to 2021, welcoming individuals of all functional programming skill levels."
    --   , value = []
    --   }
    ]


type alias Education =
    { title : String
    , url : Maybe String
    , details : String
    }


education : List Education
education =
    [ {- { title = "Product Management Essentials"
           , url = Just "https://www.coursera.org/account/accomplishments/verify/DU4BJFRJH99A"
           , details = "The University of Maryland, 2024"
           }
         ,
      -}
      { title = "Mastering Haskell Programming"
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
