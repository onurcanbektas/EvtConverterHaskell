module Main where

import Types
import Globals
import Tools

main :: IO ()
main = do
 let terms = parseFile iZonePath
 terms' <- terms
 let blocks = decompEventBlocks terms'
     eventBlocks = parseEventBlocks blocks
 putStrLn "done!\n"

