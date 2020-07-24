(* 人のパーソナル情報 (身長 [m], 体重 [kg], 誕生日 [ ○ 月 ○ 日 ], 血液型) を表す型 *)
type person_t = {
    height      : float;
    weight      : float;
    birthday    : string;
    blood_type  : string;
}

(* 目的: 血液型が A 型の人を返す *)
(* count_ketsueki_A: person_t list -> int *)
let rec count_ketsueki_A lst = match lst with
    [] -> 0
    | {height = h; weight = w; birthday = birth; blood_type = blood} :: rest    (* count_ketsueki_A rest *)
        -> if blood = "A" then 1 + count_ketsueki_A rest
                          else count_ketsueki_A rest

let person1 = [{ height = 164.5; weight = 50.3; blood_type = "AB"; birthday = "7月19日" }]
let person2 = [{ height = 165.5; weight = 51.3; blood_type = "B"; birthday = "7月18日" };
               { height = 165.5; weight = 51.3; blood_type = "A"; birthday = "7月18日" }]
let person3 = [{ height = 166.5; weight = 52.3; blood_type = "O"; birthday = "7月17日" };
               { height = 166.5; weight = 52.3; blood_type = "B"; birthday = "7月17日" };
               { height = 166.5; weight = 52.3; blood_type = "A"; birthday = "7月17日" };
               { height = 166.5; weight = 52.3; blood_type = "A"; birthday = "7月17日" }]

(* テスト *)
let test1 = count_ketsueki_A person1 = 0
let test2 = count_ketsueki_A person2 = 1
let test3 = count_ketsueki_A person3 = 2