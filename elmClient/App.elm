import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Random
import Result
import List
import Http
import Task exposing (..)
import Json.Decode exposing (string, int)
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
  { character : Character,
    callback : String,
    characters : List Character
  }

type alias Character =
  { characterName : String,
    xp: Int
  }

init : (Model, Cmd Msg)
init =
  (Model (Character "" 0) "None" [], sendGet)

type Msg
  = ChracterName String
    | Send
    | SendSucessful (Result Http.Error (List Character))
    | GetSucessful (Result Http.Error (List Character))

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Send ->
      (model, sendNamePost model)

    ChracterName name ->
      ( { model | character = (Character name 0)} , Cmd.none)

    SendSucessful result ->
      case result of
        Ok data ->
          ({model | characters = data}, Cmd.none)
        Err data ->
          (model, Cmd.none)

    GetSucessful result ->
      case result of
        Ok data ->
          ({model | characters =  data }, Cmd.none)
        Err data ->
          ({model | callback = (toString data)}, Cmd.none)

sendNamePost : Model -> Cmd Msg
sendNamePost model =
    (Http.send SendSucessful (getPost model))

getPost : Model -> Http.Request (List Character)
getPost model =
  (Http.post "http://localhost:5000/newadventurer" (Http.stringBody "application/json" ("""{ "characterName" : """ ++ "\"" ++ model.character.characterName ++ "\"" ++ """, "xp" : 0 }""" )) getCharacterListDecoder)

sendGet : Cmd Msg
sendGet =
  (Http.send GetSucessful (getGet))

getGet : Http.Request (List Character)
getGet =
  (Http.get "http://localhost:5000/chracters" getCharacterListDecoder)

getCharacterListDecoder : Json.Decode.Decoder (List Character)
getCharacterListDecoder =
  (Json.Decode.list getCharacterDecoder)

getCharacterDecoder : Json.Decode.Decoder Character
getCharacterDecoder =
  decode Character
    |> Json.Decode.Pipeline.required "characterName" string
    |> Json.Decode.Pipeline.required "xp" int


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
  div [] [
    input [ type_ "text", placeholder "Name", onInput ChracterName ] []
    , button [ onClick Send ] [text ( "Create New Character" ) ]
    , div [] [text ( model.character.characterName )]
    , div [] (List.map generateCharacterDiv model.characters)
    ]

generateCharacterDiv : Character -> Html Msg
generateCharacterDiv character =
  div [] [
    h2 [] [text ( character.characterName )]
    , div [] [text ("XP: " ++ (toString character.xp))]
  ]
