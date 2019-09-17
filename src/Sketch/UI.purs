module Sketch.UI
  ( alert
  , message
  , getInputFromUser
  , getTheme
  ) where

import Prelude
import Data.Either (Either(..))
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Effect.Aff (attempt, launchAff_)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Effect.Class (liftEffect)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Decode, encode)
import Sketch.Settings as Settings
import Sketch.Types (InputType, Theme(..))

foreign import alert :: String -> String -> Effect Unit

foreign import message :: String -> Effect Unit

foreign import _getInputFromUser :: String -> Foreign -> EffectFnAff String

getInputFromUser :: forall a. Decode a => String -> InputType -> Effect (Either (NonEmptyList ForeignError) a)
getInputFromUser msg inputType = do
  launchAff_ $ attempt (fromEffectFnAff $ _getInputFromUser msg (encode inputType)) >>= liftEffect
    <<< case _ of
        Left err -> Settings.setSessionVariable "inputFromUser" "undefined"
        Right a -> Settings.setSessionVariable "inputFromUser" a
  Settings.sessionVariable "inputFromUser"

foreign import _getTheme :: Effect String

getTheme :: Effect Theme
getTheme =
  _getTheme
    <#> case _ of
        "LIGHT" -> LIGHT
        _ -> DARK
