module TextStyle exposing (body)

import Element.Font as Font
import Typography exposing (TextStyle)


body : TextStyle msg
body =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 16
        , fontWeight = Font.regular
        , lineHeightPx = 16
        , letterSpacingPercent = 0
        }
