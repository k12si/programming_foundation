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
let rec even lst = List.filter (fun x -> x mod 2 = 0) lst  

(* --- test --- *)
let test1 = even [1; 3; 4; 5; 8] = [4; 8]
let test2 = even [] = []
let test3 = even [0; 8; -1] = [0; 8]


(* 14.2 *)
(* 目的: gakusei_t 型のリストから、成績が 「A」 の学生の人数を返す *)
(* count_A: gakusei_t lst -> int *)
let count_A gakusei_lst = List.length (List.filter (fun gakusei -> gakusei.seiseki = "A") gakusei_lst)

(* --- test --- *)
let test1 = count_A gakusei_lst = 3
let test2 = count_A [] = 0


(* 14.3 *)
(* 目的: 文字列のリストを受け取り、各要素を前から順に連結した文字列を返す *)
(* concat: string list -> string *)
let concat lst = List.fold_right (fun first rest_result -> first ^ rest_result) lst ""

(* --- test --- *)
let test1 = concat ["あ"; "い"; "う"; "え"; "お"] = "あいうえお"
let test2 = concat [] = ""


(* 14.3 *)
(* 目的: gakusei_t 型のリストを受け取り、全員の得点の合計を返す *)
(* gakusei_sum: gakusei_t list -> int *)
let gakusei_sum gakusei_lst = List.fold_right (fun first rest_result -> first.tensuu + rest_result) gakusei_lst 0

(* --- test --- *)
let test1 = gakusei_sum gakusei_lst = 370
let test2 = gakusei_sum [] = 0