# use "./../ch-09/09.ml"
# use "./../ch-10/12.ml"
# use "./../ch-12/03.ml"
# use "./../ch-12/04.ml"
# use "./../ch-14/12.ml"
# use "./../ch-15/05_livecording.ml"
# use "./../ch-16/03.ml"
# use "./../ch-16/04.ml"

(* 目的: 始点の駅名と終点の駅名を受け取とると、駅の情報 (eki_t 型) を返す *)
(* dijkstra: string -> string -> eki_t *)
let dijkstra start_station_romaji end_station_romaji = 
    let ekimei_lst = seiretsu global_ekimei_list
    in let start_station_kanji = romaji_to_kanji start_station_romaji ekimei_lst
    in let end_station_kanji = romaji_to_kanji end_station_romaji ekimei_lst
    in let make_initial_eki_list = make_initial_eki_list ekimei_lst start_station_kanji
    in let u = dijkstra_main make_initial_eki_list global_ekikan_list
    in let rec recur u =
        match u with
            [] -> {name = "UNDEFINED"; saitan_kyori_km = infinity; path = []}
            | first :: rest ->
                if first.name = end_station_kanji
                    then first
                    else recur rest
    in recur u


(* --- test --- *)
let test1 = dijkstra "kanda" "eidannarimasu"
let test2 = dijkstra "shin-nakano" "omotesandou"