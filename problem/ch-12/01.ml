(* ダイクストラにて最短経路を導出するために、駅が保持しておくべき情報の構造体 *)
type eki_t = {
    name               : string;          (* 駅名 *)
    saitan_kyori_km    : float;           (* 最短距離 [km] *)
    path               : string list;     (* 経由する駅名リスト *)
}