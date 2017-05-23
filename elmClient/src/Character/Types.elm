module Character.Types exposing (..)

import CommonTypes exposing (Character)

type alias Model = {
  character : Character
}

type CharacterMsg = IncreaseStr
  | IncreaseDex
  | IncreaseCon
  | IncreaseInt
  | IncreaseWis
  | IncreaseCha
  | DecreaseStr
  | DecreaseDex
  | DecreaseCon
  | DecreaseInt
  | DecreaseWis
  | DecreaseCha
