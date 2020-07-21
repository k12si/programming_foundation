(* 人のパーソナル情報 (身長 [m], 体重 [kg], 誕生日 [ ○ 月 ○ 日 ], 血液型) を表す型 *)
type person_t = {
    height      : float;
    weight      : float;
    birthday    : string;
    blood_type  : string;
}

let person1 = { height = 164.5; weight = 50.3; blood_type = "A"; birthday = "7月19日" }
let person2 = { height = 165.5; weight = 51.3; blood_type = "B"; birthday = "7月18日" }
let person3 = { height = 166.5; weight = 52.3; blood_type = "O"; birthday = "7月17日" }