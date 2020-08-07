(* 目的: 整数の昇順リスト中に、任意の整数を適切に挿入する *)
(* insert: int list -> int -> int list *)
let rec insert lst num = match lst with
    [] -> [num]
    | first :: rest ->
        if num <= first then num :: first :: rest
                        else first :: insert rest num

(* テスト *)
let test1 = insert [] 5 = [5]
let test2 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8]
let test3 = insert [1; 3; 6; 10; 40] 3 = [1; 3; 3; 6; 10; 40]