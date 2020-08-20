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

(* 目的: 直前に最短経路が確定した駅と未確定の駅を受け取り、必要に応じて未確定の駅の情報を更新する *)
(* koushin1: eki_t -> eki_t -> eki_t *)
let koushin1 done_station undone_station =
    match done_station with {name = dn; saitan_kyori_km = ds; path = dp} ->
        match undone_station with {name = un; saitan_kyori_km = us; path = up} ->
            let distance = get_ekikan_kyori dn un global_ekikan_list in
                if distance = infinity || distance +. ds > us then undone_station
                                                             else {name = un; saitan_kyori_km = distance; path = List.append dp [un]}


(* --- test --- *)
(*  
let test1 = koushin1 start_eki_t {name = "末広町"; saitan_kyori_km = infinity; path = []} = {name = "末広町"; saitan_kyori_km = 1.1; path = [start_station; "末広町"]}
let test2 = koushin1 start_eki_t {name = "三越前"; saitan_kyori_km = infinity; path = []} = {name = "三越前"; saitan_kyori_km = 0.7; path = [start_station; "三越前"]}
let test3 = koushin1 start_eki_t {name = "西日暮里"; saitan_kyori_km = infinity; path = []} = {name = "西日暮里"; saitan_kyori_km = infinity; path = []}
*)