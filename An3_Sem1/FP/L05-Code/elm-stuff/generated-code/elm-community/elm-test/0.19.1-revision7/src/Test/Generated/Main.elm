module Test.Generated.Main exposing (main)

import DateTests
import Example
import ExerciseTests
import FirstTest
import OrganizedTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 337426773945830
        , processes = 16
        , globs =
            []
        , paths =
            [ "D:\\Facultate\\Uni-Labs\\An3_Sem1\\FP\\L05-Code\\tests\\DateTests.elm"
            , "D:\\Facultate\\Uni-Labs\\An3_Sem1\\FP\\L05-Code\\tests\\Example.elm"
            , "D:\\Facultate\\Uni-Labs\\An3_Sem1\\FP\\L05-Code\\tests\\ExerciseTests.elm"
            , "D:\\Facultate\\Uni-Labs\\An3_Sem1\\FP\\L05-Code\\tests\\FirstTest.elm"
            , "D:\\Facultate\\Uni-Labs\\An3_Sem1\\FP\\L05-Code\\tests\\OrganizedTests.elm"
            ]
        }
        [ ( "DateTests"
          , [ Test.Runner.Node.check DateTests.suite
            ]
          )
        , ( "Example"
          , [ Test.Runner.Node.check Example.suite
            ]
          )
        , ( "ExerciseTests"
          , [ Test.Runner.Node.check ExerciseTests.suite
            ]
          )
        , ( "FirstTest"
          , [ Test.Runner.Node.check FirstTest.emptyListTakeTest
            ]
          )
        , ( "OrganizedTests"
          , [ Test.Runner.Node.check OrganizedTests.listTests
            ]
          )
        ]