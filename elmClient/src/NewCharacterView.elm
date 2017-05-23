module NewCharacterView exposing (root)

import Types exposing (Msg, Model, MainMessages, MainModel)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

root : MainModel -> Html Msg
root model =
  div [] [
    input [ type_ "text", placeholder "Name", onInput (\s -> (Types.MainMsg (Types.NewCharacterNameChanged s))) ] []
    , input [ type_ "text", placeholder "Xp", onInput (\s -> (Types.MainMsg (Types.NewCharacterXpChanged s))) ] []
    , button [ onClick (Types.MainMsg Types.CreateNewCharachter) ] [text ( "Create New Character" ) ]
    , button [ onClick (Types.MainMsg Types.CharacterSelectionView) ] [text ( "Cancle" )]
    ]
