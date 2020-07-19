(* 目的: 平面座標の x 軸対象を返す *)
(* taisho_x: int * int -> int * int *)
let taisho_x pair = match pair with
    (x, y) -> (- x, y)

(* テスト *)
let test1 = taisho_x (3, 9) = (-3, 9)
let test2 = taisho_x (-8, 3) = (8, 3)