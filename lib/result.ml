include (
  struct
    module R = Stdlib.Result

    type ('a, 'b) t = ('a, 'b) R.t

    let ( let* ) m f = R.bind m f
    let return v = R.ok v
  end :
    Monadic_syn.Arity2 with type ('a, 'b) t = ('a, 'b) Stdlib.Result.t)
