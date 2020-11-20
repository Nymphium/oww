open Opium.Std

(* open Handler *)

module Ports = struct
  module UserRepository = Oww_adapters.In_memory.Repositories.User.Make ()
end

let main () = App.empty |> Routing.routing |> App.run_command
