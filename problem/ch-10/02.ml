(* 目的: 整数の昇順リスト中に、任意の整数を適切に挿入する *)
(* insert: int list -> int -> int list *)
let rec insert lst num = match lst with
    [] -> [num]
    | first :: rest ->
        if num <= first then num :: first :: rest
                        else first :: insert rest num

(* 目的: 整数リストを昇順に並べ替える *)
(* ins_sort: int list -> int list *)
let rec ins_sort lst = match lst with
    [] -> []
    | first :: rest -> insert (ins_sort rest) first (* ins_sort rest *)

(* テスト *)
let test1 = ins_sort [] = []
let test2 = ins_sort [8; 2; 0; 4; 6] = [0; 2; 4; 6; 8]