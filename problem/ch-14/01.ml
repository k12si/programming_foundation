(* 目的: 2 で割り切れるか調べる *)
(* is_mod2_0: int -> bool *)
let is_mod2_0 n = n mod 2 = 0

(* 目的: int型配列を受け取り、偶数の要素を抽出した配列を返す *)
(* even: int lst -> int lst *)
let rec even lst = List.filter is_mod2_0 lst  

(* --- test --- *)
let test1 = even [1; 3; 4; 5; 8] = [4; 8]
let test2 = even [] = []
let test3 = even [0; 8; -1] = [0; 8]