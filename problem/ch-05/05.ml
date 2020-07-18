(* 目的: a, b, c の引数を受け取ると、 ax^2 + bx + c = 0 の判別式を返す *)
(* hanbetsushiki: float -> float -> float -> float *)
let hanbetsushiki a b c = b**2. -. 4. *. a *. c

(* 目的: a, b, c の引数を受け取ると、 ax^2 + bx + c = 0 の解の個数を返す *)
(* kai_no_kosuu: float -> float -> float -> int *)
let kai_no_kosuu a b c = if hanbetsushiki a b c < 0. then 0
                                                    else if hanbetsushiki a b c = 0. then 1
                                                                                     else 2

(* テスト *)
let test1 = kai_no_kosuu 1. 2. 3. = 0
let test2 = kai_no_kosuu 1. 4. 4. = 1
let test3 = kai_no_kosuu 3. 6. 2. = 2