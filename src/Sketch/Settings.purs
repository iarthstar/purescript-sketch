module Sketch.Settings where
  
import Prelude

import Effect (Effect)
import Foreign (Foreign)
  
foreign import globalSettingForKey :: String -> Effect Foreign
foreign import setGlobalSettingForKey :: forall a. String -> a -> Effect Unit