module Types exposing (..)

import CommonTypes exposing (Character)
import Http
import Character.Types

type Model = SelectionModel MainModel
        | CharacterModel Character.Types.Model

type alias MainModel =
  { callback : String,
    characters : List Character,
    characterListVisible : Bool,
    newCharacterVisible : Bool,
    newCharacter : Character
  }



type alias Msg
  = MainMessages

type MainMessages =
  NewCharacterView
  | CharacterSelectionView
  | NewCharacterNameChanged String
  | NewCharacterXpChanged String
  | CreateNewCharachter
  | PlayCharacter Character
  | GotCharacters (Result Http.Error (List Character))
  | SucessfulPost (Result Http.Error String)
