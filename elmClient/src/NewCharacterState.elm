module NewCharacterState exposing (update, subscriptions)

import Types exposing (MainModel, Msg, MainMessages)
import Rest exposing (postNewCharacter)

update : MainMessages -> MainModel -> (Types.Model, Cmd Msg)
update action model =
  case action of
    Types.SucessfulPost result ->
      (Types.SelectionModel model, Cmd.none)

    Types.NewCharacterNameChanged newName ->
      let
        character = model.newCharacter
      in
        (Types.SelectionModel { model | newCharacter = {character | name = newName}}, Cmd.none)

    Types.NewCharacterXpChanged xpString ->
      let
        character = model.newCharacter
      in
      (Types.SelectionModel { model |  newCharacter =
         { character | xp = Result.withDefault 0 (String.toInt xpString)}}, Cmd.none)

    Types.CreateNewCharachter ->
      (Types.SelectionModel { model | characterListVisible = True, newCharacterVisible = False},
      postNewCharacter model.newCharacter )

    Types.CharacterSelectionView ->
      (Types.SelectionModel { model | characterListVisible = True, newCharacterVisible = False}, Cmd.none)

    _ ->
      (Types.SelectionModel model, Cmd.none)

subscriptions : MainModel -> Sub Msg
subscriptions model =
  Sub.none
