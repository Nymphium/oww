(* 実は全く entity じゃないよ *)

type person =
  { name : string
  ; age : int
  }

let json_of_person { name; age } =
  let open Ezjsonm in
  dict [ "name", string name; "age", int age ]
;;
