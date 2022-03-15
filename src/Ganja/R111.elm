module Ganja.R111 exposing (R111Basis(..), basisList, basisCount, basisName, R111(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e0, e1, e2, e01, e02, e12, e012)
{-| Clifford Algebra: R111

Generated with ganja.js written by enki.

# Basis
@docs R111Basis, basisList, basisCount, basisName

# Multivector
@docs R111, zero, get, set, new

# Basis multivectors
@docs  unitScalar, e0, e1, e2, e01, e02, e12, e012

# Conversion
@docs toString, fromList, toList

# Unary Operators
@docs reverse, dual, conjugate, involute

# Binary Operators
@docs mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs

# Norm
@docs norm, inorm, normalized
-}

{-| Basis type -}
type R111Basis =
    Scalar
    | E0
    | E1
    | E2
    | E01
    | E02
    | E12
    | E012


{-| Basis list -}
basisList : List R111Basis
basisList = 
    [ Scalar, E0, E1, E2, E01, E02, E12, E012 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    8


{-| Basis name -}
basisName : R111Basis -> String
basisName basis =
    case basis of
        Scalar -> 
            "1"

        E0 -> 
            "e0"

        E1 -> 
            "e1"

        E2 -> 
            "e2"

        E01 -> 
            "e01"

        E02 -> 
            "e02"

        E12 -> 
            "e12"

        E012 -> 
            "e012"


{-| Multivector -}
type R111 =
    R111 Float Float Float Float Float Float Float Float


{-| Zero value -}
zero : R111
zero =
    R111 0 0 0 0 0 0 0 0


{-| Get coefficient -}
get : R111Basis -> R111 -> Float
get basis (R111 v0 v1 v2 v3 v4 v5 v6 v7) =
    case basis of
        Scalar -> 
            v0

        E0 -> 
            v1

        E1 -> 
            v2

        E2 -> 
            v3

        E01 -> 
            v4

        E02 -> 
            v5

        E12 -> 
            v6

        E012 -> 
            v7


{-| Update coefficient -}
set : R111Basis -> Float -> R111 -> R111
set basis value (R111 v0 v1 v2 v3 v4 v5 v6 v7) =
    case basis of
        Scalar -> 
            R111 value v1 v2 v3 v4 v5 v6 v7

        E0 -> 
            R111 v0 value v2 v3 v4 v5 v6 v7

        E1 -> 
            R111 v0 v1 value v3 v4 v5 v6 v7

        E2 -> 
            R111 v0 v1 v2 value v4 v5 v6 v7

        E01 -> 
            R111 v0 v1 v2 v3 value v5 v6 v7

        E02 -> 
            R111 v0 v1 v2 v3 v4 value v6 v7

        E12 -> 
            R111 v0 v1 v2 v3 v4 v5 value v7

        E012 -> 
            R111 v0 v1 v2 v3 v4 v5 v6 value


{-| Multivector with one coefficient -}
new : Float -> R111Basis -> R111
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : R111 -> String
toString a =
    let 
        values =
            toList a

        basisNames =
            basisList |> List.map basisName |> List.map (\x -> if x == "1" then "" else x)
        
        roundFloat x =
            toFloat (round (x * 10000000)) / 10000000

        formatCoefficient v b =
            if (abs v > 0.000001) then (String.fromFloat (roundFloat v) ++ b) else ""
    in
        List.map2 formatCoefficient values basisNames 
            |> List.filter ((/=) "")
            |> String.join " + "
            |> (\s -> if s == "" then "0" else s)    


{-| Convert list of coefficients to multivector -}
fromList : List Float -> Maybe R111
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list , ( List.head <| List.drop 4 list , ( List.head <| List.drop 5 list , ( List.head <| List.drop 6 list , ( List.head <| List.drop 7 list )))))))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 , ( Just v4 , ( Just v5 , ( Just v6 , ( Just v7 )))))))) ->
            Just (R111 v0 v1 v2 v3 v4 v5 v6 v7)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : R111 -> List Float
