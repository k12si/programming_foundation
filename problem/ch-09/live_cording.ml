(* 問題: person_t型を受け取って、BMIを返す *)

(* 人間の構造体を表す *)
type person_t = {
    name          : string;
    height_meter  : float;    
    weight_kg     : float;
}

(* 目的: 身長, 体重を受け取って、BMI値を返す *)
(* bmi: float -> float -> float *)
let bmi height_meter weight_kg = weight_kg /. height_meter ** 2.

(* 目的: パーソナル情報を受け取って、BMIを表すメッセージを返す *)
(* bmi_msg: person_t -> string *)
let bmi_msg person = match person with
    {name = n; height_meter = h; weight_kg = w} -> 
        n ^ "のBMIは" ^ string_of_float ( bmi h w )

(* 例: person_t *)
let person1 = {name = "kaito2" ; height_meter = 1.5 ; weight_kg = 49.5}

(* テスト: bmi *)
let test_bmi = bmi 1.5 49.5 = 22.0
(* テスト: bmi_msg *)
let test1 = bmi_msg person1 = "kaito2のBMIは22."