(* 駅と駅の接続情報 (起点の駅名, 終点の駅名, 経由する駅名, 2駅間の距離, 所要時間) を表す型 *)
type ekikan_t = {
    kiten   : string;   (* 起点の駅名 *)
    shuten  : string;   (* 終点の駅名 *)
    keiyu   : string;   (* 経由する駅名 *)
    kyori   : int;      (* 2駅間の距離 [km] *)
    jikan   : int;      (* 所要時間 [分] *)
}

let shibuya_shinjuku = {kiten = "渋谷"; shuten = "新宿"; keiyu = "原宿"; kyori = 5; jikan = 5}