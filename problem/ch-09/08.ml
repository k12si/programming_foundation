(* 人のパーソナル情報 (名前, 身長 [m], 体重 [kg], 誕生日(月), 誕生日(日), 血液型) を表す型 *)
type person_t = {
    name              : string;
    height            : float;
    weight            : float;
    birthday_month    : int;
    birthday_day      : int;
    blood_type        : string;
}

(* 目的: 乙女座に該当する人物名リストを作成 *)
(* otomeza: person_t list -> string list *)
let rec otomeza lst = match lst with
    [] -> []
    | {name = n; height = h; weight = w; birthday_month = month; birthday_day = day; blood_type = blood} :: rest (* otomeza rest *)
        -> if 823 <= month * 100 + day && month * 100 + day <= 922 then n :: otomeza rest
                                                                   else otomeza rest

let person1 = [{name = "hogeo"; height = 164.5; weight = 50.3; blood_type = "AB"; birthday_month = 8; birthday_day = 25}]
let person2 = [{name = "hogeta"; height = 165.5; weight = 51.3; blood_type = "B"; birthday_month = 8; birthday_day = 23};
               {name = "hogemi"; height = 165.5; weight = 51.3; blood_type = "A"; birthday_month = 9; birthday_day = 22}]
let person3 = [{name = "hogesuke"; height = 166.5; weight = 52.3; blood_type = "O"; birthday_month = 8; birthday_day = 22};
               {name = "hogetarou"; height = 166.5; weight = 52.3; blood_type = "B"; birthday_month = 9; birthday_day = 21};
               {name = "hogeko"; height = 166.5; weight = 52.3; blood_type = "A"; birthday_month = 9; birthday_day = 23};
               {name = "hogehoge"; height = 166.5; weight = 52.3; blood_type = "A"; birthday_month = 8; birthday_day = 24}]

(* テスト *)
let test1 = otomeza person1 = ["hogeo"]
let test2 = otomeza person2 = ["hogeta"; "hogemi"]
let test3 = otomeza person3 = ["hogetarou"; "hogehoge"]