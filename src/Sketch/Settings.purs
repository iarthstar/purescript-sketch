module Sketch.Settings 
    ( globalSettingForKey
    , setGlobalSettingForKey
    , settingForKey
    , setSettingForKey
    , sessionVariable
    , setSessionVariable
    ) where

import Prelude

import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Decode, class Encode, encode)
import Sketch.Utils (runExceptDecode)

foreign import _setGlobalSettingForKey :: String -> Foreign -> Effect Unit
foreign import _setSettingForKey :: String -> Foreign -> Effect Unit
foreign import _setSessionVariable :: String -> Foreign -> Effect Unit

foreign import _globalSettingForKey :: String -> Effect Foreign
foreign import _settingForKey :: String -> Effect Foreign
foreign import _sessionVariable :: String -> Effect Foreign

globalSettingForKey :: forall a. Decode a => String -> Effect (Either (NonEmptyList ForeignError) a)
globalSettingForKey = runExceptDecode <<< _globalSettingForKey

settingForKey :: forall a. Decode a => String -> Effect (Either (NonEmptyList ForeignError) a)
settingForKey = runExceptDecode <<< _settingForKey

sessionVariable :: forall a. Decode a => String -> Effect (Either (NonEmptyList ForeignError) a)
sessionVariable = runExceptDecode <<< _sessionVariable

setGlobalSettingForKey :: forall a. Encode a => String -> a -> Effect Unit
setGlobalSettingForKey key val = _setGlobalSettingForKey key (encode val)

setSettingForKey :: forall a. Encode a => String -> a -> Effect Unit
setSettingForKey key val = _setSettingForKey key (encode val)

setSessionVariable :: forall a. Encode a => String -> a -> Effect Unit
setSessionVariable key val = _setSessionVariable key (encode val)