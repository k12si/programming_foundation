(* 目的: 引数に「関数」、「初期値」、「リスト」を受け取り、「初期値」から初めて、「リスト」の左から「関数」を施し込む *)
(* fold_left: ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f init lst = match lst with
    [] -> init
    | first :: rest -> f (fold_left f init rest) first


(* --- test --- *)
let test1 = fold_left (+) 5 [1; 2; 3; 4] = 15 
let test2 = fold_left (-) 5 [1; 2; 3; 4] = -5 
let test3 = fold_left ( * ) 5 [1; 2; 3; 4] = 120 