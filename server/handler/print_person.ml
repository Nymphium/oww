open Opium.Std
module Person = Oww_domains.Entities.Person

let h req =
  let person =
    Person.{ name = param req "name"; age = "age" |> param req |> int_of_string }
  in
  `Json (person |> Person.json_of_person) |> respond'
;;
