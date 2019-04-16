{-# LANGUAGE OverloadedStrings #-}

module Queries.Insert
    ( newCompany
    , newCampus
    ) where

import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.ToRow
import GHC.Int (Int64)
import Data.Text (Text)

newCompany :: Connection -> Text -> IO Int64
newCompany conn name = execute conn "insert into company (name) values (?)" [name]

newCampus :: Connection -> (Text, Int) -> IO Int64
newCampus conn vals = execute conn "insert into campus (name, company_id) values (?, ?)" vals