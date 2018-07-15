import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  { currentMessage : String
  , count : Int }

type Msg =
  Message String
  | IncrementCount

model : Model
model =
  Model "" 0

update : Msg -> Model -> Model
update msg model =
  case msg of
    Message newMessage ->
      { model | currentMessage = newMessage }

    IncrementCount ->
      { model | count = model.count + 1 }

view : Model -> Html Msg
view model =
  div [ class "hello-there" ]
    [ input [ placeholder "Type some stuff..", onInput Message ] []
    , span [] [ text model.currentMessage ]
    , div [] 
      [ button [ onClick IncrementCount ] [ text "Increment" ]
      , span [] [ text (toString model.count) ] ]
    ]

main =
  beginnerProgram
  { model = model
  , update = update
  , view = view
  }