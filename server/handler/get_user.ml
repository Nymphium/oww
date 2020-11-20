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
    let id = param req "id" in
    let res =
      let open Oww_lib.Option in
      let* id = User.Id.prj id in
      return @@ Ports.Repository.User.get id
    in
    match res with
    | Some user -> `Json (User.to_json user) |> respond'
    | None -> Default.h ()
  ;;
end
