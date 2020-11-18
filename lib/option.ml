include (
  struct
    module Option = Stdlib.Option

    type 'a t = 'a Option.t

    let ( let* ) m f = Option.bind m f
    let return v = Option.some v
  end :
    Monadic_syn.Arity1 with type 'a t = 'a Stdlib.Option.t)

let alternate = function
  | Some _ as v -> fun _ -> v
  | None -> return
;;
