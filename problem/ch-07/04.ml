(* 目的: 2 点の座標平面の中点を返す *)
(* chuten: float * float -> float * float -> float * float *)
let chuten point1 point2 = match point1 with
    (x1, y1) -> match point2 with 
    (x2, y2) -> (((x1 +. x2) /. 2.), ((y1 +. y2) /. 2.))

(* テスト *)
let test1 = chuten (8., 1.) (7., 5.) = (7.5, 3.)
let test2 = chuten (8., -1.) (-7., 5.) = (0.5, 2.)