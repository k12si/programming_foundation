# use "./../ch-09/09.ml"
# use "./../ch-12/01.ml"

(* 12.2 *)
(* 目的: 駅名型のリストを元に、駅型のデフォルトリスト(駅名、駅間の距離無限大、経由駅は空リスト)を作成する *)
(* make_eki_list: ekimei_t list -> eki_t list *)
let make_eki_list global_ekimei_list = List.map (fun first -> {name = first.kanji; saitan_kyori_km = infinity; path = []}) global_ekimei_list

(* --- test --- *)
let test1 = make_eki_list global_ekimei_list


(* 12.3 *)
(* 目的: 駅型リストと、起点となる駅名を受け取り、駅型リストを初期化する *)
(* shokika: eki_t list -> string -> eki list *)
let shokika eki_list start_station = List.map (fun first -> if start_station = first.name then {name = first.name; saitan_kyori_km = 0.; path = [first.name]} else first) eki_list


(* --- test --- *)
let eki_list = make_eki_list global_ekimei_list
let test1 = shokika eki_list "神田"