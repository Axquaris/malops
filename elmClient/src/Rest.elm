module Rest exposing (postNewCharacter, getCharacters)

import Http
import Types exposing (Msg)
import CommonTypes exposing (Character)
import Json.Decode

postNewCharacter : Character -> Cmd Msg
postNewCharacter character =
  (Http.send Types.SucessfulPost (Http.post "http://localhost:5000/characters"
   (getCharacterJson character)
    Json.Decode.string))

getCharacterJson : Character -> Http.Body
getCharacterJson character =
  Http.jsonBody (CommonTypes.characterEncoder character)

getCharacters : Cmd Msg
getCharacters =
  (Http.send Types.GotCharacters (getCharactersGet))

getCharactersGet : Http.Request (List Character)
getCharactersGet =
  (Http.get "http://localhost:5000/characters" getCharacterListDecoder)

getCharacterListDecoder : Json.Decode.Decoder (List Character)
getCharacterListDecoder =
  (Json.Decode.list CommonTypes.characterDecoder)
