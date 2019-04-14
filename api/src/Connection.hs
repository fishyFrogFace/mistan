{-# LANGUAGE OverloadedStrings #-}

module Connection
    ( hello
    , test
    ) where

import Database.PostgreSQL.Simple

data Config = Config { postgresConfig :: ConnectInfo
                     , port :: Int
                     } deriving (Show)

connectInfo = ConnectInfo "localhost" 5432 "postgres" "" "mistan"

hello :: IO Int
hello = do
  conn <- connect connectInfo
  [Only i] <- query_ conn "select 2 + 2"
  return i

test = undefined