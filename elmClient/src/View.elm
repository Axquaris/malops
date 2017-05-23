module View exposing (root)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Types exposing (Msg, Model, MainMessages, MainModel)
import CommonTypes exposing (Character)
import NewCharacterView
import Character.View

root : Model -> Html Msg
root variableModel =
  case variableModel of
    Types.SelectionModel model ->
      if model.characterListVisible then
        ( generateCharacterList model)
      else if model.newCharacterVisible then
        ( NewCharacterView.root model)
      else
        ( div [] [ text "No Display Error"])

    Types.CharacterModel model ->
      (Character.View.root model)

generateCharacterList : MainModel -> Html Msg
generateCharacterList model =
    div [] [
      button [ onClick (Types.MainMsg Types.NewCharacterView) ] [ text "Create New Character" ]
      ,div [] (List.map generateCharacterDiv model.characters)
      ]


generateCharacterDiv : Character -> Html Msg
generateCharacterDiv character =
  div [] [
    h2 [] [text ( character.name )]
    , div [] [text ("XP: " ++ (toString character.xp))]
    , button [ onClick (Types.MainMsg (Types.PlayCharacter character))] [text "Play"]
  ]
