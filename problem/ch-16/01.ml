(* 目的: 整数リストを受け取り、それまでの数の合計からなるリストを返す *)
(* sum_list: int list -> int list *)
let sum_list lst = 
    (* sum はリストの合計値 *)
    let rec iter lst sum = match lst with
        [] -> []
        | first :: rest ->
            let current_sum = first + sum
            in current_sum :: iter rest current_sum
    in iter lst 0

(* --- test --- *)
let test1 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10]
let test2 = sum_list [] = []