module Test.Main where

import Prelude

import Data.Array (foldl, length, mapWithIndex)
import Data.Either (Either(..))
import Data.Lens ((^.))
import Data.Maybe (Maybe(..))
import Data.Traversable (traverse)
import Effect (Effect)
import Effect.Console (logShow)
import Sketch.Accessors (_id)
import Sketch.Dom (setPropsForLayer)
import Sketch.Dom as Dom
import Sketch.Types (ArtboardLayer(..), Document(..), GroupLayer(..), ImageLayer(..), InputType(..), Layer(..), Shadow, ShapeLayer(..), TextLayer(..), Theme(..))
import Sketch.UI as UI

main :: Effect Unit
main = do
  UI.getInputFromUser "Question" (SELECTION ["Yes", "No"] "Choose from down" Nothing) >>= case _ of
    Left err -> UI.message "Something went wrong..."
    Right (ans :: String) -> UI.alert "Answer" ans 

  Dom.getSelectedDocument >>= case _ of
    Left err -> UI.message "Something went wrong..."
    Right doc -> UI.alert "Selected Document ID" $ doc ^. _id
  
  UI.getTheme >>= UI.alert "Theme" <<< case _ of
    LIGHT -> "Light"
    DARK -> "Dark"

  Dom.selectedLayers >>= case _ of
    Left err -> UI.message "Something went wrong..."
    Right layers -> do
      if length layers == 0
        then UI.alert "No Selection" "Please select a layer and try again..."
        else do
          _ <- traverse setProps layers
          logShow $ foldl (\a b -> a <> b) "" $ mapWithIndex parseLayers layers
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

    setProps :: Layer -> Effect Unit
    setProps l = setPropsForLayer l ["style", "shadows"] ([] :: Array Shadow)
