module Sketch.UI where

import Prelude

import Effect (Effect)
import Sketch.Types (Theme(..))

foreign import alert :: String -> String -> Effect Unit
foreign import message :: String -> Effect Unit

foreign import _getTheme :: Effect String

getTheme :: Effect Theme
getTheme = _getTheme <#> case _ of
        "LIGHT" -> LIGHT
        _ -> DARK