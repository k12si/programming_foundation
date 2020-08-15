(* 人のパーソナル情報を表す型 *)
type person_t = {
    name               : string;
    height_merter      : float;
    weight_kg          : float;
    birthday           : int * int; (* (month, day) *)
    blood_type         : string;
}

(* 目的: person_t型のリスト中から、指定された血液型の人の数を返す *)
(* count_ketsueki: person_t list -> string -> int *)
let rec count_ketsueki persons filter_blood_type = match persons with
    [] -> 0
    | {name = n; height_merter = h; weight_kg = w; birthday = birthday; blood_type = blood_type} :: rest ->
        if blood_type = filter_blood_type then 1 + count_ketsueki rest filter_blood_type
                                          else count_ketsueki rest filter_blood_type

(* --- sample of person_t list --- *)
let persons = [
    {name = "hoge"; height_merter = 150.5; weight_kg = 104.3; birthday = (3, 6); blood_type = "A"};
    {name = "huga"; height_merter = 152.5; weight_kg = 14.3; birthday = (5, 6); blood_type = "B"};
    {name = "hugo"; height_merter = 154.5; weight_kg = 43.5; birthday = (3, 8); blood_type = "O"};
    {name = "hugi"; height_merter = 164.5; weight_kg = 34.3; birthday = (3, 15); blood_type = "AB"};
    {name = "hugu"; height_merter = 164.7; weight_kg = 74.3; birthday = (7, 6); blood_type = "A"};
]

(* --- test --- *)
let test1 = count_ketsueki persons "A" = 2
let test2 = count_ketsueki persons "B" = 1
let test3 = count_ketsueki persons "AB" = 1
let test4 = count_ketsueki [] "A" = 0
let test4 = count_ketsueki [] "null" = 0