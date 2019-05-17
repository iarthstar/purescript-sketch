module Sketch.Settings where
  
import Prelude

import Effect (Effect)
import Foreign (Foreign)
  
foreign import globalSettingForKey :: String -> Effect Foreign
foreign import setGlobalSettingForKey :: forall a. String -> a -> Effect Unit

foreign import settingForKey :: String -> Effect Foreign
foreign import setSettingForKey :: forall a. String -> a -> Effect Unit

foreign import sessionVariable :: String -> Effect Foreign
foreign import setSessionVariable :: forall a. String -> a -> Effect Unit