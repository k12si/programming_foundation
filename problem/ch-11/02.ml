(* 目的: 漸化式 {a(0) = 3, a(n) = 2a(n-1) - 1} の任意の項数を計算する *)
(* zenkashiki: int -> int *)
let rec zenkashiki num =
    if num = 0 then 3
               else 2 * zenkashiki (num - 1) - 1 (* zenkashiki (num -1) *)


(* ------ テスト ------ *)
let test1 = zenkashiki 0 = 3
let test2 = zenkashiki 1 = 5
let test3 = zenkashiki 2 = 9
let test4 = zenkashiki 3 = 17
