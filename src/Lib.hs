module Lib
    ( grid
    , languages
    , formatGrid
    , outputGrid
    , findWord
    , findWords
    , findWordInLine
    ) where

import Data.List (isInfixOf)
import Data.Maybe (catMaybes)

type Grid = [String]

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn $ formatGrid grid

formatGrid :: Grid -> String
formatGrid = unlines

findWord :: Grid -> String -> Maybe String
findWord grid word =
  let lines = grid ++ (map reverse grid)
      found = or $ map (findWordInLine word) lines
  in if found then Just word else Nothing

findWords :: Grid -> [String] -> [String]
findWords grid words = catMaybes $ map (findWord grid) words

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

grid = [ "--C--------R---"
       , "--SI--------U--"
       , "--HASKELL----B-"
       , "--A--A-----S--Y"
       , "--R---B---C----"
       , "--PHP----H-----"
       , "----S-LREP-----"
       , "----I--M-Y--L--"
       , "----L-E--T-O---"
       , "---------HB----"
       , "---------O-----"
       , "--------CN-----"
       ]

languages = [ "BASIC"
            , "COBOL"
            , "CSHARP"
            , "HASKELL"
            , "LISP"
            , "PERL"
            , "PHP"
            , "PYTHON"
            , "RUBY"
            , "SCHEME"
            ]
