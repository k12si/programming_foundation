(* 目的: 鶴の数 x 羽における足の総本数を計算する *)
(* tsuru_no_ashi: int -> int *)
let tsuru_no_ashi x = x * 2

(* テスト *)
let test1 = tsuru_no_ashi 5 = 10
let test2 = tsuru_no_ashi 32 = 64
let test3 = tsuru_no_ashi 12 = 24


(* 目的: 亀の数 x 匹における足の総本数を計算する *)
(* kame_no_ashi: int -> int *)
let kame_no_ashi x = x * 4

(* テスト *)
let test1 = kame_no_ashi 5 = 20
let test2 = kame_no_ashi 32 = 128
let test3 = kame_no_ashi 12 = 48


(* 実行結果 *)
(* # #use "06.ml";;
val tsuru_no_ashi : int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
val kame_no_ashi : int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true *)