toList (R111 v0 v1 v2 v3 v4 v5 v6 v7) =
    [ v0, v1, v2, v3, v4, v5, v6, v7 ]



{-| Reverse the order of the basis blades. -}
reverse : R111 -> R111
reverse (R111 a0 a1 a2 a3 a4 a5 a6 a7) =
    R111
        (a0)
        (a1)
        (a2)
        (a3)
        (-a4)
        (-a5)
        (-a6)
        (-a7)


{-| Poincare duality operator. -}
dual : R111 -> R111
dual (R111 a0 a1 a2 a3 a4 a5 a6 a7) =
    R111
        (a7)
        (a6)
        (a5)
        (a4)
        (a3)
        (a2)
        (a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : R111 -> R111
conjugate (R111 a0 a1 a2 a3 a4 a5 a6 a7) =
    R111
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (-a4)
        (-a5)
        (-a6)
        (a7)


{-| Main involution -}
involute : R111 -> R111
involute (R111 a0 a1 a2 a3 a4 a5 a6 a7) =
    R111
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (a4)
        (a5)
        (a6)
        (-a7)


{-| The geometric product. -}
mul : R111 -> R111 -> R111
mul (R111 a0 a1 a2 a3 a4 a5 a6 a7) (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (b0 * a0 + b2 * a2 - b3 * a3 + b6 * a6)
        (b1 * a0 + b0 * a1 - b4 * a2 + b5 * a3 + b2 * a4 - b3 * a5 + b7 * a6 + b6 * a7)
        (b2 * a0 + b0 * a2 + b6 * a3 - b3 * a6)
        (b3 * a0 + b6 * a2 + b0 * a3 - b2 * a6)
        (b4 * a0 + b2 * a1 - b1 * a2 - b7 * a3 + b0 * a4 + b6 * a5 - b5 * a6 - b3 * a7)
        (b5 * a0 + b3 * a1 - b7 * a2 - b1 * a3 + b6 * a4 + b0 * a5 - b4 * a6 - b2 * a7)
        (b6 * a0 + b3 * a2 - b2 * a3 + b0 * a6)
        (b7 * a0 + b6 * a1 - b5 * a2 + b4 * a3 + b3 * a4 - b2 * a5 + b1 * a6 + b0 * a7)


{-| The outer product. (MEET) -}
wedge : R111 -> R111 -> R111
wedge (R111 a0 a1 a2 a3 a4 a5 a6 a7) (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b0 * a3)
        (b4 * a0 + b2 * a1 - b1 * a2 + b0 * a4)
        (b5 * a0 + b3 * a1 - b1 * a3 + b0 * a5)
        (b6 * a0 + b3 * a2 - b2 * a3 + b0 * a6)
        (b7 * a0 + b6 * a1 - b5 * a2 + b4 * a3 + b3 * a4 - b2 * a5 + b1 * a6 + b0 * a7)


{-| The regressive product. (JOIN) -}
vee : R111 -> R111 -> R111
vee (R111 a0 a1 a2 a3 a4 a5 a6 a7) (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (1 * (a0 * b7 + a1 * b6 - a2 * -1 * b5 * -1 + a3 * b4 + a4 * b3 - a5 * -1 * b2 * -1 + a6 * b1 + a7 * b0))
        (1 * (a1 * b7 + a4 * b5 * -1 - a5 * -1 * b4 + a7 * b1))
        (-1 * (a2 * -1 * b7 + a4 * b6 - a6 * b4 + a7 * b2 * -1))
        (1 * (a3 * b7 + a5 * -1 * b6 - a6 * b5 * -1 + a7 * b3))
        (1 * (a4 * b7 + a7 * b4))
        (-1 * (a5 * -1 * b7 + a7 * b5 * -1))
        (1 * (a6 * b7 + a7 * b6))
        (1 * (a7 * b7))


{-| The inner product. -}
dot : R111 -> R111 -> R111
dot (R111 a0 a1 a2 a3 a4 a5 a6 a7) (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (b0 * a0 + b2 * a2 - b3 * a3 + b6 * a6)
        (b1 * a0 + b0 * a1 - b4 * a2 + b5 * a3 + b2 * a4 - b3 * a5 + b7 * a6 + b6 * a7)
        (b2 * a0 + b0 * a2 + b6 * a3 - b3 * a6)
        (b3 * a0 + b6 * a2 + b0 * a3 - b2 * a6)
        (b4 * a0 - b7 * a3 + b0 * a4 - b3 * a7)
        (b5 * a0 - b7 * a2 + b0 * a5 - b2 * a7)
        (b6 * a0 + b0 * a6)
        (b7 * a0 + b0 * a7)


{-| Multivector addition -}
add : R111 -> R111 -> R111
add (R111 a0 a1 a2 a3 a4 a5 a6 a7) (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (a0 + b0)
        (a1 + b1)
        (a2 + b2)
        (a3 + b3)
        (a4 + b4)
        (a5 + b5)
        (a6 + b6)
        (a7 + b7)


{-| Multivector subtraction -}
sub : R111 -> R111 -> R111
sub (R111 a0 a1 a2 a3 a4 a5 a6 a7) (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (a0 - b0)
        (a1 - b1)
        (a2 - b2)
        (a3 - b3)
        (a4 - b4)
        (a5 - b5)
        (a6 - b6)
        (a7 - b7)


{-| scalar/multivector multiplication -}
smul : Float -> R111 -> R111
smul a (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (a * b0)
        (a * b1)
        (a * b2)
        (a * b3)
        (a * b4)
        (a * b5)
        (a * b6)
        (a * b7)


{-| multivector/scalar multiplication -}
muls : R111 -> Float -> R111
muls (R111 a0 a1 a2 a3 a4 a5 a6 a7) b =
    R111
        (a0 * b)
        (a1 * b)
        (a2 * b)
        (a3 * b)
        (a4 * b)
        (a5 * b)
        (a6 * b)
        (a7 * b)


{-| scalar/multivector addition -}
sadd : Float -> R111 -> R111
sadd a (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (a + b0)
        (b1)
        (b2)
        (b3)
        (b4)
        (b5)
        (b6)
        (b7)


{-| multivector/scalar addition -}
adds : R111 -> Float -> R111
adds (R111 a0 a1 a2 a3 a4 a5 a6 a7) b =
    R111
        (a0 + b)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (a6)
        (a7)


{-| scalar/multivector subtraction -}
ssub : Float -> R111 -> R111
ssub a (R111 b0 b1 b2 b3 b4 b5 b6 b7) =
    R111
        (a - b0)
        (-b1)
        (-b2)
        (-b3)
        (-b4)
        (-b5)
        (-b6)
        (-b7)


{-| multivector/scalar subtraction -}
subs : R111 -> Float -> R111
subs (R111 a0 a1 a2 a3 a4 a5 a6 a7) b =
    R111
        (a0 - b)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (a6)
        (a7)


{-| Norm -}
norm : R111 -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : R111 -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : R111 -> R111
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : R111
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e0 : R111
e0 =
    set E0 1 zero


{-| Basis multivector -}
e1 : R111
e1 =
    set E1 1 zero


{-| Basis multivector -}
e2 : R111
e2 =
    set E2 1 zero


{-| Basis multivector -}
e01 : R111
e01 =
    set E01 1 zero


{-| Basis multivector -}
e02 : R111
e02 =
    set E02 1 zero


{-| Basis multivector -}
e12 : R111
e12 =
    set E12 1 zero


{-| Basis multivector -}
e012 : R111
e012 =
    set E012 1 zero
