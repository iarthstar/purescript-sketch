module Sketch.Types where

import Prelude
import Control.Alt ((<|>))
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Foreign.Class (class Decode, class Encode, decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)

data Theme
  = LIGHT
  | DARK

data InputType
  = STRING String String (Maybe Int)
  | SELECTION (Array String) String (Maybe String)

derive instance genericInputType :: Generic InputType _

instance encodeInputType :: Encode InputType where
  encode = genericEncode (defaultOptions)

newtype Document
  = Document
  { type :: String
  , id :: String
  , pages :: Array Page
  , path :: Maybe String
  }

derive instance newtypeDocument :: Newtype Document _

derive instance genericDocument :: Generic Document _

instance encodeDocument :: Encode Document where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeDocument :: Decode Document where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Page
  = Page
  { type :: String
  , id :: String
  , frame :: Frame
  , name :: String
  , selected :: Boolean
  , layers :: Array Layer
  }

derive instance newtypePage :: Newtype Page _

derive instance genericPage :: Generic Page _

instance encodePage :: Encode Page where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodePage :: Decode Page where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Frame
  = Frame
  { x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  }

derive instance newtypeFrame :: Newtype Frame _

derive instance genericFrame :: Generic Frame _

instance encodeFrame :: Encode Frame where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeFrame :: Decode Frame where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

data Layer
  = Artboard ArtboardLayer
  | Text TextLayer
  | Image ImageLayer
  | Shape ShapeLayer
  | Group GroupLayer

derive instance genericLayer :: Generic Layer _

instance encodeLayer :: Encode Layer where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeLayer :: Decode Layer where
  decode str =
    (Artboard <$> (decode str))
      <|> (Text <$> (decode str))
      <|> (Image <$> (decode str))
      <|> (Shape <$> (decode str))
      <|> (Group <$> (decode str))

newtype ArtboardLayer
  = ArtboardLayer
  { type :: String
  , id :: String
  , frame :: Frame
  , name :: String
  , selected :: Boolean
  , exportFormats :: Array ExportFormat
  , background :: Background
  , layers :: Array Layer
  }

derive instance newtypeArtboardLayer :: Newtype ArtboardLayer _

derive instance genericArtboardLayer :: Generic ArtboardLayer _

instance encodeArtboardLayer :: Encode ArtboardLayer where
  encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

instance decodeArtboardLayer :: Decode ArtboardLayer where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype TextLayer
  = TextLayer
  { type :: String
  , id :: String
  , frame :: Frame
  , name :: String
  , hidden :: Boolean
  , locked :: Boolean
  , style :: TextStyle
  , text :: String
  , lineSpacing :: String
  , fixedWidth :: Boolean
  }

derive instance newtypeTextLayer :: Newtype TextLayer _

derive instance genericTextLayer :: Generic TextLayer _

instance encodeTextLayer :: Encode TextLayer where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeTextLayer :: Decode TextLayer where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype TextStyle
  = TextStyle
  { type :: String
  , id :: String
  , opacity :: Number
  , alignment :: String
  , verticalAlignment :: String
  , kerning :: Maybe Number
  , lineHeight :: Maybe Number
  , textColor :: String
  , fontSize :: Number
  , textTransform :: String
  , fontFamily :: String
  , fontWeight :: Number
  , shadows :: Maybe (Array Shadow)
  }

derive instance newtypeTextStyle :: Newtype TextStyle _

derive instance genericTextStyle :: Generic TextStyle _

instance encodeTextStyle :: Encode TextStyle where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeTextStyle :: Decode TextStyle where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype GroupLayer
  = GroupLayer
  { type :: String
  , id :: String
  , frame :: Frame
  , name :: String
  , hidden :: Boolean
  , locked :: Boolean
  , style :: GroupStyle
  , layers :: Array Layer
  }

derive instance newtypeGroupLayer :: Newtype GroupLayer _

derive instance genericGroupLayer :: Generic GroupLayer _

instance encodeGroupLayer :: Encode GroupLayer where
  encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

instance decodeGroupLayer :: Decode GroupLayer where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype GroupStyle
  = GroupStyle
  { type :: String
  , id :: String
  , opacity :: Number
  , shadows :: Maybe (Array Shadow)
  }

derive instance newtypeGroupStyle :: Newtype GroupStyle _

derive instance genericGroupStyle :: Generic GroupStyle _

instance encodeGroupStyle :: Encode GroupStyle where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeGroupStyle :: Decode GroupStyle where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype ImageLayer
  = ImageLayer
  { type :: String
  , id :: String
  , frame :: Frame
  , name :: String
  , hidden :: Boolean
  , locked :: Boolean
  , style :: ImageStyle
  , image :: ImageData
  }

