(* 学生の構造体を表す *)
type gakusei_t = {
    name    : string;
    tensuu  : int;
    seiseki : string;
}

(* 目的: 点数順に並んだ学生リスト中に、任意の学生を点数を元に適切な箇所に挿入する *)
(* ins_gakusei: gakusei_t list -> gakusei_t -> gakusei_t list *)
let rec ins_gakusei studens gakusei = match studens with
    [] -> [gakusei]
    | ({name = n1; tensuu = t1; seiseki = s1} as first) :: rest -> (* ins_gakusei rest *)
        (match gakusei with
            {name = n2; tensuu = t2; seiseki = s2} ->
                if t2 <= t1 then gakusei :: first :: rest 
                            else first :: ins_gakusei rest gakusei)

(* 目的: 学生型を表現する構造体のリストを受け取り、点数順に並べ替える *)
(* gakusei_sort: gakusei_t list -> gakusei_t list *)
let rec gakusei_sort students = match students with
    [] -> []
    | ({name = n; tensuu = t; seiseki = s} as first) :: rest -> (* gakusei_sort rest *)
        ins_gakusei (gakusei_sort rest) first


(* ------ 例 ------ *)
(* gakusei_t *)
let gakusei1 = {name = "hige"; tensuu = 90; seiseki = "A"}

(* gakusei_t list(整列済) *)
let students1 = [
    {name = "huga"; tensuu = 50; seiseki = "C"};
    {name = "hoge"; tensuu = 80; seiseki = "B"};
    {name = "haga"; tensuu = 100; seiseki = "A"}
]

(* gakusei_t list(未整列) *)
let students2 = [
    {name = "hoge"; tensuu = 80; seiseki = "B"};
    {name = "huga"; tensuu = 50; seiseki = "C"};
    {name = "haga"; tensuu = 100; seiseki = "A"}
]


(* ------ テスト ------ *)
(* ins_gakusei *)
let test0 = ins_gakusei [] gakusei1 = [
    {name = "hige"; tensuu = 90; seiseki = "A"}
]
let test1 = ins_gakusei students1 gakusei1 = [
    {name = "huga"; tensuu = 50; seiseki = "C"};
    {name = "hoge"; tensuu = 80; seiseki = "B"};
    {name = "hige"; tensuu = 90; seiseki = "A"};
    {name = "haga"; tensuu = 100; seiseki = "A"}
] 

(* gakusei_sort *)
let test2 = gakusei_sort [] = []
let test3 = gakusei_sort students1 = [
    {name = "huga"; tensuu = 50; seiseki = "C"};
    {name = "hoge"; tensuu = 80; seiseki = "B"};
    {name = "haga"; tensuu = 100; seiseki = "A"}
]