(* 目的: 関数を受け取り、その関数を2回適用する関数を返す *)
(* twice: ('a -> 'a) -> 'a -> 'a *)
let twice f =
    let g x = f (f x) in g

(* --- test --- *)
let fourth = twice twice

(* --- output ---
# #use "05.ml";;
val twice : ('a -> 'a) -> 'a -> 'a = <fun>
val fourth : ('_weak1 -> '_weak1) -> '_weak1 -> '_weak1 = <fun> *)