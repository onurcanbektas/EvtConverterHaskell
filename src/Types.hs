module Types where

type EventNum = Integer

data StatementType =  EXEC {cmd :: String, cmdParameters :: [String]} | LOGIC {cmd :: String, cmdParameters :: [String]} | UnprocessedStm deriving (Show)
data EVENT = EVENT EventNum [StatementType] | UnprocessedEvent deriving (Show) 