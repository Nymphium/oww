open Opium.Std

let h _req =
  let open Lwt.Infix in
  (* [create_stream] returns a push function that can be used to
         push new content onto the stream. [f] is function that
         expects to receive a promise that gets resolved when the user
         decides that they have pushed all their content onto the stream.
         When the promise forwarded to [f] gets resolved, the stream will be
         closed. *)
  let f, push = App.create_stream () in
  let timers =
    List.map
      (fun t ->
        Lwt_unix.sleep t >|= fun () -> push (Printf.sprintf "Hello after %f seconds\n" t))
      [ 1.; 2.; 3. ]
  in
  f (Lwt.join timers)
;;
