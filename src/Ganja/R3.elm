module Ganja.R3 exposing (R3Basis(..), basisList, basisCount, basisName, R3(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized)
{-| Clifford Algebra: R3
Generated with ganja.js written by enki.

# Basis
@docs R3Basis, basisList, basisCount, basisName

# Multivector
@docs R3, zero, get, set, new

# Conversion
@docs toString, fromList, toList

# Unary Operators
@docs reverse, dual, conjugate, involute

# Binary Operators
@docs mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs

# Norm
@docs norm, inorm, normalized
-}

{-| Basis type |-}
type R3Basis =
    Scalar
    | E1
    | E2
    | E3
    | E12
    | E13
    | E23
    | E123


{-| Basis list -}
basisList : List R3Basis
basisList = 
    [ Scalar, E1, E2, E3, E12, E13, E23, E123 ]


{-| Number of coefficients |-}
basisCount : Int
basisCount = 
    8


{-| Basis name |-}
basisName : R3Basis -> String
basisName basis =
    case basis of
        Scalar -> 
            "1"

        E1 -> 
            "e1"

        E2 -> 
            "e2"

        E3 -> 
            "e3"

        E12 -> 
            "e12"

        E13 -> 
            "e13"

        E23 -> 
            "e23"

        E123 -> 
            "e123"


{-| Multivector |-}
type R3 =
    R3 Float Float Float Float Float Float Float Float


{-| Zero value |-}
zero : R3
zero =
    R3 0 0 0 0 0 0 0 0


{-| Get coefficient |-}
get : R3Basis -> R3 -> Float
get basis (R3 v0 v1 v2 v3 v4 v5 v6 v7) =
    case basis of
        Scalar -> 
            v0

        E1 -> 
            v1

        E2 -> 
            v2

        E3 -> 
            v3

        E12 -> 
            v4

        E13 -> 
            v5

        E23 -> 
            v6

        E123 -> 
            v7


{-| Update coefficient |-}
set : R3Basis -> Float -> R3 -> R3
set basis value (R3 v0 v1 v2 v3 v4 v5 v6 v7) =
    case basis of
        Scalar -> 
            R3 value v1 v2 v3 v4 v5 v6 v7

        E1 -> 
            R3 v0 value v2 v3 v4 v5 v6 v7

        E2 -> 
            R3 v0 v1 value v3 v4 v5 v6 v7

        E3 -> 
            R3 v0 v1 v2 value v4 v5 v6 v7

        E12 -> 
            R3 v0 v1 v2 v3 value v5 v6 v7

        E13 -> 
            R3 v0 v1 v2 v3 v4 value v6 v7

        E23 -> 
            R3 v0 v1 v2 v3 v4 v5 value v7

        E123 -> 
            R3 v0 v1 v2 v3 v4 v5 v6 value


{-| Multivector with one coefficient |-}
new : Float -> R3Basis -> R3
new value basis =
    set basis value zero


{-| Convert multivector to string |-}
toString : R3 -> String
toString a =
    let 
        values =
            toList a

        basisNames =
            basisList |> List.map basisName |> List.map (\x -> if x == "1" then "" else x)
        
        formatCoefficient v b =
            if (abs v > 0.000001) then (String.fromFloat v ++ b) else ""
    in
        List.map2 formatCoefficient values basisNames 
            |> List.filter ((/=) "")
            |> String.join " + "
            |> (\s -> if s == "" then "0" else s)    


{-| Convert list of coefficients to multivector |-}
fromList : List Float -> Maybe R3
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list , ( List.head <| List.drop 4 list , ( List.head <| List.drop 5 list , ( List.head <| List.drop 6 list , ( List.head <| List.drop 7 list )))))))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 , ( Just v4 , ( Just v5 , ( Just v6 , ( Just v7 )))))))) ->
            Just (R3 v0 v1 v2 v3 v4 v5 v6 v7)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients |-}
toList : R3 -> List Float
toList (R3 v0 v1 v2 v3 v4 v5 v6 v7) =
    [ v0, v1, v2, v3, v4, v5, v6, v7 ]



