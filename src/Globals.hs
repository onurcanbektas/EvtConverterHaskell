module Globals where

import System.IO()
import System.Directory

iZone :: [Char]
iZone = "21.evt"

-- TODO: Check whether the file exists
iZonePath :: IO [Char]
iZonePath = do
 path <- getCurrentDirectory
 return (path ++ "/res/" ++ iZone)
