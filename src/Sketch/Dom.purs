module Sketch.Dom
  ( getDocuments
  , getSelectedDocument
  , selectedLayers
  , setPropsForLayerID
  ) where

import Prelude
import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Foreign (Foreign, ForeignError)
import Foreign.Class (class Encode, encode)
import Sketch.Types (Document, Layer)
import Sketch.Utils (runExceptDecode)

foreign import _getDocuments :: Effect Foreign

foreign import _getSelectedDocument :: Effect Foreign

foreign import _getSelection :: Effect Foreign

foreign import _setPropsForLayerID :: String -> Array String -> Foreign -> Effect Unit

setPropsForLayerID :: forall a. Encode a => String -> Array String -> a -> Effect Unit
setPropsForLayerID id path val = _setPropsForLayerID id path (encode val)

getDocuments :: Effect (Either (NonEmptyList ForeignError) (Array Document))
getDocuments = runExceptDecode _getDocuments

getSelectedDocument :: Effect (Either (NonEmptyList ForeignError) Document)
getSelectedDocument = runExceptDecode _getSelectedDocument

selectedLayers :: Effect (Either (NonEmptyList ForeignError) (Array Layer))
selectedLayers = runExceptDecode _getSelection
