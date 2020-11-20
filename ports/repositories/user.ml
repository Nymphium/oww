open struct
  module User = Oww_domains.Entities.User
end

module type S = sig
  val create : User.Freight.t -> User.Id.t
  val get : User.Id.t -> User.t
  val update : age:User.Age.t Option.t -> name:User.Name.t Option.t -> User.Id.t -> unit
end
