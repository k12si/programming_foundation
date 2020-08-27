(* 目的: 二つの自然数の最大公約数を求める *)
(* gcd: int -> int -> int *)
let rec gcd m n = 
    if n = 0 then m
             else gcd n (m mod n)

(* --- test --- *)
let test1 = gcd 2 0 = 2
let test2 = gcd 3 2 = 1
let test3 = gcd 48 32 = 16