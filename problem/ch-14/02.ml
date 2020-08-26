(* 学生の構造体 *)
type gakusei_t = {
    name    : string;
    tensuu  : int;
    seiseki : string;
}

(* 目的: 学生の成績が　「A」 か判定する *)
(* is_seiseki_A: gakusei_t -> bool *)
let is_seiseki_A gakusei = gakusei.seiseki = "A"

(* 目的: gakusei_t 型のリストから、成績が 「A」 の学生の人数を返す *)
(* count_A: gakusei_t lst -> int *)
let count_A gakusei_lst = List.length (List.filter is_seiseki_A gakusei_lst)


(* --- sample --- *)
let gakusei_lst = [
    {name = "hoge"; tensuu = 80; seiseki = "A"};
    {name = "hoge"; tensuu = 60; seiseki = "B"};
    {name = "hoge"; tensuu = 40; seiseki = "C"};
    {name = "hoge"; tensuu = 100; seiseki = "A"};
    {name = "hoge"; tensuu = 90; seiseki = "A"};
]

(* --- test --- *)
let test1 = count_A gakusei_lst = 3
let test2 = count_A [] = 0