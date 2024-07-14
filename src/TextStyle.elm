module TextStyle exposing (body, header, header2, headline, lead, lead2)

import Element.Font as Font
import Element.Region as Region
import Typography exposing (TextStyle)


headline : TextStyle msg
headline =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 48
        , fontWeight = Font.semiBold
        , lineHeightPx = 48
        , letterSpacingPercent = 0
        , region = Just <| Region.heading 1
        }


header : TextStyle msg
header =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 36
        , fontWeight = Font.semiBold
        , lineHeightPx = 36
        , letterSpacingPercent = 0
        , region = Just <| Region.heading 2
        }


header2 : TextStyle msg
header2 =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 20
        , fontWeight = Font.semiBold
        , lineHeightPx = 20
        , letterSpacingPercent = 0
        , region = Just <| Region.heading 3
        }


lead : TextStyle msg
lead =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 20
        , fontWeight = Font.medium
        , lineHeightPx = 20
        , letterSpacingPercent = 0
        , region = Nothing
        }


lead2 : TextStyle msg
lead2 =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 32
        , fontWeight = Font.light
        , lineHeightPx = 50
        , letterSpacingPercent = 0
        , region = Nothing
        }


body : TextStyle msg
body =
    Typography.textStyleFromFigma
        { fontFamily = [ Font.typeface "Source Sans Pro", Font.sansSerif ]
        , fontSizePx = 18
        , fontWeight = Font.regular
        , lineHeightPx = 18
        , letterSpacingPercent = 0
        , region = Nothing
        }
