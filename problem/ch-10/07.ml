(* 人のパーソナル情報を表す型 *)
type person_t = {
    name               : string;
    height_merter      : float;
    weight_kg          : float;
    birthday           : int * int;
    blood_type         : string;
}

(* 目的: 人間型のリスト中に、各血液型が何人いるかをセットにして返す *)
(* ketsueki_shukei: person_t list -> int * int * int * int *)
let rec ketsueki_shukei persons = match persons with
    [] -> (0, 0, 0, 0)
    | {name = n; height_merter = h; weight_kg = w; birthday = (m, d); blood_type = blood} :: rest -> (* ketsueki_shukei rest *)
        let (a, b, o, ab) = ketsueki_shukei rest in
            if blood = "A" then (a + 1, b, o, ab)
            else if blood = "B" then (a, b + 1, o, ab)
            else if blood = "O" then (a, b, o + 1, ab)
            else (a, b, o, ab + 1)


(* ------ 例 ------ *)
(* person_t *)
let person_a = {name = "aaa"; height_merter = 1.65; weight_kg = 50.3; blood_type = "A"; birthday = (7, 19)}
let person_b = {name = "bbb"; height_merter = 1.55; weight_kg = 51.3; blood_type = "B"; birthday = (7, 18)}
let person_o = {name = "ccc"; height_merter = 1.45; weight_kg = 52.3; blood_type = "O"; birthday = (7, 17)}
let person_o' = {name = "ddd"; height_merter = 1.45; weight_kg = 52.3; blood_type = "O"; birthday = (7, 17)}

(* person_t list *)
let persons1 = [person_o; person_b; person_a; person_o']


(* ------ テスト ------ *)
let test1 = ketsueki_shukei persons1 = (1, 1, 2, 0)