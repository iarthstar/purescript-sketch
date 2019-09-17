module Sketch.Utils where

import Prelude
import Control.Monad.Except (runExcept)
import Data.Either (Either(..))
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Decode, decode)

runExceptDecode :: forall a. Decode a => Effect Foreign -> Effect (Either (NonEmptyList ForeignError) a)
runExceptDecode get =
  runExcept <$> decode <$> get >>= pure
    <<< case _ of
        Left err -> Left err
        Right a -> Right a
