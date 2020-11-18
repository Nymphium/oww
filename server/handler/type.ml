open Opium.Std

module type S = sig
  val h : Request.t -> Response.t Lwt.t
end
