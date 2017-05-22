import View exposing (root)
import State exposing (init,update,subscriptions)
import Html

main =
  Html.program
    { init = init
    , view = root
    , update = update
    , subscriptions = subscriptions
    }
