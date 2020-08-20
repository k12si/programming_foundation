(* 人のパーソナル情報を表す型 *)
type person_t = {
    name               : string;
    height_merter      : float;
    weight_kg          : float;
    birthday           : int * int; (* (month, day) *)
    blood_type         : string;
}

(* 目的: person_t型のリストを受け取り、「リスト中の人の名前」のリストを返す *)
(* person_namae: person_t list -> string list *)
let rec person_namae persons = match persons with
    [] -> []
    | {name = n; height_merter = h; weight_kg = w; birthday = birthday; blood_type = blood_type} :: rest ->
        n :: person_namae rest

(* --- sample of person_t list --- *)
let persons = [
    {name = "hoge"; height_merter = 150.5; weight_kg = 104.3; birthday = (3, 6); blood_type = "A"};
    {name = "huga"; height_merter = 152.5; weight_kg = 14.3; birthday = (5, 6); blood_type = "B"};
    {name = "hugo"; height_merter = 154.5; weight_kg = 43.5; birthday = (3, 8); blood_type = "O"};
    {name = "hugi"; height_merter = 164.5; weight_kg = 34.3; birthday = (3, 15); blood_type = "AB"};
    {name = "hugu"; height_merter = 164.7; weight_kg = 74.3; birthday = (7, 6); blood_type = "A"};
]

(* --- test --- *)
let test1 = person_namae persons = ["hoge"; "huga"; "hugo"; "hugi"; "hugu"]
let test1 = person_namae [] = []