(* # use "./../ch-09/09.ml"
# use "./../ch-10/12.ml"
# use "./../ch-12/03.ml"
# use "./../ch-12/04.ml"
# use "./../ch-15/05_livecording.ml"
# use "./../ch-16/03.ml" *)

(* --- ダイクストラのための初期化 --- *)
(* let start_station_name = "神田"
let eki_list = make_eki_list (seiretsu global_ekimei_list)
let v = shokika eki_list start_station_name *)

(* 目的: 未確定の駅リスト(v)と、駅間(ekikan_t型)リストを受け取り、各駅について最短距離、最短経路が正しく入った eki_t 型リストを返す *)
(* dijkstra_main: eki_t list -> ekikan_t list -> eki_t list *)
let dijkstra_main v ekikan_lst =
    (* 目的: 確定した駅リスト(u)を返す *)
    (* u は確定した駅リスト *)
    let rec iter provisional_pair u = match provisional_pair with 
        (done_station, v) -> match v with
            [] -> done_station :: u
            | first :: rest -> iter (saitan_wo_bunri (koushin done_station v ekikan_lst)) (done_station :: u)
    in iter (saitan_wo_bunri v) []

(* --- test --- *)
(* let test1 = dijkstra_main v global_ekikan_list *)