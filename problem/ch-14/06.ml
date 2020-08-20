(* 学生の構造体 *)
type gakusei_t = {
    name    : string;
    tensuu  : int;
    seiseki : string;
}

(* --- sample --- *)
let gakusei_lst = [
    {name = "hoge"; tensuu = 80; seiseki = "A"};
    {name = "hoge"; tensuu = 60; seiseki = "B"};
    {name = "hoge"; tensuu = 40; seiseki = "C"};
    {name = "hoge"; tensuu = 100; seiseki = "A"};
    {name = "hoge"; tensuu = 90; seiseki = "A"};
]

(* 目的: gakusei_t 型のリストのうち、任意の成績の人数を返す *)
(* count: gakusei_t list -> string -> int *)
let count gakusei_lst seiseki0 =
    (* 目的: first が seiseki0 と一致するか判定 *)
    (* is_seiseki0: gakusei_t -> bool *)
    let is_seiseki0 gakusei = gakusei.seiseki = seiseki0 in
        List.length (List.filter is_seiseki0 gakusei_lst)

(* --- test --- *)
let test1 = count gakusei_lst "A" = 3
let test2 = count gakusei_lst "B" = 1
let test3 = count gakusei_lst "C" = 1
let test4 = count gakusei_lst "" = 0
let test5 = count [] "A" = 0
let test6 = count [] "" = 0