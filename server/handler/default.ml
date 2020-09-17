open Opium.Std

let h _req = `Json Ezjsonm.(dict [ "message", string "Route not found" ]) |> respond'
