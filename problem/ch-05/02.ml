(* 目的: 時間 x を受け取り、午前か午後かを返す *)
(* jikan: int -> string *)
let jikan x = if 0000 <= x  && x < 1159 then "午前"
                                  else  if 1200 <= x && x < 2400  then "午後"
                                                             else "00:00 - 23:59 の間で指定してください。"

(* テスト *)
let test1 = jikan 0448 = "午前"
let test2 = jikan 1200 = "午後"
let test3 = jikan 1421 = "午後"
let test4 = jikan 0000 = "午前"
let test4 = jikan 8103 = "00:00 - 23:59 の間で指定してください。"