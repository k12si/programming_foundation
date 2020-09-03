(* # use "./../ch-14/13.ml" *)

(* 目的: eki_t 型のリストを受け取って、最短距離が最小の eki_t の値と、その値を除いた eki_t 型リストを返す *)
(* saitan_wo_bunri: eki_t list -> eki_t * eki_t list *)
let saitan_wo_bunri eki_list = 
    (* iter: eki_t -> eki_t * eki_t list -> eki_t * eki_t list *)
    let iter target_eki provisional_pair = match provisional_pair with
        (saitankyori_saisyo_koho_eki, v) -> 
            if saitankyori_saisyo_koho_eki.saitan_kyori_km < target_eki.saitan_kyori_km
                then (saitankyori_saisyo_koho_eki, target_eki :: v)
                else (target_eki, saitankyori_saisyo_koho_eki :: v)
    in match eki_list with
        [] -> ({name = "UNDEFINED"; saitan_kyori_km = infinity; path = []}, [])
        | first :: rest -> List.fold_right iter rest (first, [])


(* --- eki_t list の例 --- *)
(* let eki_lst = [
    {name = "神田"; saitan_kyori_km = 0.; path = ["神田"]};
    {name = "三越前"; saitan_kyori_km = 0.7; path = ["神田"; "三越前"]};
    {name = "末広町"; saitan_kyori_km = 1.1; path = ["神田"; "末広町"]};
    {name = "新御茶ノ水"; saitan_kyori_km = infinity; path = []};
] *)

(* --- test --- *)
(* let test1 = saitan_wo_bunri eki_lst = (
    {name = "神田"; saitan_kyori_km = 0.; path = ["神田"]},
    [
        {name = "三越前"; saitan_kyori_km = 0.7; path = ["神田"; "三越前"]};
        {name = "末広町"; saitan_kyori_km = 1.1; path = ["神田"; "末広町"]};
        {name = "新御茶ノ水"; saitan_kyori_km = infinity; path = []};
    ]
) *)