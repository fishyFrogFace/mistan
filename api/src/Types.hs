module Types
    ( Company(..)
    , Campus(..)
    , Building(..)
    , Floor(..)
    , Room(..)
    , ItemType(..)
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
  { campusId    :: Int
  , campusName  :: Text
  , fkCompanyId :: Int
  } deriving (Eq, Show)

instance FromRow Campus where
  fromRow = Campus <$> field <*> field <*> field

instance ToRow Campus where
  toRow c = [toField (campusId c), toField (campusName c), toField (fkCompanyId c)]

data Building = Building
  { buildingId   :: Int
  , buildingName :: Text
  , fkCampusId   :: Int
  } deriving (Eq, Show)

instance FromRow Building where
  fromRow = Building <$> field <*> field <*> field
  
instance ToRow Building where
  toRow b = [toField (buildingId b), toField (buildingName b), toField (fkCampusId b)]

data Floor = Floor
  { floorId      :: Int
  , floorName    :: Text
  , fkBuildingId :: Int
  }

instance FromRow Floor where
  fromRow = Floor <$> field <*> field <*> field
    
instance ToRow Floor where
  toRow f = [toField (floorId f), toField (floorName f), toField (fkBuildingId f)]

data Room = Room
  { roomId    :: Int
  , roomName  :: Text
  , fkFloorId :: Int
  }

instance FromRow Room where
  fromRow = Room <$> field <*> field <*> field

instance ToRow Room where
  toRow r = [toField (roomId r), toField (roomName r), toField (fkFloorId r)]

data ItemType = ItemType
  { itemTypeId   :: Int
  , itemTypeName :: Text
  }

instance FromRow ItemType where
  fromRow = ItemType <$> field <*> field
  
instance ToRow ItemType where
  toRow r = [toField (itemTypeId r), toField (itemTypeName r)]