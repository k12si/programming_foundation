(* 駅と駅の接続情報 (起点の駅名, 終点の駅名, 経由する駅名, 2駅間の距離, 所要時間) を表す型 *)
type ekikan_t = {
    kiten   : string;   (* 起点の駅名 *)
    shuten  : string;   (* 終点の駅名 *)
    keiyu   : string;   (* 経由する駅名 *)
    kyori   : float;    (* 2駅間の距離 [km] *)
    jikan   : int;      (* 所要時間 [分] *)
}

(* 目的: 2 駅間の距離を表示する *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori station1 station2 global_ekikan_list = match global_ekikan_list with
    [] -> infinity
    | {kiten = kiten; shuten = s; keiyu = keiyu; kyori = kyori; jikan = j} :: rest -> (* get_ekikan_kyori station1 station2 rest *)
        if (station1 = kiten && station2 = s) || (station2 = kiten && station1 = s) then kyori
                                                                                    else get_ekikan_kyori station1 station2 rest


(* ------ 例 ------ *)
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

(* ------ テスト ------ *)
let test1 = get_ekikan_kyori "" "" global_ekikan_list = infinity
let test2 = get_ekikan_kyori "尾崎" "代々木公園" global_ekikan_list = infinity
let test3 = get_ekikan_kyori "赤坂" "国会議事堂前" global_ekikan_list = 0.8
let test4 = get_ekikan_kyori "国会議事堂前" "赤坂" global_ekikan_list = 0.8