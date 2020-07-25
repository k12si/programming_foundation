(* 目的: 名前と成績の組を受け取り、「〇〇 さんの評価は △ です」と返す *)
(* seiseki: string * string -> string *)
let seiseki pair = match pair with
    (name, rating) -> name ^ "さんの評価は" ^ rating ^ "です"

(* テスト *)
let test1 = seiseki ("hoge", "A") = "hogeさんの評価はAです"