{-| Reverse the order of the basis blades. |-}
reverse : R3 -> R3
reverse (R3 a0 a1 a2 a3 a4 a5 a6 a7) =
    R3
        (a0)
        (a1)
        (a2)
        (a3)
        (-a4)
        (-a5)
        (-a6)
        (-a7)


{-| Poincare duality operator. |-}
dual : R3 -> R3
dual (R3 a0 a1 a2 a3 a4 a5 a6 a7) =
    R3
        (-a7)
        (-a6)
        (a5)
        (-a4)
        (a3)
        (-a2)
        (a1)
        (a0)


{-| Clifford Conjugation |-}
conjugate : R3 -> R3
conjugate (R3 a0 a1 a2 a3 a4 a5 a6 a7) =
    R3
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (-a4)
        (-a5)
        (-a6)
        (a7)


{-| Main involution |-}
involute : R3 -> R3
involute (R3 a0 a1 a2 a3 a4 a5 a6 a7) =
    R3
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (a4)
        (a5)
        (a6)
        (-a7)


{-| The geometric product. |-}
mul : R3 -> R3 -> R3
mul (R3 a0 a1 a2 a3 a4 a5 a6 a7) (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (b0 * a0 + b1 * a1 + b2 * a2 + b3 * a3 - b4 * a4 - b5 * a5 - b6 * a6 - b7 * a7)
        (b1 * a0 + b0 * a1 - b4 * a2 - b5 * a3 + b2 * a4 + b3 * a5 - b7 * a6 - b6 * a7)
        (b2 * a0 + b4 * a1 + b0 * a2 - b6 * a3 - b1 * a4 + b7 * a5 + b3 * a6 + b5 * a7)
        (b3 * a0 + b5 * a1 + b6 * a2 + b0 * a3 - b7 * a4 - b1 * a5 - b2 * a6 - b4 * a7)
        (b4 * a0 + b2 * a1 - b1 * a2 + b7 * a3 + b0 * a4 - b6 * a5 + b5 * a6 + b3 * a7)
        (b5 * a0 + b3 * a1 - b7 * a2 - b1 * a3 + b6 * a4 + b0 * a5 - b4 * a6 - b2 * a7)
        (b6 * a0 + b7 * a1 + b3 * a2 - b2 * a3 - b5 * a4 + b4 * a5 + b0 * a6 + b1 * a7)
        (b7 * a0 + b6 * a1 - b5 * a2 + b4 * a3 + b3 * a4 - b2 * a5 + b1 * a6 + b0 * a7)


{-| The outer product. (MEET) |-}
wedge : R3 -> R3 -> R3
wedge (R3 a0 a1 a2 a3 a4 a5 a6 a7) (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b0 * a3)
        (b4 * a0 + b2 * a1 - b1 * a2 + b0 * a4)
        (b5 * a0 + b3 * a1 - b1 * a3 + b0 * a5)
        (b6 * a0 + b3 * a2 - b2 * a3 + b0 * a6)
        (b7 * a0 + b6 * a1 - b5 * a2 + b4 * a3 + b3 * a4 - b2 * a5 + b1 * a6 + b0 * a7)


{-| The regressive product. (JOIN) |-}
vee : R3 -> R3 -> R3
vee (R3 a0 a1 a2 a3 a4 a5 a6 a7) (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (1 * (a7 * b7))
        (1 * (a6 * b7 + a7 * b6))
        (-1 * (a5 * -1 * b7 + a7 * b5 * -1))
        (1 * (a4 * b7 + a7 * b4))
        (1 * (a3 * b7 + a5 * -1 * b6 - a6 * b5 * -1 + a7 * b3))
        (-1 * (a2 * -1 * b7 + a4 * b6 - a6 * b4 + a7 * b2 * -1))
        (1 * (a1 * b7 + a4 * b5 * -1 - a5 * -1 * b4 + a7 * b1))
        (1 * (a0 * b7 + a1 * b6 - a2 * -1 * b5 * -1 + a3 * b4 + a4 * b3 - a5 * -1 * b2 * -1 + a6 * b1 + a7 * b0))


{-| The inner product. |-}
dot : R3 -> R3 -> R3
dot (R3 a0 a1 a2 a3 a4 a5 a6 a7) (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (b0 * a0 + b1 * a1 + b2 * a2 + b3 * a3 - b4 * a4 - b5 * a5 - b6 * a6 - b7 * a7)
        (b1 * a0 + b0 * a1 - b4 * a2 - b5 * a3 + b2 * a4 + b3 * a5 - b7 * a6 - b6 * a7)
        (b2 * a0 + b4 * a1 + b0 * a2 - b6 * a3 - b1 * a4 + b7 * a5 + b3 * a6 + b5 * a7)
        (b3 * a0 + b5 * a1 + b6 * a2 + b0 * a3 - b7 * a4 - b1 * a5 - b2 * a6 - b4 * a7)
        (b4 * a0 + b7 * a3 + b0 * a4 + b3 * a7)
        (b5 * a0 - b7 * a2 + b0 * a5 - b2 * a7)
        (b6 * a0 + b7 * a1 + b0 * a6 + b1 * a7)
        (b7 * a0 + b0 * a7)


{-| Multivector addition |-}
add : R3 -> R3 -> R3
add (R3 a0 a1 a2 a3 a4 a5 a6 a7) (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (a0 + b0)
        (a1 + b1)
        (a2 + b2)
        (a3 + b3)
        (a4 + b4)
        (a5 + b5)
        (a6 + b6)
        (a7 + b7)


{-| Multivector subtraction |-}
sub : R3 -> R3 -> R3
sub (R3 a0 a1 a2 a3 a4 a5 a6 a7) (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (a0 - b0)
        (a1 - b1)
        (a2 - b2)
        (a3 - b3)
        (a4 - b4)
        (a5 - b5)
        (a6 - b6)
        (a7 - b7)


{-| scalar/multivector multiplication |-}
smul : Float -> R3 -> R3
smul a (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (a * b0)
        (a * b1)
        (a * b2)
        (a * b3)
        (a * b4)
        (a * b5)
        (a * b6)
        (a * b7)


{-| multivector/scalar multiplication |-}
muls : R3 -> Float -> R3
muls (R3 a0 a1 a2 a3 a4 a5 a6 a7) b =
    R3
        (a0 * b)
        (a1 * b)
        (a2 * b)
        (a3 * b)
        (a4 * b)
        (a5 * b)
        (a6 * b)
        (a7 * b)


{-| scalar/multivector addition |-}
sadd : Float -> R3 -> R3
sadd a (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (a + b0)
        (b1)
        (b2)
        (b3)
        (b4)
        (b5)
        (b6)
        (b7)


{-| multivector/scalar addition |-}
adds : R3 -> Float -> R3
adds (R3 a0 a1 a2 a3 a4 a5 a6 a7) b =
    R3
        (a0 + b)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (a6)
        (a7)


{-| scalar/multivector subtraction |-}
ssub : Float -> R3 -> R3
ssub a (R3 b0 b1 b2 b3 b4 b5 b6 b7) =
    R3
        (a - b0)
        (-b1)
        (-b2)
        (-b3)
        (-b4)
        (-b5)
        (-b6)
        (-b7)


{-| multivector/scalar subtraction |-}
subs : R3 -> Float -> R3
subs (R3 a0 a1 a2 a3 a4 a5 a6 a7) b =
    R3
        (a0 - b)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (a6)
        (a7)


{-| Norm |-}
norm : R3 -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual |-}
inorm : R3 -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector |-}
normalized : R3 -> R3
normalized a =
    muls a (1 / norm a)


{-| Basis multivector |-}
scalar : R3
scalar =
    set Scalar 1 zero


{-| Basis multivector |-}
e1 : R3
e1 =
    set E1 1 zero


{-| Basis multivector |-}
e2 : R3
e2 =
    set E2 1 zero


{-| Basis multivector |-}
e3 : R3
e3 =
    set E3 1 zero


{-| Basis multivector |-}
e12 : R3
e12 =
    set E12 1 zero


{-| Basis multivector |-}
e13 : R3
e13 =
    set E13 1 zero


{-| Basis multivector |-}
e23 : R3
e23 =
    set E23 1 zero


{-| Basis multivector |-}
e123 : R3
e123 =
    set E123 1 zero
