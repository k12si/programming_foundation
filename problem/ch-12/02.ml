# use "./../ch-09/09.ml"
# use "./01.ml"

(* 目的: 駅名型のリストを元に、駅型のデフォルトリスト(駅名、駅間の距離無限大、経由駅は空リスト)を作成する *)
(* make_eki_list: ekimei_t list -> eki_t list *)
let rec make_eki_list global_ekimei_list = match global_ekimei_list with
    [] -> []
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} :: rest -> 
        {name = kanji; saitan_kyori_km = infinity; path = []} :: make_eki_list rest


(* --- test --- *)
let test1 = make_eki_list global_ekimei_list