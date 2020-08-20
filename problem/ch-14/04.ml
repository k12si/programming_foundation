(* 学生の構造体 *)
type gakusei_t = {
    name    : string;
    tensuu  : int;
    seiseki : string;
}

(* 目的: first(gakusei_t) と rest_result の得点の和を求める *)
(* add_tensuu: gakusei_t -> int *)
let add_tensuu first rest_result = first.tensuu + rest_result

(* 目的: gakusei_t 型のリストを受け取り、全員の得点の合計を返す *)
(* gakusei_sum: gakusei_t list -> int *)
let gakusei_sum gakusei_lst = List.fold_right add_tensuu gakusei_lst 0

(* --- sample --- *)
let gakusei_lst = [
    {name = "hoge"; tensuu = 80; seiseki = "A"};
    {name = "hoge"; tensuu = 60; seiseki = "B"};
    {name = "hoge"; tensuu = 40; seiseki = "C"};
    {name = "hoge"; tensuu = 100; seiseki = "A"};
    {name = "hoge"; tensuu = 90; seiseki = "A"};
]

(* --- test --- *)
let test1 = gakusei_sum gakusei_lst = 370
let test2 = gakusei_sum [] = 0