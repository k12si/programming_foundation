# use "./../ch-14/13.ml"

(* 目的: eki_t 型リスト中の、最短距離が最小の要素を返す *)
(* get_shortest_eki: eki_t list -> eki_t *)
let rec get_shortest_eki eki_list = match eki_list with
    [] -> {name = ""; saitan_kyori_km = infinity; path = []}
    | first :: rest -> 
        if first.saitan_kyori_km <= (get_shortest_eki rest).saitan_kyori_km
            then first
            else get_shortest_eki rest

(* 目的: eki_t 型のリストと、eki_t 型の値を受け取り、受け取った eki_t 型の値とその値を除いたリストのペアを返す *)
(* sepatate_eki: eki_t list -> eki_t -> eki_t * eki_t list *)
let sepatate_eki eki_list shortest_eki = (shortest_eki, List.filter (fun item -> item.saitan_kyori_km <> shortest_eki.saitan_kyori_km) eki_list)

(* 目的: eki_t 型のリストを受け取り、最短距離が最小の eki_t 型の要素と、その要素を除いた eki_t 型 リストを返す *)
(* sepatate_shortest_eki: eki_t list -> eki_t * eki_t list *)
let rec sepatate_shortest_eki eki_list = 
    let shortest_eki = get_shortest_eki eki_list
    in sepatate_eki eki_list shortest_eki

(* --- test --- *)
let eki_lst = [
    {name = "神田"; saitan_kyori_km = 0.; path = ["神田"]};
    {name = "三越前"; saitan_kyori_km = 0.7; path = ["神田"; "三越前"]};
    {name = "末広町"; saitan_kyori_km = 1.1; path = ["神田"; "末広町"]};
    {name = "新御茶ノ水"; saitan_kyori_km = infinity; path = []};
]

let test1 = sepatate_shortest_eki eki_lst = (
    {name = "神田"; saitan_kyori_km = 0.; path = ["神田"]},
    [
        {name = "三越前"; saitan_kyori_km = 0.7; path = ["神田"; "三越前"]};
        {name = "末広町"; saitan_kyori_km = 1.1; path = ["神田"; "末広町"]};
        {name = "新御茶ノ水"; saitan_kyori_km = infinity; path = []};
    ]
)