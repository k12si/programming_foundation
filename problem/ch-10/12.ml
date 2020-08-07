(* 駅名の情報 (駅名(漢字), 駅名(ひらがな), 駅名(ローマ字), 路線名) を表す型 *)
type ekimei_t = {
    kanji   : string;
    kana    : string;
    romaji  : string;
    shozoku : string;
}

(* 駅と駅の接続情報 (起点の駅名, 終点の駅名, 経由する駅名, 2駅間の距離, 所要時間) を表す型 *)
type ekikan_t = {
    kiten   : string;   (* 起点の駅名 *)
    shuten  : string;   (* 終点の駅名 *)
    keiyu   : string;   (* 経由する駅名 *)
    kyori   : float;      (* 2駅間の距離 [km] *)
    jikan   : int;      (* 所要時間 [分] *)
}


(* ------ 例 ------ *)
(* ekimei_t *)
let global_ekimei_list = [ 
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"} 
]

(* ekikan_t *)
let global_ekikan_list = [ 
    {kiten="代々木上原"; shuten="代々木公園"; keiyu="千代田線"; kyori=1.0; jikan=2}; 
    {kiten="代々木公園"; shuten="明治神宮前"; keiyu="千代田線"; kyori=1.2; jikan=2}; 
    {kiten="明治神宮前"; shuten="表参道"; keiyu="千代田線"; kyori=0.9; jikan=2}; 
    {kiten="表参道"; shuten="乃木坂"; keiyu="千代田線"; kyori=1.4; jikan=3}; 
    {kiten="乃木坂"; shuten="赤坂"; keiyu="千代田線"; kyori=1.1; jikan=2}; 
    {kiten="赤坂"; shuten="国会議事堂前"; keiyu="千代田線"; kyori=0.8; jikan=1}; 
    {kiten="国会議事堂前"; shuten="霞ヶ関"; keiyu="千代田線"; kyori=0.7; jikan=1}; 
    {kiten="霞ヶ関"; shuten="日比谷"; keiyu="千代田線"; kyori=1.2; jikan=2}; 
    {kiten="日比谷"; shuten="二重橋前"; keiyu="千代田線"; kyori=0.7; jikan=1}; 
    {kiten="二重橋前"; shuten="大手町"; keiyu="千代田線"; kyori=0.7; jikan=1} 
]


(* 目的: ローマ字の駅名を漢字表記に変換する *)
(* romaji_to_kanji: string -> ekimei_t list -> string *)
let rec romaji_to_kanji station_romaji global_ekimei_list = match global_ekimei_list with
    [] -> ""
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} :: rest -> (* romaji_to_kanji station_romaji rest *)
        if station_romaji = r then kanji
                              else romaji_to_kanji station_romaji rest

(* 目的: 2 駅間の距離を表示する *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori station1 station2 global_ekikan_list = match global_ekikan_list with
    [] -> infinity
    | {kiten = kiten; shuten = s; keiyu = keiyu; kyori = kyori; jikan = j} :: rest -> (* get_ekikan_kyori station1 station2 rest *)
        if (station1 = kiten && station2 = s) || (station2 = kiten && station1 = s) then kyori
                                                                                    else get_ekikan_kyori station1 station2 rest

(* 目的: 2 駅間の距離を表示する文字列を返す *)
(* kyori_wo_hyoji: string -> string -> string *)
let kyori_wo_hyoji station_romaji1 station_romaji2 = 
    let station1 = romaji_to_kanji station_romaji1 global_ekimei_list in 
        let station2 = romaji_to_kanji station_romaji2 global_ekimei_list in
            match (station1, station2) with
                ("", station2) -> station_romaji1 ^ "という駅は存在しません"
                | (station1, "") -> station_romaji2 ^ "という駅は存在しません"
                | (station1, station2) -> 
                    let ekikan_kyori = get_ekikan_kyori station1 station2 global_ekikan_list in
                        if ekikan_kyori = infinity then station1 ^ "駅と" ^ station2 ^ "駅はつながっていません"
                                                   else station1 ^ "駅から" ^ station2 ^ "駅までは" ^ string_of_float (ekikan_kyori) ^ "kmです"


(* ------ テスト ------ *)
let test1 = kyori_wo_hyoji "" "" = "という駅は存在しません"
let test2 = kyori_wo_hyoji "ozaki" "yoyogikouen" = "ozakiという駅は存在しません"
let test3 = kyori_wo_hyoji "hibiya" "yoyogikouen" = "日比谷駅と代々木公園駅はつながっていません"
let test4 = kyori_wo_hyoji "akasaka" "kokkaigijidoumae" = "赤坂駅から国会議事堂前駅までは0.8kmです"
let test5 = kyori_wo_hyoji "kokkaigijidoumae" "akasaka" = "国会議事堂前駅から赤坂駅までは0.8kmです"