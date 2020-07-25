(* 駅名の情報 (駅名(漢字), 駅名(ひらがな), 駅名(ローマ字), 路線名) を表す型 *)
type ekimei_t = {
    kanji   : string;
    kana    : string;
    romaji  : string;
    shozoku : string;
}

(* 目的: 駅を受け取ると、「路線名、駅名(かな)」 を表示する *)
(* hyoji: ekimei_t -> string *)
let hyoji station = match station with
    {kanji = kanji; kana = kana; romaji = r; shozoku = s} ->
        s ^ "," ^ kana

(* テスト *)
let station1 = {kanji = "尾崎"; kana = "おざき"; romaji = "ozaki"; shozoku = "南海線"}
let station2 = {kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸ノ内線"}

let test1 = hyoji station1 = "南海線,おざき"
let test2 = hyoji station2 = "丸ノ内線,みょうがだに"