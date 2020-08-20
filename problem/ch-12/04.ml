(* # use "./../ch-09/09.ml" *)


(* 目的: 駅名を受け取り、かな順に整列した駅名リスト中の適切な部分に挿入する. *)
(* 目的2: すでにリスト中に同名の駅が存在した場合挿入しない. <- 別で実装する方法が分からなかったので一緒にしました。ごめんなさい。 *)
(* insert_station: ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec insert_station station_lst station = match station_lst with
    [] -> [station]
    | ({kanji = kanji; kana = kana; romaji = r; shozoku = s} as first) :: rest ->
        if station.kana < kana then station :: first :: rest
        else if station.kana = kana then first :: rest
        else first :: insert_station rest station

(* 目的: 駅名リストを受け取り、かな順に整列し、かつ駅の重複を取り除く *)
(* seiretsu: ekimei_t list -> ekimei_t list *)
let rec seiretsu global_ekimei_list = match global_ekimei_list with
    [] -> []
    | ({kanji = kanji; kana = kana; romaji = r; shozoku = s} as first) :: rest ->
        insert_station (seiretsu rest) first


(* --- test --- *)
(* let test1 = seiretsu global_ekimei_list *)