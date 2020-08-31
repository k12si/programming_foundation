(* 目的: 自然数を受け取ると、それ以下の素数のリストを返す *)
(* prime: int -> int list *)
let prime n =
    (* 目的: 2 以上の自然数を受け取り、 2 から受け取った自然数までの昇順リストを作成する *)
    (* from_two_enumerate: int -> int list *)
    let rec from_two_enumerate n = 
        if n < 2 then []
                else from_two_enumerate (n-1) @ [n]
    (* 目的: 自然数の昇順リストを受け取ると、素数のみの昇順リストを返す *)
    (* sieve: int list -> int list *)
    in let rec sieve lst = match lst with
    [] -> []
    | first :: rest -> first :: sieve (List.filter (fun item -> (item mod first) != 0) rest)
    in sieve (from_two_enumerate n)

(* --- test --- *)
let test1 = prime 8 = [2; 3; 5; 7]
let test2 = prime 23 = [2; 3; 5; 7; 11; 13; 17; 19; 23]