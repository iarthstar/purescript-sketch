# purescript-sketch

Sketch Javascript API wrapper for development of Sketch Plugin using PureScript

## Add purescript-sketch to your existing plugin projects

```
bower i purescript-sketch
```

## Code Snippet

```purescript
main :: Effect Unit
main = do
    Dom.selectedLayers >>= case _ of
        Left err -> UI.message "Something went wrong..."
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
```

## Example Plugins

* [Copy Paste Shadows](https://github.com/iarthstar/copy-paste-shadows)

## Want to Develop Plugin

* Project Template to start developing plugin :: [Write Sketch Plugins in PureScript](https://github.com/iarthstar/purs-sketch-plugin)