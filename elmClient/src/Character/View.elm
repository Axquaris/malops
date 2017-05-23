module Character.View exposing (root)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Types exposing (Msg)

import CommonTypes exposing (Character)
import Character.Types exposing (Model, CharacterMsg)

root : Model -> Html Msg
root model =
  div [] [
    h1 [] [ text model.character.name ]
    ,h2 [] [ text ( "Level " ++ (toString (calculateLevel model.character.xp)) ++ " " ++ model.character.class )]
    ,h4 [] [ text ( model.character.alignment)]
    ,div [] [
      text (toString model.character.currentHP ++ "/" ++ (toString model.character.maxHP)
      ++ "HP, AC: " ++ (toString model.character.ac) )
    ]
    ,div [ style [ ("position", "absolute")
    , ("top", "0")
    , ("bottom", "0")
    , ("right", "0")
    , ("width", "100px")]] (fillModifiers model.character)
  ]

fillModifiers : Character -> List (Html Msg)
fillModifiers character =
  [(modifierDisplay "Strength" character.str Character.Types.IncreaseStr
    Character.Types.DecreaseStr)
  ,(modifierDisplay "Dexterity" character.dex Character.Types.IncreaseDex
    Character.Types.DecreaseDex)
  ,(modifierDisplay "Constitution" character.con Character.Types.IncreaseCon
    Character.Types.DecreaseCon)
  ,(modifierDisplay "Intelligence" character.int Character.Types.IncreaseInt
    Character.Types.DecreaseInt)
  ,(modifierDisplay "Wisdom" character.wis Character.Types.IncreaseWis
    Character.Types.DecreaseWis)
  ,(modifierDisplay "Charisma" character.cha Character.Types.IncreaseCha
    Character.Types.DecreaseCha)]

modifierDisplay : String -> Int -> CharacterMsg -> CharacterMsg -> Html Msg
modifierDisplay name ability increase decrease =
  div [
    style [ ("width", "100px")
    , ("border", "solid 1px black")
    , ("padding-top", "0.4em")
    , ("padding-bottom", "0.7em") ]
  ] [
    div [style [ ("width", "100px")
    , ("text-align", "center")
    , ("font-size", "1em") ]] [ text name ]
    , div [style [ ("width", "100px")
    , ("text-align", "center")
    , ("font-size", "2em") ]] [ text (calculateModifierFromAbility ability)]
    , div [style [ ("width", "100px")
    , ("text-align", "center")
    , ("font-size", "0.6em") ]] [
    button [onClick (Types.CharacterMsg decrease)
    , style [ ("float", "left")
    , ("padding", "0")
    , ("padding-left", "2px")
    , ("padding-right", "2px")
    , ("margin-left", "0.6em")
    , ("font-size", "0.8em")]] [text "-"]
    , text (toString ability)
    , button [onClick (Types.CharacterMsg increase)
    , style [ ("float", "right")
    , ("padding", "0")
    , ("padding-left", "2px")
    , ("padding-right", "2px")
    , ("margin-right", "0.6em")
    , ("font-size", "0.8em")]] [text "+"]]
  ]

calculateModifierFromAbility : Int -> String
calculateModifierFromAbility ability =
  toString ( round ((toFloat ability) / 2 - 5))

calculateLevel : Int -> Int
calculateLevel xp =
  if xp < 300 then
    1
  else if xp < 900 then
    2
  else if xp < 2700 then
    3
  else if xp < 6500 then
    4
  else if xp < 14000 then
    5
  else if xp < 23000 then
    6
  else if xp < 34000 then
    7
  else if xp < 48000 then
    8
  else if xp < 64000 then
    9
  else if xp < 85000 then
    10
  else if xp < 100000 then
    11
  else if xp < 120000 then
    12
  else if xp < 140000 then
    13
  else if xp < 165000 then
    14
  else if xp < 195000 then
    15
  else if xp < 225000 then
    16
  else if xp < 265000 then
    17
  else if xp < 305000 then
    18
  else if xp < 355000 then
    19
  else
    20
