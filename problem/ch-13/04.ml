(* 目的: 関数を 2 つ受け取り、そのふたつの関数を合成した関数を返す *)
(* compose: ('a -> 'b) -> ('c -> 'a) -> ('c -> 'b) *)
let compose f f' =
    let g x = f (f' x) in g

let time2 x = x * 2

let add3 x = x + 3


(* --- test --- *)
let test1 = (compose time2 add3) 4 = 14