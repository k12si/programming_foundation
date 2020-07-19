(* 目的: a, b, c の引数を受け取ると、 ax^2 + bx + c = 0 の判別式を返す *)
(* hanbetsushiki: float -> float -> float -> float *)
let hanbetsushiki a b c = b**2. -. 4. *. a *. c

(* テスト *)
let test1 = hanbetsushiki 1. 2. 3. = -8.
let test2 = hanbetsushiki 1. 4. 4. = 0.
let test3 = hanbetsushiki 3. 6. 2. = 12.