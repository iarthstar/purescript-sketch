module Sketch.Dom where
  
import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either(..))
import Effect (Effect)
import Foreign (F, Foreign)
import Foreign.Class (decode)
import Sketch.Types (Document, Layer)

foreign import _getDocuments :: Effect Foreign
foreign import _getSelectedDocument :: Effect Foreign
foreign import selection :: Effect Foreign

getDocuments :: Effect (Either String (Array Document))
getDocuments = do
  (documentsF :: F (Array Document)) <- decode <$> _getDocuments
  pure $ case runExcept documentsF of
    Left err -> Left "Error fetching Documents"
    Right documents -> Right documents

getSelectedDocument :: Effect (Either String Document)
getSelectedDocument = do
  (documentF :: F Document) <- decode <$> _getSelectedDocument
  pure $ case runExcept documentF of
    Left err -> Left "Error fetching selected Document"
    Right document -> Right document

selectedLayers :: Effect (Either String (Array Layer))
selectedLayers = do
  (layersF :: F (Array Layer)) <- decode <$> selection
  pure $ case runExcept layersF of
    Left err -> Left "Error Fetching Selection"
    Right layers -> Right layers