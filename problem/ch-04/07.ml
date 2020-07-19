(* 目的: 鶴の数 x 羽における足の総本数を計算する *)
(* tsuru_no_ashi: int -> int *)
let tsuru_no_ashi x = x * 2

(* 目的: 亀の数 x 匹における足の総本数を計算する *)
(* kame_no_ashi: int -> int *)
let kame_no_ashi x = x * 4

(* 目的: 鶴の数 x 羽と、亀の数 y 匹における足の総本数を計算する *)
(* tsurukame_no_ashi: int -> int -> int *)
let tsurukame_no_ashi x y = tsuru_no_ashi x + kame_no_ashi y

(* テスト *)
let test1 = tsurukame_no_ashi 2 3 = 16
let test2 = tsurukame_no_ashi 7 9 = 50
let test3 = tsurukame_no_ashi 3 2 = 14

(* 実行結果 *)
(* # #use "07.ml";;
val tsuru_no_ashi : int -> int = <fun>
val kame_no_ashi : int -> int = <fun>
val tsurukame_no_ashi : int -> int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true *)