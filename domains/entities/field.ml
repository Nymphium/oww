module type M = sig
  type t
  type bwd

  val prj : bwd -> t Option.t
  val inj : t -> bwd
end

let validate : ('a -> bool) -> 'a -> 'b Option.t = fun p v -> if p v then Some v else None
