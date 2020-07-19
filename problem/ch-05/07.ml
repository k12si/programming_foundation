(* 目的: 身長 height と体重 weight を受け取ると、BMI 指数を返す *)
(* bmi: float -> float -> float *)
let bmi height weight = weight /. height**2.

(* 目的: 身長 height と体重 weight を受け取ると、体型を返す *)
(* taikei: float -> string *)
let taikei height weight = if bmi height weight < 18.5 then "やせ"
                                                       else if 18.5 <= bmi height weight && bmi height weight < 25. then "標準"
                                                                                                                    else if 25. <= bmi height weight && bmi height weight < 30. then "肥満"
                                                                                                                                                                                else "高度肥満"

(* テスト *)
let test1 = taikei 164.8 50. = "やせ"
let test2 = taikei 164.8 50.2 = "標準"
let test3 = taikei 164.8 68. = "肥満"
let test4 = taikei 164.8 81.5 = "高度肥満"