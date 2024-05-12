module TextStyle exposing (body, companyName, header, headline, lead)

import Element.Font as Font
import Typography exposing (TextStyle)


headline : TextStyle msg
headline =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 48
        , fontWeight = Font.semiBold
        , lineHeightPx = 48
        , letterSpacingPercent = 0
        }


header : TextStyle msg
header =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 36
        , fontWeight = Font.semiBold
        , lineHeightPx = 36
        , letterSpacingPercent = 0
        }


lead : TextStyle msg
lead =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 20
        , fontWeight = Font.semiBold
        , lineHeightPx = 20
        , letterSpacingPercent = 0
        }


companyName : TextStyle msg
companyName =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 20
        , fontWeight = Font.medium
        , lineHeightPx = 20
        , letterSpacingPercent = 0
        }


body : TextStyle msg
body =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 18
        , fontWeight = Font.regular
        , lineHeightPx = 18
        , letterSpacingPercent = 0
        }
