module Sketch.Dom where
  
import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either(..))
import Effect (Effect)
import Foreign (F, Foreign)
import Foreign.Class (decode)
import Sketch.Types (Layer)

foreign import selection :: Effect Foreign

selectedLayers :: Effect (Either String (Array Layer))
selectedLayers = do
  (layersF :: F (Array Layer)) <- decode <$> selection
  pure $ case runExcept layersF of
    Left err -> Left "Error Fetching Selection"
    Right layers -> Right layers