{-# LANGUAGE OverloadedStrings #-}

module Connection
    ( hello
    ) where

import Database.PostgreSQL.Simple
import System.Envy

import Config.Types

hello :: IO ()
hello = do
  info <- decodeEnv :: IO (Either String ConnectInfo)
  case info of
    Left err -> putStrLn err
    Right ci -> do
        conn <- connect ci
        i <- query_ conn "select 2 + 2" :: IO [Only Int]
        print i