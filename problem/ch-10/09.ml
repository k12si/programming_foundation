(* 目的: リストの長さを返す *)
(* length: int list -> int *)
let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest (* length rest *)

(* 目的: 二つのリストを受け取り、長さが同じかを判定する *)
(* equal_length: 'a list -> 'a list -> bool *)
let rec equal_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> true
    | ([], first2 :: rest2) -> false
    | (first1 :: rest1, []) -> false
    | (first1 :: rest1, first2 :: rest2) -> equal_length rest1 rest2 (* equal_length rest1 rest2 *)

(* length を利用した場合の equal_length の定義 *)
(* let rec equal_length_used_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> true
    | ([], first2 :: rest2) -> false
    | (first1 :: rest1, []) -> false
    | (first1 :: rest1, first2 :: rest2) ->
        if length lst1 = length lst2 then true
                                     else false *)


(* ------ テスト  ------ *)
let test1 = equal_length [] [] = true
let test2 = equal_length [] [38; 1] = false
let test3 = equal_length [1; 3; 5] [8; 2; 32] = true