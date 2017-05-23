module Character.State exposing (update)

import Types
import Character.Types
import Rest

update : Types.Msg -> Character.Types.Model -> (Character.Types.Model, Cmd Types.Msg)
update variableMsg model =
  case variableMsg of
    Types.CharacterMsg msg ->
        case msg of
          Character.Types.IncreaseStr ->
            let
              character = model.character
              modCharacter = {character | str = character.str + 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.IncreaseDex ->
            let
              character = model.character
              modCharacter = {character | dex = character.dex + 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.IncreaseCon ->
            let
              character = model.character
              modCharacter = {character | con = character.con + 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.IncreaseInt ->
            let
              character = model.character
              modCharacter = {character | int = character.int + 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.IncreaseWis ->
            let
              character = model.character
              modCharacter = {character | wis = character.wis + 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.IncreaseCha ->
            let
              character = model.character
              modCharacter = {character | cha = character.cha + 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.DecreaseStr ->
            let
              character = model.character
              modCharacter = {character | str = character.str - 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.DecreaseDex ->
            let
              character = model.character
              modCharacter = {character | dex = character.dex - 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.DecreaseCon ->
            let
              character = model.character
              modCharacter = {character | con = character.con - 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.DecreaseInt ->
            let
              character = model.character
              modCharacter = {character | int = character.int - 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.DecreaseWis ->
            let
              character = model.character
              modCharacter = {character | wis = character.wis - 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)
          Character.Types.DecreaseCha ->
            let
              character = model.character
              modCharacter = {character | cha = character.cha - 1}
            in
              ({ model | character = modCharacter},
              Rest.postExistingCharacter modCharacter)

    _ ->
      (model, Cmd.none)
