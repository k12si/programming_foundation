(* 人のパーソナル情報 (身長 [m], 体重 [kg], 誕生日 [ ○ 月 ○ 日 ], 血液型) を表す型 *)
type person_t = {
    name               : string;
    height_merter      : float;
    weight_kg          : float;
    birthday           : string;
    blood_type         : string;
}

let person1 = { name = "aaa"; height_merter = 1.65; weight_kg = 50.3; blood_type = "A"; birthday = "7月19日" }
let person2 = { name = "bbb"; height_merter = 1.55; weight_kg = 51.3; blood_type = "B"; birthday = "7月18日" }
let person3 = { name = "ccc"; height_merter = 1.45; weight_kg = 52.3; blood_type = "O"; birthday = "7月17日" }