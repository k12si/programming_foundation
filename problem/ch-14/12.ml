(* # use "./../ch-09/09.ml"
# use "./../ch-12/01.ml" *)

(* 目的: ekimei_t 型のリストと、起点となる駅名(漢字)を受け取り、初期化した eki_t 型のリストを返す *)
(* make_initial_eki_list: ekimei_t list -> string -> eki_t list *)
let make_initial_eki_list global_ekimei_list start_station =
    List.map
        (fun first ->
                if first.kanji = start_station then {name = first.kanji; saitan_kyori_km = 0.; path = [first.kanji]}
                                               else {name = first.kanji; saitan_kyori_km = infinity; path = []})
        global_ekimei_list


(* --- test --- *)
(* let test1 = make_initial_eki_list global_ekimei_list "神田" *)