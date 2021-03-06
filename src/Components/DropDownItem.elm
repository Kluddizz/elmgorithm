module Components.DropDownItem exposing (dropDownItem)

import Color
import Html exposing (Html, text)
import Html.Attributes exposing (style, value)
import Palette exposing (Palette)
import Types exposing (Msg)


dropDownItem : Palette -> String -> String -> Html Msg
dropDownItem p val str =
    Html.option
        [ value val
        , style "background" (Color.toCssString p.primary)
        ]
        [ text str
        ]
