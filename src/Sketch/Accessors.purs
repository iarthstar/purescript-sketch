module Sketch.Accessors where

import Prelude

import Data.Lens (Lens', lens)
import Data.Newtype (class Newtype, unwrap, wrap)

-- | Lens for key : type
_type :: forall a b c. Newtype a { type :: b | c } => Lens' a b
_type = lens (unwrap >>> _.type) (\oldRec newVal -> wrap ((unwrap oldRec) { type = newVal }))

-- | Lens for key : id
_id :: forall a b c. Newtype a { id :: b | c } => Lens' a b
_id = lens (unwrap >>> _.id) (\oldRec newVal -> wrap ((unwrap oldRec) { id = newVal }))

-- | Lens for key : pages
_pages :: forall a b c. Newtype a { pages :: b | c } => Lens' a b
_pages = lens (unwrap >>> _.pages) (\oldRec newVal -> wrap ((unwrap oldRec) { pages = newVal }))

-- | Lens for key : path
_path :: forall a b c. Newtype a { path :: b | c } => Lens' a b
_path = lens (unwrap >>> _.path) (\oldRec newVal -> wrap ((unwrap oldRec) { path = newVal }))

-- | Lens for key : frame
_frame :: forall a b c. Newtype a { frame :: b | c } => Lens' a b
_frame = lens (unwrap >>> _.frame) (\oldRec newVal -> wrap ((unwrap oldRec) { frame = newVal }))

-- | Lens for key : name
_name :: forall a b c. Newtype a { name :: b | c } => Lens' a b
_name = lens (unwrap >>> _.name) (\oldRec newVal -> wrap ((unwrap oldRec) { name = newVal }))

-- | Lens for key : selected
_selected :: forall a b c. Newtype a { selected :: b | c } => Lens' a b
_selected = lens (unwrap >>> _.selected) (\oldRec newVal -> wrap ((unwrap oldRec) { selected = newVal }))

-- | Lens for key : layers
_layers :: forall a b c. Newtype a { layers :: b | c } => Lens' a b
_layers = lens (unwrap >>> _.layers) (\oldRec newVal -> wrap ((unwrap oldRec) { layers = newVal }))

-- | Lens for key : x
_x :: forall a b c. Newtype a { x :: b | c } => Lens' a b
_x = lens (unwrap >>> _.x) (\oldRec newVal -> wrap ((unwrap oldRec) { x = newVal }))

-- | Lens for key : y
_y :: forall a b c. Newtype a { y :: b | c } => Lens' a b
_y = lens (unwrap >>> _.y) (\oldRec newVal -> wrap ((unwrap oldRec) { y = newVal }))

-- | Lens for key : width
_width :: forall a b c. Newtype a { width :: b | c } => Lens' a b
_width = lens (unwrap >>> _.width) (\oldRec newVal -> wrap ((unwrap oldRec) { width = newVal }))

-- | Lens for key : height
_height :: forall a b c. Newtype a { height :: b | c } => Lens' a b
_height = lens (unwrap >>> _.height) (\oldRec newVal -> wrap ((unwrap oldRec) { height = newVal }))

-- | Lens for key : exportFormats
_exportFormats :: forall a b c. Newtype a { exportFormats :: b | c } => Lens' a b
_exportFormats = lens (unwrap >>> _.exportFormats) (\oldRec newVal -> wrap ((unwrap oldRec) { exportFormats = newVal }))

-- | Lens for key : background
_background :: forall a b c. Newtype a { background :: b | c } => Lens' a b
_background = lens (unwrap >>> _.background) (\oldRec newVal -> wrap ((unwrap oldRec) { background = newVal }))

-- | Lens for key : hidden
_hidden :: forall a b c. Newtype a { hidden :: b | c } => Lens' a b
_hidden = lens (unwrap >>> _.hidden) (\oldRec newVal -> wrap ((unwrap oldRec) { hidden = newVal }))

-- | Lens for key : locked
_locked :: forall a b c. Newtype a { locked :: b | c } => Lens' a b
_locked = lens (unwrap >>> _.locked) (\oldRec newVal -> wrap ((unwrap oldRec) { locked = newVal }))

-- | Lens for key : style
_style :: forall a b c. Newtype a { style :: b | c } => Lens' a b
_style = lens (unwrap >>> _.style) (\oldRec newVal -> wrap ((unwrap oldRec) { style = newVal }))

-- | Lens for key : text
_text :: forall a b c. Newtype a { text :: b | c } => Lens' a b
_text = lens (unwrap >>> _.text) (\oldRec newVal -> wrap ((unwrap oldRec) { text = newVal }))

-- | Lens for key : lineSpacing
_lineSpacing :: forall a b c. Newtype a { lineSpacing :: b | c } => Lens' a b
_lineSpacing = lens (unwrap >>> _.lineSpacing) (\oldRec newVal -> wrap ((unwrap oldRec) { lineSpacing = newVal }))

-- | Lens for key : fixedWidth
_fixedWidth :: forall a b c. Newtype a { fixedWidth :: b | c } => Lens' a b
_fixedWidth = lens (unwrap >>> _.fixedWidth) (\oldRec newVal -> wrap ((unwrap oldRec) { fixedWidth = newVal }))

-- | Lens for key : opacity
_opacity :: forall a b c. Newtype a { opacity :: b | c } => Lens' a b
_opacity = lens (unwrap >>> _.opacity) (\oldRec newVal -> wrap ((unwrap oldRec) { opacity = newVal }))

-- | Lens for key : alignment
_alignment :: forall a b c. Newtype a { alignment :: b | c } => Lens' a b
_alignment = lens (unwrap >>> _.alignment) (\oldRec newVal -> wrap ((unwrap oldRec) { alignment = newVal }))

-- | Lens for key : verticalAlignment
_verticalAlignment :: forall a b c. Newtype a { verticalAlignment :: b | c } => Lens' a b
_verticalAlignment = lens (unwrap >>> _.verticalAlignment) (\oldRec newVal -> wrap ((unwrap oldRec) { verticalAlignment = newVal }))

-- | Lens for key : kerning
_kerning :: forall a b c. Newtype a { kerning :: b | c } => Lens' a b
_kerning = lens (unwrap >>> _.kerning) (\oldRec newVal -> wrap ((unwrap oldRec) { kerning = newVal }))

-- | Lens for key : lineHeight
_lineHeight :: forall a b c. Newtype a { lineHeight :: b | c } => Lens' a b
_lineHeight = lens (unwrap >>> _.lineHeight) (\oldRec newVal -> wrap ((unwrap oldRec) { lineHeight = newVal }))

-- | Lens for key : textColor
_textColor :: forall a b c. Newtype a { textColor :: b | c } => Lens' a b
_textColor = lens (unwrap >>> _.textColor) (\oldRec newVal -> wrap ((unwrap oldRec) { textColor = newVal }))

-- | Lens for key : fontSize
_fontSize :: forall a b c. Newtype a { fontSize :: b | c } => Lens' a b
_fontSize = lens (unwrap >>> _.fontSize) (\oldRec newVal -> wrap ((unwrap oldRec) { fontSize = newVal }))

-- | Lens for key : textTransform
_textTransform :: forall a b c. Newtype a { textTransform :: b | c } => Lens' a b
_textTransform = lens (unwrap >>> _.textTransform) (\oldRec newVal -> wrap ((unwrap oldRec) { textTransform = newVal }))

-- | Lens for key : fontFamily
_fontFamily :: forall a b c. Newtype a { fontFamily :: b | c } => Lens' a b
_fontFamily = lens (unwrap >>> _.fontFamily) (\oldRec newVal -> wrap ((unwrap oldRec) { fontFamily = newVal }))

-- | Lens for key : fontWeight
_fontWeight :: forall a b c. Newtype a { fontWeight :: b | c } => Lens' a b
_fontWeight = lens (unwrap >>> _.fontWeight) (\oldRec newVal -> wrap ((unwrap oldRec) { fontWeight = newVal }))

-- | Lens for key : shadows
_shadows :: forall a b c. Newtype a { shadows :: b | c } => Lens' a b
_shadows = lens (unwrap >>> _.shadows) (\oldRec newVal -> wrap ((unwrap oldRec) { shadows = newVal }))

-- | Lens for key : image
_image :: forall a b c. Newtype a { image :: b | c } => Lens' a b
_image = lens (unwrap >>> _.image) (\oldRec newVal -> wrap ((unwrap oldRec) { image = newVal }))

-- | Lens for key : shapeType
_shapeType :: forall a b c. Newtype a { shapeType :: b | c } => Lens' a b
_shapeType = lens (unwrap >>> _.shapeType) (\oldRec newVal -> wrap ((unwrap oldRec) { shapeType = newVal }))

-- | Lens for key : points
_points :: forall a b c. Newtype a { points :: b | c } => Lens' a b
_points = lens (unwrap >>> _.points) (\oldRec newVal -> wrap ((unwrap oldRec) { points = newVal }))

-- | Lens for key : fills
_fills :: forall a b c. Newtype a { fills :: b | c } => Lens' a b
_fills = lens (unwrap >>> _.fills) (\oldRec newVal -> wrap ((unwrap oldRec) { fills = newVal }))

-- | Lens for key : borders
_borders :: forall a b c. Newtype a { borders :: b | c } => Lens' a b
_borders = lens (unwrap >>> _.borders) (\oldRec newVal -> wrap ((unwrap oldRec) { borders = newVal }))

-- | Lens for key : fill
_fill :: forall a b c. Newtype a { fill :: b | c } => Lens' a b
_fill = lens (unwrap >>> _.fill) (\oldRec newVal -> wrap ((unwrap oldRec) { fill = newVal }))

-- | Lens for key : color
_color :: forall a b c. Newtype a { color :: b | c } => Lens' a b
_color = lens (unwrap >>> _.color) (\oldRec newVal -> wrap ((unwrap oldRec) { color = newVal }))

-- | Lens for key : gradient
_gradient :: forall a b c. Newtype a { gradient :: b | c } => Lens' a b
_gradient = lens (unwrap >>> _.gradient) (\oldRec newVal -> wrap ((unwrap oldRec) { gradient = newVal }))

-- | Lens for key : enabled
_enabled :: forall a b c. Newtype a { enabled :: b | c } => Lens' a b
_enabled = lens (unwrap >>> _.enabled) (\oldRec newVal -> wrap ((unwrap oldRec) { enabled = newVal }))

-- | Lens for key : fillType
_fillType :: forall a b c. Newtype a { fillType :: b | c } => Lens' a b
_fillType = lens (unwrap >>> _.fillType) (\oldRec newVal -> wrap ((unwrap oldRec) { fillType = newVal }))

-- | Lens for key : position
_position :: forall a b c. Newtype a { position :: b | c } => Lens' a b
_position = lens (unwrap >>> _.position) (\oldRec newVal -> wrap ((unwrap oldRec) { position = newVal }))

-- | Lens for key : thickness
_thickness :: forall a b c. Newtype a { thickness :: b | c } => Lens' a b
_thickness = lens (unwrap >>> _.thickness) (\oldRec newVal -> wrap ((unwrap oldRec) { thickness = newVal }))

-- | Lens for key : cornerRadius
_cornerRadius :: forall a b c. Newtype a { cornerRadius :: b | c } => Lens' a b
_cornerRadius = lens (unwrap >>> _.cornerRadius) (\oldRec newVal -> wrap ((unwrap oldRec) { cornerRadius = newVal }))

-- | Lens for key : curveFrom
_curveFrom :: forall a b c. Newtype a { curveFrom :: b | c } => Lens' a b
_curveFrom = lens (unwrap >>> _.curveFrom) (\oldRec newVal -> wrap ((unwrap oldRec) { curveFrom = newVal }))

-- | Lens for key : curveTo
_curveTo :: forall a b c. Newtype a { curveTo :: b | c } => Lens' a b
_curveTo = lens (unwrap >>> _.curveTo) (\oldRec newVal -> wrap ((unwrap oldRec) { curveTo = newVal }))

-- | Lens for key : point
_point :: forall a b c. Newtype a { point :: b | c } => Lens' a b
_point = lens (unwrap >>> _.point) (\oldRec newVal -> wrap ((unwrap oldRec) { point = newVal }))

-- | Lens for key : pointType
_pointType :: forall a b c. Newtype a { pointType :: b | c } => Lens' a b
_pointType = lens (unwrap >>> _.pointType) (\oldRec newVal -> wrap ((unwrap oldRec) { pointType = newVal }))

-- | Lens for key : blur
_blur :: forall a b c. Newtype a { blur :: b | c } => Lens' a b
_blur = lens (unwrap >>> _.blur) (\oldRec newVal -> wrap ((unwrap oldRec) { blur = newVal }))

-- | Lens for key : spread
_spread :: forall a b c. Newtype a { spread :: b | c } => Lens' a b
_spread = lens (unwrap >>> _.spread) (\oldRec newVal -> wrap ((unwrap oldRec) { spread = newVal }))

-- | Lens for key : gradientType
_gradientType :: forall a b c. Newtype a { gradientType :: b | c } => Lens' a b
_gradientType = lens (unwrap >>> _.gradientType) (\oldRec newVal -> wrap ((unwrap oldRec) { gradientType = newVal }))

-- | Lens for key : from
_from :: forall a b c. Newtype a { from :: b | c } => Lens' a b
_from = lens (unwrap >>> _.from) (\oldRec newVal -> wrap ((unwrap oldRec) { from = newVal }))

-- | Lens for key : to
_to :: forall a b c. Newtype a { to :: b | c } => Lens' a b
_to = lens (unwrap >>> _.to) (\oldRec newVal -> wrap ((unwrap oldRec) { to = newVal }))

-- | Lens for key : stops
_stops :: forall a b c. Newtype a { stops :: b | c } => Lens' a b
_stops = lens (unwrap >>> _.stops) (\oldRec newVal -> wrap ((unwrap oldRec) { stops = newVal }))

-- | Lens for key : fileFormat
_fileFormat :: forall a b c. Newtype a { fileFormat :: b | c } => Lens' a b
_fileFormat = lens (unwrap >>> _.fileFormat) (\oldRec newVal -> wrap ((unwrap oldRec) { fileFormat = newVal }))

-- | Lens for key : size
_size :: forall a b c. Newtype a { size :: b | c } => Lens' a b
_size = lens (unwrap >>> _.size) (\oldRec newVal -> wrap ((unwrap oldRec) { size = newVal }))

-- | Lens for key : includedInExport
_includedInExport :: forall a b c. Newtype a { includedInExport :: b | c } => Lens' a b
_includedInExport = lens (unwrap >>> _.includedInExport) (\oldRec newVal -> wrap ((unwrap oldRec) { includedInExport = newVal }))
