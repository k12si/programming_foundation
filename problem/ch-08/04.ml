(* 人のパーソナル情報 (名前, 身長 [m], 体重 [kg], 誕生日 [ ○ 月 ○ 日 ], 血液型) を表す型 *)
type person_t = {
    name        : string;
    height      : float;
    weight      : float;
    birthday    : string;
    blood_type  : string;
}

(* 目的: 人名から、血液型を表示する *)
(* ketsueki_hyoji: person_t -> string *)
let ketsueki_hyoji person = match person with
    { name = n; height = h; weight = w; birthday = birth; blood_type = blood } -> n ^ "さんの血液型は" ^ blood ^ "型です"

(* テスト *)
let person1 = { name = "takashi"; height = 164.5; weight = 50.3; blood_type = "A"; birthday = "7月19日" }
let test1 = ketsueki_hyoji person1 = "takashiさんの血液型はA型です"