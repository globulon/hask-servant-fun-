module Environment
  ( Users
  , Cached
  , Environment(..)
  , makeEnv
  ) where

import           Data.IORef
import           Data.Map   (Map, empty)
import qualified Data.Map   as Map
import           Domain     (User (..))

type Users = Map String User
type Cached a = IORef a

newtype Environment = Environment
  { users :: IO (Cached Users)
  }

makeEnv :: Environment
makeEnv = Environment makeUsers

makeUsers :: IO (Cached Users)
makeUsers = newIORef Map.empty
