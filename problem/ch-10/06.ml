(* 学生の構造体を表す *)
type gakusei_t = {
    name    : string;
    tensuu  : int;
    seiseki : string;
}

(* 目的: 学生レコードのリストから、最高点を取った学生レコードを返す *)
(* gakusei_max: gakusei_t list -> gakusei_t *)
let rec gakusei_max students = match students with
    [] -> {name = "-"; tensuu = 0; seiseki = "-"}
    | ({name = n; tensuu = t; seiseki = s} as first) :: rest -> (* gakusei_max rest *)
        let max_score_record = gakusei_max rest in
            if t >= max_score_record.tensuu then first
                                            else max_score_record

(* ------ 例 ------ *)
let students1 = [
    {name = "tarou"; tensuu = 20; seiseki = "F"};
    {name = "jiro"; tensuu = 50; seiseki = "C"};
    {name = "saburo"; tensuu = 80; seiseki = "B"}
]

(* ------ テスト ------ *)
let test1 = gakusei_max [] = {name = "-"; tensuu = 0; seiseki = "-"}
let test2 = gakusei_max students1 = {name = "saburo"; tensuu = 80; seiseki = "B"}