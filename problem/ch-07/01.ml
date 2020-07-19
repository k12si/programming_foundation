(* 目的: 5 教科の合計点と平均点を組にして返す *)
(* goukei_to_heikin: float -> float -> float -> float -> float -> float * float *)
let goukei_to_heikin japanese math english science society = (japanese +. math +. english +. science +. society,
                                                              (japanese +. math +. english +. science +. society) /. 5.)

(* テスト *)
let test1 = goukei_to_heikin 10. 20. 30. 40. 50. = (150., 30.)