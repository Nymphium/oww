open Opium.Std
module User = Oww_domains.Entities.User

module Make (Ports : sig
  module UserRepository : Oww_ports.UserRepository
end) =
struct
  let h req =
    let res =
      let open Oww_lib.Option in
      let name = param req "name" in
      let* age = param req "age" |> int_of_string_opt in
      return @@ Ports.UserRepository.create User.Freight.{ name; age }
    in
    match res with
    | None -> Default.h ()
    | Some id -> `Json Ezjsonm.(dict [ "id", string @@ User.Id.inj id ]) |> respond'
  ;;
end
