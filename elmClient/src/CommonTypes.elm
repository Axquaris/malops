module CommonTypes exposing (..)

import Json.Decode exposing (string, int)
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode

type alias Character =
  {
    id : Int,
    name : String,
    xp : Int,
    class : String,
    alignment : String,
    maxHP : Int,
    currentHP : Int,
    ac : Int,
    movement : Int,
    str : Int,
    dex : Int,
    con : Int,
    int : Int,
    wis : Int,
    cha : Int
  }

characterDecoder : Json.Decode.Decoder Character
characterDecoder =
  decode Character
    |> Json.Decode.Pipeline.required "id" int
    |> Json.Decode.Pipeline.required "name" string
    |> Json.Decode.Pipeline.optional "xp" int 0
    |> Json.Decode.Pipeline.optional "class" string ""
    |> Json.Decode.Pipeline.optional "alignment" string ""
    |> Json.Decode.Pipeline.optional "maxHP" int 1
    |> Json.Decode.Pipeline.optional "currentHP" int 1
    |> Json.Decode.Pipeline.optional "ac" int 0
    |> Json.Decode.Pipeline.optional "movement" int 0
    |> Json.Decode.Pipeline.optional "str" int 0
    |> Json.Decode.Pipeline.optional "dex" int 0
    |> Json.Decode.Pipeline.optional "con" int 0
    |> Json.Decode.Pipeline.optional "int" int 0
    |> Json.Decode.Pipeline.optional "wis" int 0
    |> Json.Decode.Pipeline.optional "cha" int 0

characterEncoder : Character -> Encode.Value
characterEncoder character =
  let attributes =
    [ ( "id", Encode.int character.id )
    , ( "name", Encode.string character.name )
    , ( "xp", Encode.int character.xp )
    , ( "class", Encode.string character.class )
    , ( "alignment", Encode.string character.alignment )
    , ( "maxHP", Encode.int character.maxHP )
    , ( "currentHP", Encode.int character.currentHP )
    , ( "ac", Encode.int character.ac )
    , ( "movement", Encode.int character.movement )
    , ( "str", Encode.int character.str )
    , ( "dex", Encode.int character.dex )
    , ( "con", Encode.int character.con )
    , ( "int", Encode.int character.int )
    , ( "wis", Encode.int character.wis )
    , ( "cha", Encode.int character.cha ) ]
  in
    Encode.object attributes
