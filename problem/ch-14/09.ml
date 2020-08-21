(* 人のパーソナル情報を表す型 *)
type person_t = {
    name               : string;
    height_merter      : float;
    weight_kg          : float;
    birthday           : int * int;
    blood_type         : string;
}

(* 目的: person_t 型を受け取り、名前フィールドを返す *)
(* nil: person_t -> string *)
let test1 = (fun person -> match person with
    {name = n; height_merter = h; weight_kg = w; birthday = birthday; blood_type = blood_type} -> n) {name = "hoge"; height_merter = 1.0; weight_kg = 1.0; birthday = (4,3); blood_type = "A"}