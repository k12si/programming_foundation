(* 目的: 2 乗を計算する *)
(* square: int -> int *)
let square num = num * num

(* 目的: 自然数を受け取り、0 からその自然数までの 2 乗の和を返す *)
(* sum_of_square: int -> int *)
let rec sum_of_square num =
    if num = 0 then 0
               else square num + sum_of_square (num - 1) (* sum_of_square (num - 1) *)


(* ------ テスト ------ *)
let test1 = sum_of_square 4 = 30
let test2 = sum_of_square 0 = 0
let test3 = sum_of_square 1 = 1