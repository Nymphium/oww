open Oww_lib.Fun

module Name : Field.M with type bwd = string = struct
  type t = string
  type bwd = t

  let prj = Field.validate (String.length @> ( > ) 50)
  let inj = Fun.id
end

module Age : Field.M with type bwd = int = struct
  type t = int
  type bwd = t

  let prj = Field.validate @@ ( > ) 200
  let inj = Fun.id
end

module Id : Field.M with type bwd = string = struct
  type t = string
  type bwd = t

  let prj = Option.some
  let inj = Fun.id
end

type t =
  { id : Id.t
  ; name : Name.t
  ; age : Age.t
  }

module Body = struct
  type t =
    { name : Name.t
    ; age : Age.t
    }
end

module Freight = struct
  type t =
    { name : string
    ; age : int
    }
end

let to_freight ({ name; age; _ } : t) =
  let name = Name.inj name in
  let age = Age.inj age in
  Freight.{ name; age }
;;

let to_json ({ name; age; id } : t) =
  let open Ezjsonm in
  let id = Id.inj id in
  let name = Name.inj name in
  let age = Age.inj age in
  dict [ "id", string id; "name", string name; "age", int age ]
;;

let entity_value_of_freight ({ name; age } : Freight.t) : Body.t option =
  let open Oww_lib.Option in
  let* name = Name.prj name in
  let* age = Age.prj age in
  return Body.{ name; age }
;;
