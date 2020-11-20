open Opium.Std
module User = Oww_domains.Entities.User

module Make (Ports : sig
  module Repository : sig
    open Oww_ports.Repositories
    module User : User
  end
end) =
struct
  let h req =
    let res =
      let open Oww_lib.Option in
      let name = param req "name" in
      let* age = param req "age" |> int_of_string_opt in
      return @@ Ports.Repository.User.create User.Freight.{ name; age }
    in
    match res with
    | None -> Default.h ()
    | Some id -> `Json Ezjsonm.(dict [ "id", string @@ User.Id.inj id ]) |> respond'
  ;;
end
