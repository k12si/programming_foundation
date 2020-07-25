(* 目的: 文字列のリストを受け取り、各要素を前から順に連結した文字列を返す *)
(* concat: string list -> string *)
let rec concat lst = match lst with
    [] -> ""
    | first :: rest -> (* cancat rest *)
        first ^ concat rest

(* テスト *)
let test1 = concat [] = ""
let test2 = concat ["あ"] = "あ"
let test3 = concat ["あ"; "い"; "う"; "え"; "お"] = "あいうえお"