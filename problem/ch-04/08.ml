(* 目的: 鶴と亀の総数 x と、足の総本数 y を与えると、鶴の数を返す *)
(* tsurukame: int -> int -> int *)
let tsurukame x y = x - (y - 2 * x) / 2

(* テスト *)
let test1 = tsurukame 5 16 = 2
let test2 = tsurukame 16 50 = 7
let test3 = tsurukame 5 14 = 3

(* 実行結果 *)
(* # #use "08.ml";;
val tsurukame : int -> int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true *)