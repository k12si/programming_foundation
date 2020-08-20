# use "./06.ml"

(* 目的: 初期化した eki_t型リストから、始点駅の要素を削除する *)
(* rm_start_station: string -> eki_t list -> eki_t list *)
let rec rm_start_station start_station_name eki_list = match eki_list with
    [] -> []
    | ({name = n; saitan_kyori_km = s; path = p} as first) :: rest ->
        if start_station_name = n then rest
                                  else first :: rm_start_station start_station_name rest

(* 目的: 直前に確定した駅 (eki_t型) と未確定の駅のリストを受け取り、更新処理後の未確定の駅リストを返す *)
(* koushin: eki_t -> eki_t list -> eki_t list *)
let koushin done_station v = match v with
    [] -> []
    | ({name = un; saitan_kyori_km = us; path = up} as undone_station) :: rest ->
        List.map (koushin1 done_station) v

(* --- test --- *)
let v = rm_start_station start_station_name eki_list
let test1 = koushin start_eki_t v
