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

newBuilding :: Connection -> (Text, Int) -> IO Int64
newBuilding conn vals = execute conn "insert into building (name, campus_id) values (?, ?)" vals

newFloor :: Connection -> (Text, Int) -> IO Int64
newFloor conn vals = execute conn "insert into floor (name, building_id) values (?, ?)" vals