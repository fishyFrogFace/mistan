module Types
    ( Company(..)
    , Campus(..)
    , Building(..)
    , Floor(..)
    , Room(..)
    , Status(..)
    , ItemType(..)
    , MovedTo(..)
    ) where

import Data.Text (Text)
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple.ToRow
import Database.PostgreSQL.Simple.ToField
import Database.PostgreSQL.Simple.Time

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

data Status = Found | Lost | Returned deriving (Eq)

instance Show Status where
  show Found    = "found"
  show Lost     = "lost"
  show Returned = "returned"

data ItemType = ItemType
  { itemTypeNo  :: Int
  , itemTypeEng :: Text
  }

instance FromRow ItemType where
  fromRow = ItemType <$> field <*> field
  
instance ToRow ItemType where
  toRow it = [toField (itemTypeNo it), toField (itemTypeEng it)]

data Item = Item
  { itemId       :: Int
  , description  :: Text
  , fkitemTypeId :: Int
  }

instance FromRow Item where
  fromRow = Item <$> field <*> field <*> field

instance ToRow Item where
  toRow i = [toField (itemId i), toField (description i), toField (fkitemTypeId i)]

data MovedTo = MovedTo
  { fkItemId     :: Int
  , registeredAs :: Status
  , fkMovedFrom  :: Int
  , fkMovedTo    :: Int
  , movedDate    :: ZonedTimestamp
  }