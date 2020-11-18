open Opium.Std
module User = Entities.User

module Make (Ports : sig
  module UserRepository : Oww_ports.UserRepository
end) =
struct
  let h req =
    let id = param req "id" in
    let res =
      let open Oww_lib.Option in
      let* id = User.Id.prj id in
      return @@ Ports.UserRepository.get id
    in
    match res with
    | Some user -> `Json (User.to_json user) |> respond'
    | None -> Default.h ()
  ;;
end
