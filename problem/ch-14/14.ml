(* 目的: 文字列のリストを受け取り、各要素を前から順に連結した文字列を返す *)
(* concat: string list -> string *)
let concat lst = List.fold_right (^) lst ""

(* --- test --- *)
let test1 = concat ["あ"; "い"; "う"; "え"; "お"] = "あいうえお"
let test2 = concat [] = ""