# use "./../ch-09/09.ml"
# use "./../ch-10/12.ml"
# use "./../ch-12/03.ml"
# use "./../ch-12/04.ml"

(* --- ダイクストラのための初期化 --- *)
let start_station_name = "神田"
let start_eki_t = {name = "神田"; saitan_kyori_km = 0.; path = ["神田"]}
let seiretsu_global_ekimei_list = seiretsu global_ekimei_list
let eki_list = make_eki_list seiretsu_global_ekimei_list
let init_eki_list = shokika eki_list start_station_name


(* 目的: 初期化した eki_t型リストから、始点駅の要素を削除する *)
(* rm_start_station: string -> eki_t list -> eki_t list *)
let rec rm_start_station start_station_name eki_list = match eki_list with
    [] -> []
    | ({name = n; saitan_kyori_km = s; path = p} as first) :: rest ->
        if start_station_name = n then rest
                                  else first :: rm_start_station start_station_name rest

(* 目的: 直前に確定した駅 (eki_t型) と未確定の駅のリストを受け取り、更新処理後の未確定の駅リストを返す *)
(* koushin: eki_t -> eki_t list -> eki_t list *)
let koushin done_station v = 
    List.map
        ((fun done_station undone_station ->
                let distance = get_ekikan_kyori done_station.name undone_station.name global_ekikan_list in
                    if distance = infinity || distance +. done_station.saitan_kyori_km > undone_station.saitan_kyori_km then undone_station
                                                                                                                        else {name = undone_station.name; saitan_kyori_km = distance; path = List.append done_station.path [undone_station.name]}) done_station)
        v


(* --- test --- *)
let v = rm_start_station start_station_name eki_list
let test1 = koushin start_eki_t v