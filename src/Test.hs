module Test where

import Globals


decompEventBlocks :: IO [String] -> IO [[String]]
decompEventBlocks words = do
    words' <- words 
    let block = (takeWhile (/="END") words')
    if not $ null words'
        then do 
          temp <- drop (length block) words'
          rest <- decompEventBlocks temp
          return $ block : rest
        else return []