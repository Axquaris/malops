module NewCharacterView exposing (root)

import Types exposing (Model, Msg, MainModel)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

root : MainModel -> Html Msg
root model =
  div [] [
    input [ type_ "text", placeholder "Name", onInput Types.NewCharacterNameChanged ] []
    , input [ type_ "text", placeholder "Xp", onInput Types.NewCharacterXpChanged ] []
    , button [ onClick Types.CreateNewCharachter ] [text ( "Create New Character" ) ]
    , button [ onClick Types.CharacterSelectionView] [text ( "Cancle" )]
    ]
