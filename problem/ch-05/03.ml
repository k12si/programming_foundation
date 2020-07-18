(* 目的: 誕生日 month 月　day 日　を受け取り、該当する星座を返す *)
(* seiza: int -> int -> string *)
let seiza month day = 

(* テスト *)
let test1 = seiza 3 21 = "牡羊座"
let test2 = seiza 4 20 = "牡羊座"
let test3 = seiza 4 21 = "牡牛座"
let test4 = seiza 5 20 = "牡牛座"
let test5 = seiza 5 21 = "双子座"
let test6 = seiza 6 21 = "双子座"
let test7 = seiza 6 22 = "蟹座"
let test8 = seiza 7 23 = "蟹座"
let test9 = seiza 7 24 = "獅子座"
let test10 = seiza 8 23 = "獅子座"
let test11 = seiza 8 24 = "乙女座"
let test12 = seiza 9 23 = "乙女座"
let test13 = seiza 9 24 = "天秤座"
let test14 = seiza 10 23 = "天秤座"
let test15 = seiza 10 24 = "蠍座"
let test16 = seiza 11 22 = "蠍座"
let test17 = seiza 11 23 = "射手座"
let test18 = seiza 12 22 = "射手座"
let test19 = seiza 12 23 = "山羊座"
let test20 = seiza 1 20 = "山羊座"
let test21 = seiza 1 21 = "水瓶座"
let test22 = seiza 2 19 = "水瓶座"
let test23 = seiza 2 20 = "魚座"
let test24 = seiza 3 20 = "魚座"