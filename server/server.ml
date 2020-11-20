open Opium.Std

(* open Handler *)

let main () = App.empty |> Routing.routing |> App.run_command
