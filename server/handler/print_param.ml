open Opium.Std

let h req = `String ("Hello " ^ param req "name") |> respond'
