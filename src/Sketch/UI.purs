module Sketch.UI where
  
import Prelude

import Effect (Effect)

foreign import alert :: String -> String -> Effect Unit
foreign import message :: String -> Effect Unit