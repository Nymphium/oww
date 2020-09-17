open Opium.Std
open Handler

let ( <~~ ) route m = m route
let ( @| ) methd handler route = methd route handler

let main () =
  App.empty
  |> ("/hello/:name" <~~ put @| Print_param.h)
  |> ("/hello/stream" <~~ get @| Streaming.h)
  |> ("/person/:name/:age" <~~ get @| Print_person.h)
  |> not_found Default.h
  |> App.run_command
;;
