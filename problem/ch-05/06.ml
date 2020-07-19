(* 目的: a, b, c の引数を受け取ると、 ax^2 + bx + c = 0 の判別式を返す *)
(* hanbetsushiki: float -> float -> float -> float *)
let hanbetsushiki a b c = b**2. -. 4. *. a *. c

(* 目的: a, b, c の引数を受け取ると、 ax^2 + bx + c = 0 が虚数解を持つかどうかを返す *)
(* kyosuukai: float -> float -> float -> bool *)
let kyosuukai a b c = if hanbetsushiki a b c < 0. then true
                                                  else false

(* テスト *)
let test1 = kyosuukai 1. 2. 3. = true
let test2 = kyosuukai 1. 4. 4. = false
let test3 = kyosuukai 3. 6. 2. = false