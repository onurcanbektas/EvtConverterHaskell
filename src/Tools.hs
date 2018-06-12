module Tools where

import System.IO()
import System.Directory()

import Types
import Globals
import Exec


parseFile :: IO String -> IO [String]
parseFile path = do
 temp <- path
 contents <- readFile temp
 return (words $ contents)



decompEventBlocks :: [String] -> [[String]]
decompEventBlocks words
 | words /= [] = block : (decompEventBlocks $ drop blockSize words)
 -- No need to store "END" info in the blocks, so that is why we are appeding _block_ instead of _block'_
 | otherwise = []
  where
   block = (takeWhile (/="END") words)
   blockSize = (length block) + 1
   block' = take blockSize words


parseEventBlocks :: [[String]] -> [EVENT]
parseEventBlocks (x:blocks) =
 case (head x) of
  "EVENT" -> (EVENT (read (head . tail $ x) :: Integer) (parseEventCmdBlocks . tail . tail $ x)) : (parseEventBlocks blocks)
  otherwise -> (parseEventBlocks blocks)

parseEventCmdBlocks :: [String] -> [StatementType]
parseEventCmdBlocks (cmd:blockCmds) =
 case cmd of
  "E" -> (EXEC {cmd = head blockCmds, cmdParameters = (takeWhile (flip notElem ["A", "E"]) (tail blockCmds))}) : (parseEventCmdBlocks $ dropWhile (flip notElem ["A", "E"]) (tail blockCmds)) 
  "A" -> (LOGIC {cmd = head blockCmds, cmdParameters = (takeWhile (flip notElem ["A", "E"]) (tail blockCmds))}) : (parseEventCmdBlocks $ dropWhile (flip notElem ["A", "E"]) (tail blockCmds))
  otherwise -> (parseEventCmdBlocks $ dropWhile (flip notElem ["A", "E"]) blockCmds)
parseEventCmdBlocks [] = []