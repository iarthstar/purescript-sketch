module Sketch.Utils where

import Prelude
import Control.Monad.Except (runExcept)
import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Decode, decode)

foreign import copyToPasteboard :: String -> Effect Unit

runExceptDecode :: forall a. Decode a => Effect Foreign -> Effect (Either (NonEmptyList ForeignError) a)
runExceptDecode = map (runExcept <<< decode)
