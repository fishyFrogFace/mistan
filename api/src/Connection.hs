{-# LANGUAGE OverloadedStrings #-}

module Connection
    ( hello
    ) where

import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.ToRow
import System.Envy

import Config.Types
import Types
import qualified Queries.Insert as I

hello :: IO ()
hello = do
  info <- decodeEnv :: IO (Either String ConnectInfo)
  case info of
    Left err -> putStrLn err
    Right ci -> do
        print ci
        conn <- connect ci
        b <- I.newCompany conn "lalalæøå'€ÆØÅ"
        print b