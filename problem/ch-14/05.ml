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


(* 14.1 *)
(* 目的: int型配列を受け取り、偶数の要素を抽出した配列を返す *)
(* even: int lst -> int lst *)
let rec even lst =
    (* 目的: 2 で割り切れるか調べる *)
    (* is_mod2_0: int -> bool *)
    let is_mod2_0 n = n mod 2 = 0 in
        List.filter is_mod2_0 lst  

(* --- test --- *)
let test1 = even [1; 3; 4; 5; 8] = [4; 8]
let test2 = even [] = []
let test3 = even [0; 8; -1] = [0; 8]


(* 14.2 *)
(* 目的: gakusei_t 型のリストから、成績が 「A」 の学生の人数を返す *)
(* count_A: gakusei_t lst -> int *)
let count_A gakusei_lst =
    (* 目的: 学生の成績が　「A」 か判定する *)
    (* is_seiseki_A: gakusei_t -> bool *)
    let is_seiseki_A gakusei = gakusei.seiseki = "A" in
        List.length (List.filter is_seiseki_A gakusei_lst)

(* --- test --- *)
let test1 = count_A gakusei_lst = 3
let test2 = count_A [] = 0


(* 14.3 *)
(* 目的: 文字列のリストを受け取り、各要素を前から順に連結した文字列を返す *)
(* concat: string list -> string *)
let concat lst =
    (* 目的: first と rest_result を連結する *)
    (* strcat: string -> string -> string *)
    let strcat first rest_result = first ^ rest_result in
        List.fold_right strcat lst ""

(* --- test --- *)
let test1 = concat ["あ"; "い"; "う"; "え"; "お"] = "あいうえお"
let test2 = concat [] = ""


(* 14.3 *)
(* 目的: gakusei_t 型のリストを受け取り、全員の得点の合計を返す *)
(* gakusei_sum: gakusei_t list -> int *)
let gakusei_sum gakusei_lst =
    (* 目的: first(gakusei_t) と rest_result の得点の和を求める *)
    (* add_tensuu: gakusei_t -> int *)
    let add_tensuu first rest_result = first.tensuu + rest_result in
        List.fold_right add_tensuu gakusei_lst 0

(* --- test --- *)
let test1 = gakusei_sum gakusei_lst = 370
let test2 = gakusei_sum [] = 0