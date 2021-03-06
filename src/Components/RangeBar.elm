module Components.RangeBar exposing (rangeBar)

import Color
import Components.Fab exposing (fab)
import Components.Typography as Typography
import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (style, type_)
import Html.Events exposing (onClick, onInput)
import Material.Icons as Filled
import Material.Icons.Types exposing (Coloring(..))
import Model exposing (Model)
import Styles exposing (horiSpacing)
import Types exposing (AnimationState(..), Msg(..))


startStopButton : Model -> Html Msg
startStopButton model =
    case model.state of
        Running ->
            fab model.palette 36 [ onClick StopAnimation ] Filled.stop

        Stopped ->
            fab model.palette 36 [ onClick StartAnimation ] Filled.play_arrow


rangeBar : Model -> Html Msg
rangeBar model =
    div
        [ style "display" "flex"
        , style "position" "absolute"
        , style "bottom" "0"
        , style "left" "50%"
        , style "background" (Color.toCssString model.palette.backgroundCard)
        , style "color" "#eee"
        , style "transform" "translateX(-50%)"
        , style "box-sizing" "border-box"
        , style "padding" "24px 48px 24px 48px"
        , style "border-top-left-radius" "20px"
        , style "border-top-right-radius" "20px"
        , style "box-shadow" "0 0 24px rgba(0, 0, 0, 0.15)"
        , style "align-items" "center"
        ]
        [ label [] [ Typography.label model.palette "Animation speed" ]
        , input
            [ type_ "range"
            , Html.Attributes.min "0"
            , Html.Attributes.max "100"
            , onInput ChangeAnimationSpeed
            ]
            []
        , horiSpacing 48
        , startStopButton model
        ]
