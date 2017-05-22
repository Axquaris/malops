module State exposing (init, update, subscriptions)

import Http
import Json.Decode

import Types exposing (Model, MainModel, Msg)
import CommonTypes exposing (Character)
import Character.Types

import NewCharacterState

import Rest exposing (getCharacters)

init : (Model, Cmd Msg)
init =
  (Types.SelectionModel (MainModel "None" [] True False (Character 0 "" 0 "" "" 0 0 0 0 0 0 0 0 0 0)), getCharacters)

update : Msg -> Model -> (Model, Cmd Msg)
update msg variablemodel =
  case variablemodel of
    Types.SelectionModel model ->
      if model.newCharacterVisible then
        (NewCharacterState.update msg model)
      else
        case msg of
          Types.GotCharacters characters ->
            case characters of
              Ok data ->
                (Types.SelectionModel {model | characters =  data }, Cmd.none)
              Err data ->
                (Types.SelectionModel {model | callback = (toString data)}, Cmd.none)

          Types.NewCharacterView ->
            (Types.SelectionModel { model | characterListVisible = False, newCharacterVisible = True}, Cmd.none)

          Types.SucessfulPost string ->
            (Types.SelectionModel model, getCharacters)

          Types.PlayCharacter character ->
            (Types.CharacterModel (Character.Types.Model character), Cmd.none)
          _ ->
            (Types.SelectionModel model, Cmd.none)
    _ ->
      (variablemodel, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
