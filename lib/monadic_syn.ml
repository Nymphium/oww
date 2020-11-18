module type Arity1 = sig
  type 'a t

  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t
  val return : 'a -> 'a t
end

module type Arity2 = sig
  type ('a, 'b) t

  val ( let* ) : ('a, 'b) t -> ('a -> ('c, 'b) t) -> ('c, 'b) t
  val return : 'a -> ('a, 'b) t
end

module type Arity3 = sig
  type ('a, 'b, 'c) t

  val ( let* ) : ('a, 'b, 'c) t -> ('a -> ('d, 'b, 'c) t) -> ('d, 'b, 'c) t
  val return : 'a -> ('a, 'b, 'c) t
end
