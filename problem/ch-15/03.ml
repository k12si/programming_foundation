(* 目的: 2 以上の自然数を受け取り、 2 から受け取った自然数までの自然数リストを作成する *)
(* from_two_enumerate: int -> int list *)
let rec from_two_enumerate n = 
    if n < 2 then []
             else from_two_enumerate (n-1) @ [n]

(* 目的: 自然数のリストを受け取ると、素数のみのリストを返す *)
(* sieve: int list -> int list *)
let rec sieve lst = match lst with
    [] -> []
    | first :: rest -> first :: sieve (List.filter (fun item -> (item mod first) != 0) rest)

(* 目的: 自然数を受け取ると、それ以下の素数のリストを返す *)
(* prime: int -> int list *)
let prime n = sieve (from_two_enumerate n)

(* --- test --- *)
let test1 = from_two_enumerate 8 = [2; 3; 4; 5; 6; 7; 8]
let test2 = sieve (from_two_enumerate 8) = [2; 3; 5; 7]
let test3 = sieve (from_two_enumerate 23) = [2; 3; 5; 7; 11; 13; 17; 19; 23]
let test4 = prime 8 = [2; 3; 5; 7]
let test5 = prime 23 = [2; 3; 5; 7; 11; 13; 17; 19; 23]