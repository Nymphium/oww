open Opium.Std
open Handler

let ( <~~ ) route m = m route
let ( @| ) methd handler route = methd route handler

let ( @|! ) methd handler_m route =
  let module M = (val handler_m : Handler.Type.S) in
  methd route M.h
;;

module Ports = struct
  module Repository = struct
    open Oww_adapters.In_memory.Repositories
    module User = User.Make ()
  end
end

let routing prv =
  prv
  |> ("/hello/:name" <~~ put @| Print_param.h)
  |> ("/hello/stream" <~~ get @| Streaming.h)
  |> ("/user/create/:name/:age"
     <~~ get @|! (module Create_user.Make (Ports) : Handler.Type.S))
  |> ("/users/me/:id" <~~ get @|! (module Get_user.Make (Ports) : Handler.Type.S))
;;
