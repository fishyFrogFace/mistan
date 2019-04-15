module Config.Types
  (
  ) where

import Database.PostgreSQL.Simple (ConnectInfo(..))
import System.Envy (FromEnv, (.!=), envMaybe, fromEnv)

instance FromEnv ConnectInfo where
  fromEnv = ConnectInfo <$>
    envMaybe "POSTGRES_HOST"     .!= "localhost" <*>
    envMaybe "POSTGRES_PORT"     .!= 5432 <*>
    envMaybe "POSTGRES_USER"     .!= "postgres" <*>
    envMaybe "POSTGRES_PASS"     .!= "" <*>
    envMaybe "POSTGRES_DATABASE" .!= "postgres"