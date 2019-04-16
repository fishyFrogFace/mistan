module Types
    ( Company(..)
    , Campus(..)
    ) where

import Data.Text (Text)
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.ToRow
import Database.PostgreSQL.Simple.ToField

data Company = Company
  { companyId   :: Int
  , companyName :: Text
  } deriving (Eq, Show)

instance FromRow Company where
  fromRow = Company <$> field <*> field

instance ToRow Company where
  toRow c = [toField (companyId c), toField (companyName c)]

data Campus = Campus
  { campusId     :: Int
  , campusName   :: String
  , fkCompanyId  :: Int
  } deriving (Eq, Show)

instance FromRow Campus where
  fromRow = Campus <$> field <*> field <*> field

instance ToRow Campus where
  toRow c = [toField (campusId c), toField (campusName c), toField (fkCompanyId c)]