derive instance newtypeImageLayer :: Newtype ImageLayer _

derive instance genericImageLayer :: Generic ImageLayer _

instance encodeImageLayer :: Encode ImageLayer where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeImageLayer :: Decode ImageLayer where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype ImageStyle
  = ImageStyle
  { type :: String
  , id :: String
  , opacity :: Number
  , shadows :: Maybe (Array Shadow)
  }

derive instance newtypeImageStyle :: Newtype ImageStyle _

derive instance genericImageStyle :: Generic ImageStyle _

instance encodeImageStyle :: Encode ImageStyle where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeImageStyle :: Decode ImageStyle where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype ImageData
  = ImageData
  { type :: String
  , id :: String
  }

derive instance newtypeImageData :: Newtype ImageData _

derive instance genericImageData :: Generic ImageData _

instance encodeImageData :: Encode ImageData where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeImageData :: Decode ImageData where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype ShapeLayer
  = ShapeLayer
  { type :: String
  , id :: String
  , frame :: Frame
  , name :: String
  , hidden :: Boolean
  , locked :: Boolean
  , style :: ShapeStyle
  , shapeType :: String
  , points :: Array Points
  }

derive instance newtypeShapeLayer :: Newtype ShapeLayer _

derive instance genericShapeLayer :: Generic ShapeLayer _

instance encodeShapeLayer :: Encode ShapeLayer where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeShapeLayer :: Decode ShapeLayer where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype ShapeStyle
  = ShapeStyle
  { type :: String
  , id :: String
  , opacity :: Number
  , fills :: Maybe (Array Fill)
  , shadows :: Maybe (Array Shadow)
  , borders :: Maybe (Array Border)
  }

derive instance newtypeShapeStyle :: Newtype ShapeStyle _

derive instance genericShapeStyle :: Generic ShapeStyle _

instance encodeShapeStyle :: Encode ShapeStyle where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeShapeStyle :: Decode ShapeStyle where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Fill
  = Fill
  { fill :: String
  , color :: String
  , gradient :: Gradient
  , enabled :: Boolean
  }

derive instance newtypeFill :: Newtype Fill _

derive instance genericFill :: Generic Fill _

instance encodeFill :: Encode Fill where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeFill :: Decode Fill where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Border
  = Border
  { fillType :: String
  , position :: String
  , color :: String
  , thickness :: Number
  , enabled :: Boolean
  }

derive instance newtypeBorder :: Newtype Border _

derive instance genericBorder :: Generic Border _

instance encodeBorder :: Encode Border where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeBorder :: Decode Border where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Points
  = Points
  { type :: String
  , cornerRadius :: Number
  , curveFrom :: Point
  , curveTo :: Point
  , point :: Point
  , pointType :: String
  }

derive instance newtypePoints :: Newtype Points _

derive instance genericPoints :: Generic Points _

instance encodePoints :: Encode Points where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodePoints :: Decode Points where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Shadow
  = Shadow
  { blur :: Number
  , x :: Number
  , y :: Number
  , spread :: Number
  , color :: String
  , enabled :: Boolean
  }

derive instance newtypeShadow :: Newtype Shadow _

derive instance genericShadow :: Generic Shadow _

instance encodeShadow :: Encode Shadow where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeShadow :: Decode Shadow where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Gradient
  = Gradient
  { gradientType :: String
  , from :: Point
  , to :: Point
  , stops :: Array Stop
  }

derive instance newtypeGradient :: Newtype Gradient _

derive instance genericGradient :: Generic Gradient _

instance encodeGradient :: Encode Gradient where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeGradient :: Decode Gradient where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Stop
  = Stop
  { position :: Int
  , color :: String
  }

derive instance newtypeStop :: Newtype Stop _

derive instance genericStop :: Generic Stop _

instance encodeStop :: Encode Stop where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeStop :: Decode Stop where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Point
  = Point
  { x :: Number
  , y :: Number
  }

derive instance newtypePoint :: Newtype Point _

derive instance genericPoint :: Generic Point _

instance encodePoint :: Encode Point where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodePoint :: Decode Point where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype ExportFormat
  = ExportFormat
  { type :: String
  , fileFormat :: String
  , size :: String
  }

derive instance newtypeExportFormat :: Newtype ExportFormat _

derive instance genericExportFormat :: Generic ExportFormat _

instance encodeExportFormat :: Encode ExportFormat where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeExportFormat :: Decode ExportFormat where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

newtype Background
  = Background
  { enabled :: Boolean
  , includedInExport :: Boolean
  , color :: String
  }

derive instance newtypeBackground :: Newtype Background _

derive instance genericBackground :: Generic Background _

instance encodeBackground :: Encode Background where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

instance decodeBackground :: Decode Background where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })
