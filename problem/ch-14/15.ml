(* 目的: n から 1 までのリストを作る *)
(* enumerate: int -> int list *)
let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

(* 目的: 「 1 ~ 受け取った自然数 」 までの合計を求める *)
(* one_to_n: int -> int *)
let one_to_n n = List.fold_right (+) (enumerate n) 0

(* --- test --- *)
let test1 = one_to_n 1 = 1
let test2 = one_to_n 3 = 6
let test3 = one_to_n 10 = 55