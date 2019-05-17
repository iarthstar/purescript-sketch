module Test.Main where

import Prelude

import Data.Array (foldl, length, mapWithIndex)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Console (logShow)
import Sketch.Dom as Dom
import Sketch.Types (GroupLayer(..), ImageLayer(..), Layer(..), ShapeLayer(..), TextLayer(..), ArtboardLayer(..), Theme(..), Document(..))
import Sketch.UI as UI

main :: Effect Unit
main = do
  Dom.getSelectedDocument >>= case _ of
    Left err -> UI.message "Something went wrong..."
    Right (Document doc) -> do
      UI.alert "Selected Document ID" doc.id
  
  UI.getTheme >>= UI.alert "Theme" <<< case _ of
    LIGHT -> "Light"
    DARK -> "Dark"

  selection <- Dom.selectedLayers
  case selection of
    Left err -> UI.alert "" "Something went wrong..."
    Right layers -> do
      if length layers == 0
        then UI.alert "No Selection" "Please select a layer and try again..."
        else logShow $ foldl (\a b -> a <> b) "" $ mapWithIndex parseLayers layers
  where
    parseLayers :: Int -> Layer -> String
    parseLayers index layer = do
      let name = case layer of
            Text (TextLayer tl) -> tl.name
            Image (ImageLayer il) -> il.name
            Shape (ShapeLayer sl) -> sl.name
            Group (GroupLayer gl) -> gl.name
            Artboard (ArtboardLayer gl) -> gl.name
      show index <> ". " <> name
