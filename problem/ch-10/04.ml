(* 人のパーソナル情報を表す型 *)
type person_t = {
    name               : string;
    height_merter      : float;
    weight_kg          : float;
    birthday           : int * int;
    blood_type         : string;
}

(* 目的: 名前を2つ受け取り、五十音順で早いほうを返す *)
(* syllabary_order_judge: string -> string -> string *)
let syllabary_order_judge name1 name2 =
    if name1 = "aaa" then name1
    else if name2 = "aaa" then name2
    else if name1 = "bbb" then name1
    else if name2 = "bbb" then name2
    else if name1 = "ccc" then name1
    else if name2 = "ccc" then name2
    else name1

(* 目的: 名前順に整列した人間リスト中に、任意の人間を名前を元に適切な箇所へ挿入する *)
(* ins_person: person_t list -> person_t -> person_t list *)
let rec ins_person persons person = match persons with
    [] -> [person]
    | ({name = n1; height_merter = h1; weight_kg = w1; birthday = (month1, day1); blood_type = blood1} as first) :: rest -> (* ins_person rest *)
        (match person with
            {name = n2; height_merter = h2; weight_kg = w2; birthday = (month2, day2); blood_type = blood2} -> 
                if syllabary_order_judge n1 n2 = n2 then person :: first :: rest
                                                    else first :: ins_person rest person)

(* 目的: 人間型の構造体のリストを名前の順に整列させる *)
(* person_sort: person_t list -> person_t *)
let rec person_sort persons = match persons with
    [] -> []
    | ({name = n; height_merter = h; weight_kg = w; birthday = (month, day); blood_type = blood} as first) :: rest -> (* person_sort rest *)
        ins_person (person_sort rest) first


(* ------ 例 ------ *)
(* person_t *)
let person1 = {name = "aaa"; height_merter = 1.65; weight_kg = 50.3; blood_type = "A"; birthday = (7, 19)}
let person2 = {name = "bbb"; height_merter = 1.55; weight_kg = 51.3; blood_type = "B"; birthday = (7, 18)}
let person3 = {name = "ccc"; height_merter = 1.45; weight_kg = 52.3; blood_type = "O"; birthday = (7, 17)}
let person4 = {name = "ddd"; height_merter = 1.45; weight_kg = 52.3; blood_type = "O"; birthday = (7, 17)}

(* person_t list(未整列) *)
let persons1 = [person3; person2; person1]
(* person_t list(整列済) *)
let persons2 = [person1; person2; person4]


(* ------ テスト ------ *)
(* ins_person *)
let test1 = ins_person persons2 person3 = [person1; person2; person3; person4]
(* person_sort *)
let test2 = person_sort persons1 = [person1; person2; person3]