# use "./../ch-09/09.ml"

(* ダイクストラにて最短経路を導出するために、駅が保持しておくべき情報の構造体 *)
type eki_t = {
    name            : string;          (* 駅名 *)
    saitan_kyori    : float;           (* 最短距離 [km] *)
    temae_list      : string list;     (* 経由する駅名リスト *)
}


(* 目的: 駅名型のリストを元に、駅型のデフォルトリスト(駅名、駅間の距離無限大、経由駅は空リスト)を作成する *)
(* make_eki_list: ekimei_t list -> eki_t list *)
let rec make_eki_list global_ekimei_list = match global_ekimei_list with
    [] -> []
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} :: rest -> 
        {name = kanji; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest

(* 目的: 駅型リストと、起点となる駅名を受け取り、駅型リストを初期化する *)
(* shokika: eki_t list -> string -> eki list *)
let rec shokika eki_list start_station = match eki_list with
    [] -> []
    | ({name = n; saitan_kyori = s; temae_list = t} as first) :: rest ->
        if start_station = n then {name = n; saitan_kyori = 0.; temae_list = [n]} :: rest
                             else first :: shokika rest start_station


(* --- test --- *)
let eki_list = make_eki_list global_ekimei_list
let test1 = shokika eki_list "神田"