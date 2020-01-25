module Sketch.Dom
  ( getDocuments
  , getSelectedDocument
  , selectedLayers
  , getLayerWithID
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

foreign import _getLayerWithID :: String -> Effect Foreign

foreign import _setPropsForLayerID :: String -> Array String -> Foreign -> Effect Unit


-- | A method to help find the first layer in this document which has the given id.
getLayerWithID :: String -> Effect (Either (NonEmptyList ForeignError) Layer)
getLayerWithID = runExceptDecode <<< _getLayerWithID


-- | A method to set value for the path in layer in this document which has the given id.
setPropsForLayerID :: forall a. Encode a => String -> Array String -> a -> Effect Unit
setPropsForLayerID id path val = _setPropsForLayerID id path (encode val)


-- | Access all the open Documents.
getDocuments :: Effect (Either (NonEmptyList ForeignError) (Array Document))
getDocuments = runExceptDecode _getDocuments


-- | Access the selected Document.
getSelectedDocument :: Effect (Either (NonEmptyList ForeignError) Document)
getSelectedDocument = runExceptDecode _getSelectedDocument


-- | Gets selected Layers.
selectedLayers :: Effect (Either (NonEmptyList ForeignError) (Array Layer))
selectedLayers = runExceptDecode _getSelection
