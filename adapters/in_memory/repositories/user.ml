open struct
  module User = Oww_domains.Entities.User
end

module Make () : Oww_ports.Repositories.User = struct
  module M = Map.Make (struct
    type t = User.Id.t

    let compare id1 id2 =
      let id1 = User.(Id.inj id1) in
      let id2 = User.(Id.inj id2) in
      String.compare id1 id2
    ;;
  end)

  let map = ref M.empty
  let get id = M.find id !map

  let create freight =
    let uuid = Ulid.ulid () in
    let conv =
      let open Oww_lib.Option in
      let* User.Body.{ name; age } = User.entity_value_of_freight freight in
      let* id = User.Id.prj uuid in
      return User.{ age; name; id }
    in
    match conv with
    | Some (User.{ id; _ } as entity) ->
      let map' = M.add id entity !map in
      let () = map := map' in
      id
    | None -> failwith "failed to create"
  ;;

  let update ~age ~name id =
    let map' =
      M.update
        id
        (function
          | Some User.{ name = name'; age = age'; _ } ->
            let open Oww_lib.Option in
            let* name = alternate name name' in
            let* age = alternate age age' in
            return User.{ name; age; id }
          | None -> None)
        !map
    in
    map := map'
  ;;
end
