(* お小遣い帳の情報 (商品名, 値段, 場所, 日付) を表す型 *)
type okozukai_t = {
    product_name    :   string;
    price           :   int;
    place           :   string;
    date            :   string;
}

let okozukai1 = { product_name = "aaa"; place = "bbb"; price = 123; date = "2020-07-19" }
let okozukai2 = { product_name = "ccc"; place = "ddd"; price = 213; date = "2020-07-18" }
let okozukai3 = { product_name = "eee"; place = "fff"; price = 321; date = "2020-07-17" }