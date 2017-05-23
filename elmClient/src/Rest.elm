module Rest exposing (postNewCharacter, getCharacters, postExistingCharacter)

import Http
import Types exposing (Msg, MainMessages)
import CommonTypes exposing (Character)
import Json.Decode

postNewCharacter : Character -> Cmd Msg
postNewCharacter character =
  (Http.send (\r -> (Types.MainMsg (Types.SucessfulPost r)))
   (Http.post "http://localhost:5000/characters"
   (getCharacterJson character)
    Json.Decode.string))

postExistingCharacter : Character -> Cmd Msg
postExistingCharacter character =
  (Http.send (\r -> (Types.MainMsg (Types.SucessfulPost r)))
   (Http.post ("http://localhost:5000/characters/" ++ (toString character.id))
   (getCharacterJson character)
    Json.Decode.string))

getCharacterJson : Character -> Http.Body
getCharacterJson character =
  Http.jsonBody (CommonTypes.characterEncoder character)

getCharacters : Cmd Msg
getCharacters =
  (Http.send (\r -> (Types.MainMsg (Types.GotCharacters r))) (getCharactersGet))

getCharactersGet : Http.Request (List Character)
getCharactersGet =
  (Http.get "http://localhost:5000/characters" getCharacterListDecoder)

getCharacterListDecoder : Json.Decode.Decoder (List Character)
getCharacterListDecoder =
  (Json.Decode.list CommonTypes.characterDecoder)
