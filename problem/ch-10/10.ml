(* 駅名の情報 (駅名(漢字), 駅名(ひらがな), 駅名(ローマ字), 路線名) を表す型 *)
type ekimei_t = {
    kanji   : string;
    kana    : string;
    romaji  : string;
    shozoku : string;
}

(* 目的: ローマ字の駅名を漢字表記に変換する *)
(* romaji_to_kanji: string -> ekimei_t list -> string *)
let rec romaji_to_kanji station_romaji global_ekimei_list = match global_ekimei_list with
    [] -> ""
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} :: rest -> (* romaji_to_kanji station_romaji rest *)
        if station_romaji = r then kanji
                              else romaji_to_kanji station_romaji rest


(* ------ 例 ------ *)
let global_ekimei_list = [
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"} 
]


(* ------ テスト ------ *)
let test1 = romaji_to_kanji "" global_ekimei_list = ""
let test2 = romaji_to_kanji "ozaki" global_ekimei_list = ""
let test3 = romaji_to_kanji "akasaka" global_ekimei_list = "赤坂"