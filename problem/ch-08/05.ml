(* 駅名の情報 (駅名(漢字), 駅名(ひらがな), 駅名(ローマ字), 路線名) を表す型 *)
type ekimei_t = {
    kanji   : string;
    kana    : string;
    romaji  : string;
    shozoku : string;
}

let station1 = {kanji = "尾崎"; kana = "おざき"; romaji = "ozaki"; shozoku = "南海線"}