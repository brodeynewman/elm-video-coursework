import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  { message : String }

type Msg =
  Message String

model : Model
model =
  Model "Hello this is state"

update : Msg -> Model -> Model
update msg model =
  case msg of
    Message newMessage ->
      { model | message = newMessage }

view : Model -> Html Msg
view model =
  div [] 
    [ input [ placeholder "Type some stuff", onInput Message ] []
    , div [] [ text model.message ]
    ]

main =
  beginnerProgram
  { model = model
  , view = view
  , update = update
  }