(* 本に関する情報 (タイトル, 著者名, 値段, ISBN) を表す型 *)
type book_t = {
    title   :   string;
    author  :   string;
    price   :   int;
    isbn    :   int;
}

let book1 = { title = "aaa"; author = "bbb"; price = 123; isbn = 456 }
let book2 = { title = "ccc"; author = "ddd"; price = 213; isbn = 546 }
let book3 = { title = "eee"; author = "fff"; price = 321; isbn = 654 }