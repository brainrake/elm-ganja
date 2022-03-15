module Ganja.Pga3d exposing (Pga3dBasis(..), basisList, basisCount, basisName, Pga3d(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e0, e1, e2, e3, e01, e02, e03, e12, e31, e23, e021, e013, e032, e123, e0123)
{-| Clifford Algebra: Pga3d

Generated with ganja.js written by enki.

# Basis
@docs Pga3dBasis, basisList, basisCount, basisName

# Multivector
@docs Pga3d, zero, get, set, new

# Basis multivectors
@docs  unitScalar, e0, e1, e2, e3, e01, e02, e03, e12, e31, e23, e021, e013, e032, e123, e0123

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
type Pga3dBasis =
    Scalar
    | E0
    | E1
    | E2
    | E3
    | E01
    | E02
    | E03
    | E12
    | E31
    | E23
    | E021
    | E013
    | E032
    | E123
    | E0123


{-| Basis list -}
basisList : List Pga3dBasis
basisList = 
    [ Scalar, E0, E1, E2, E3, E01, E02, E03, E12, E31, E23, E021, E013, E032, E123, E0123 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    16


{-| Basis name -}
basisName : Pga3dBasis -> String
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

        E3 -> 
            "e3"

        E01 -> 
            "e01"

        E02 -> 
            "e02"

        E03 -> 
            "e03"

        E12 -> 
            "e12"

        E31 -> 
            "e31"

        E23 -> 
            "e23"

        E021 -> 
            "e021"

        E013 -> 
            "e013"

        E032 -> 
            "e032"

        E123 -> 
            "e123"

        E0123 -> 
            "e0123"


{-| Multivector -}
type Pga3d =
    Pga3d Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float


{-| Zero value -}
zero : Pga3d
zero =
    Pga3d 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


{-| Get coefficient -}
get : Pga3dBasis -> Pga3d -> Float
get basis (Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15) =
    case basis of
        Scalar -> 
            v0

        E0 -> 
            v1

        E1 -> 
            v2

        E2 -> 
            v3

        E3 -> 
            v4

        E01 -> 
            v5

        E02 -> 
            v6

        E03 -> 
            v7

        E12 -> 
            v8

        E31 -> 
            v9

        E23 -> 
            v10

        E021 -> 
            v11

        E013 -> 
            v12

        E032 -> 
            v13

        E123 -> 
            v14

        E0123 -> 
            v15


{-| Update coefficient -}
set : Pga3dBasis -> Float -> Pga3d -> Pga3d
set basis value (Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15) =
    case basis of
        Scalar -> 
            Pga3d value v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E0 -> 
            Pga3d v0 value v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E1 -> 
            Pga3d v0 v1 value v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E2 -> 
            Pga3d v0 v1 v2 value v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E3 -> 
            Pga3d v0 v1 v2 v3 value v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E01 -> 
            Pga3d v0 v1 v2 v3 v4 value v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E02 -> 
            Pga3d v0 v1 v2 v3 v4 v5 value v7 v8 v9 v10 v11 v12 v13 v14 v15

        E03 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 value v8 v9 v10 v11 v12 v13 v14 v15

        E12 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 value v9 v10 v11 v12 v13 v14 v15

        E31 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 value v10 v11 v12 v13 v14 v15

        E23 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 value v11 v12 v13 v14 v15

        E021 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 value v12 v13 v14 v15

        E013 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 value v13 v14 v15

        E032 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 value v14 v15

        E123 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 value v15

        E0123 -> 
            Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 value


{-| Multivector with one coefficient -}
new : Float -> Pga3dBasis -> Pga3d
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : Pga3d -> String
toString a =
    let 
        values =
            toList a

        basisNames =
            basisList |> List.map basisName |> List.map (\x -> if x == "1" then "" else x)
        
        roundFloat x =
            toFloat (round (x * 1000000)) / 1000000

        formatCoefficient v b =
            if (abs v > 0.000001) then (String.fromFloat (roundFloat v) ++ b) else ""
    in
        List.map2 formatCoefficient values basisNames 
            |> List.filter ((/=) "")
            |> String.join " + "
            |> (\s -> if s == "" then "0" else s)    


{-| Convert list of coefficients to multivector -}
fromList : List Float -> Maybe Pga3d
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list , ( List.head <| List.drop 4 list , ( List.head <| List.drop 5 list , ( List.head <| List.drop 6 list , ( List.head <| List.drop 7 list , ( List.head <| List.drop 8 list , ( List.head <| List.drop 9 list , ( List.head <| List.drop 10 list , ( List.head <| List.drop 11 list , ( List.head <| List.drop 12 list , ( List.head <| List.drop 13 list , ( List.head <| List.drop 14 list , ( List.head <| List.drop 15 list )))))))))))))))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 , ( Just v4 , ( Just v5 , ( Just v6 , ( Just v7 , ( Just v8 , ( Just v9 , ( Just v10 , ( Just v11 , ( Just v12 , ( Just v13 , ( Just v14 , ( Just v15 )))))))))))))))) ->
            Just (Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : Pga3d -> List Float
toList (Pga3d v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15) =
    [ v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15 ]



{-| Reverse the order of the basis blades. -}
reverse : Pga3d -> Pga3d
reverse (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Pga3d
        (a0)
        (a1)
        (a2)
        (a3)
        (a4)
        (-a5)
        (-a6)
        (-a7)
        (-a8)
        (-a9)
        (-a10)
        (-a11)
        (-a12)
        (-a13)
        (-a14)
        (a15)


{-| Poincare duality operator. -}
dual : Pga3d -> Pga3d
dual (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Pga3d
        (a15)
        (a14)
        (a13)
        (a12)
        (a11)
        (a10)
        (a9)
        (a8)
        (a7)
        (a6)
        (a5)
        (a4)
        (a3)
        (a2)
        (a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : Pga3d -> Pga3d
conjugate (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Pga3d
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (-a4)
        (-a5)
        (-a6)
        (-a7)
        (-a8)
        (-a9)
        (-a10)
        (a11)
        (a12)
        (a13)
        (a14)
        (a15)


{-| Main involution -}
involute : Pga3d -> Pga3d
involute (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Pga3d
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (-a4)
        (a5)
        (a6)
        (a7)
        (a8)
        (a9)
        (a10)
        (-a11)
        (-a12)
        (-a13)
        (-a14)
        (a15)


{-| The geometric product. -}
mul : Pga3d -> Pga3d -> Pga3d
mul (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (b0 * a0 + b2 * a2 + b3 * a3 + b4 * a4 - b8 * a8 - b9 * a9 - b10 * a10 - b14 * a14)
        (b1 * a0 + b0 * a1 - b5 * a2 - b6 * a3 - b7 * a4 + b2 * a5 + b3 * a6 + b4 * a7 + b11 * a8 + b12 * a9 + b13 * a10 + b8 * a11 + b9 * a12 + b10 * a13 + b15 * a14 - b14 * a15)
        (b2 * a0 + b0 * a2 - b8 * a3 + b9 * a4 + b3 * a8 - b4 * a9 - b14 * a10 - b10 * a14)
        (b3 * a0 + b8 * a2 + b0 * a3 - b10 * a4 - b2 * a8 - b14 * a9 + b4 * a10 - b9 * a14)
        (b4 * a0 - b9 * a2 + b10 * a3 + b0 * a4 - b14 * a8 + b2 * a9 - b3 * a10 - b8 * a14)
        (b5 * a0 + b2 * a1 - b1 * a2 - b11 * a3 + b12 * a4 + b0 * a5 - b8 * a6 + b9 * a7 + b6 * a8 - b7 * a9 - b15 * a10 - b3 * a11 + b4 * a12 + b14 * a13 - b13 * a14 - b10 * a15)
        (b6 * a0 + b3 * a1 + b11 * a2 - b1 * a3 - b13 * a4 + b8 * a5 + b0 * a6 - b10 * a7 - b5 * a8 - b15 * a9 + b7 * a10 + b2 * a11 + b14 * a12 - b4 * a13 - b12 * a14 - b9 * a15)
        (b7 * a0 + b4 * a1 - b12 * a2 + b13 * a3 - b1 * a4 - b9 * a5 + b10 * a6 + b0 * a7 - b15 * a8 + b5 * a9 - b6 * a10 + b14 * a11 - b2 * a12 + b3 * a13 - b11 * a14 - b8 * a15)
        (b8 * a0 + b3 * a2 - b2 * a3 + b14 * a4 + b0 * a8 + b10 * a9 - b9 * a10 + b4 * a14)
        (b9 * a0 - b4 * a2 + b14 * a3 + b2 * a4 - b10 * a8 + b0 * a9 + b8 * a10 + b3 * a14)
        (b10 * a0 + b14 * a2 + b4 * a3 - b3 * a4 + b9 * a8 - b8 * a9 + b0 * a10 + b2 * a14)
        (b11 * a0 - b8 * a1 + b6 * a2 - b5 * a3 + b15 * a4 - b3 * a5 + b2 * a6 - b14 * a7 - b1 * a8 + b13 * a9 - b12 * a10 + b0 * a11 + b10 * a12 - b9 * a13 + b7 * a14 - b4 * a15)
        (b12 * a0 - b9 * a1 - b7 * a2 + b15 * a3 + b5 * a4 + b4 * a5 - b14 * a6 - b2 * a7 - b13 * a8 - b1 * a9 + b11 * a10 - b10 * a11 + b0 * a12 + b8 * a13 + b6 * a14 - b3 * a15)
        (b13 * a0 - b10 * a1 + b15 * a2 + b7 * a3 - b6 * a4 - b14 * a5 - b4 * a6 + b3 * a7 + b12 * a8 - b11 * a9 - b1 * a10 + b9 * a11 - b8 * a12 + b0 * a13 + b5 * a14 - b2 * a15)
        (b14 * a0 + b10 * a2 + b9 * a3 + b8 * a4 + b4 * a8 + b3 * a9 + b2 * a10 + b0 * a14)
        (b15 * a0 + b14 * a1 + b13 * a2 + b12 * a3 + b11 * a4 + b10 * a5 + b9 * a6 + b8 * a7 + b7 * a8 + b6 * a9 + b5 * a10 - b4 * a11 - b3 * a12 - b2 * a13 - b1 * a14 + b0 * a15)


{-| The outer product. (MEET) -}
wedge : Pga3d -> Pga3d -> Pga3d
wedge (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b0 * a3)
        (b4 * a0 + b0 * a4)
        (b5 * a0 + b2 * a1 - b1 * a2 + b0 * a5)
        (b6 * a0 + b3 * a1 - b1 * a3 + b0 * a6)
        (b7 * a0 + b4 * a1 - b1 * a4 + b0 * a7)
        (b8 * a0 + b3 * a2 - b2 * a3 + b0 * a8)
        (b9 * a0 - b4 * a2 + b2 * a4 + b0 * a9)
        (b10 * a0 + b4 * a3 - b3 * a4 + b0 * a10)
        (b11 * a0 - b8 * a1 + b6 * a2 - b5 * a3 - b3 * a5 + b2 * a6 - b1 * a8 + b0 * a11)
        (b12 * a0 - b9 * a1 - b7 * a2 + b5 * a4 + b4 * a5 - b2 * a7 - b1 * a9 + b0 * a12)
        (b13 * a0 - b10 * a1 + b7 * a3 - b6 * a4 - b4 * a6 + b3 * a7 - b1 * a10 + b0 * a13)
        (b14 * a0 + b10 * a2 + b9 * a3 + b8 * a4 + b4 * a8 + b3 * a9 + b2 * a10 + b0 * a14)
        (b15 * a0 + b14 * a1 + b13 * a2 + b12 * a3 + b11 * a4 + b10 * a5 + b9 * a6 + b8 * a7 + b7 * a8 + b6 * a9 + b5 * a10 - b4 * a11 - b3 * a12 - b2 * a13 - b1 * a14 + b0 * a15)


{-| The regressive product. (JOIN) -}
vee : Pga3d -> Pga3d -> Pga3d
vee (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (1 * (a0 * b15 + a1 * b14 * -1 + a2 * b13 * -1 + a3 * b12 * -1 + a4 * b11 * -1 + a5 * b10 + a6 * b9 + a7 * b8 + a8 * b7 + a9 * b6 + a10 * b5 - a11 * -1 * b4 - a12 * -1 * b3 - a13 * -1 * b2 - a14 * -1 * b1 + a15 * b0))
        (1 * (a1 * b15 + a5 * b13 * -1 + a6 * b12 * -1 + a7 * b11 * -1 + a11 * -1 * b7 + a12 * -1 * b6 + a13 * -1 * b5 + a15 * b1))
        (1 * (a2 * b15 - a5 * b14 * -1 + a8 * b12 * -1 - a9 * b11 * -1 - a11 * -1 * b9 + a12 * -1 * b8 - a14 * -1 * b5 + a15 * b2))
        (1 * (a3 * b15 - a6 * b14 * -1 - a8 * b13 * -1 + a10 * b11 * -1 + a11 * -1 * b10 - a13 * -1 * b8 - a14 * -1 * b6 + a15 * b3))
        (1 * (a4 * b15 - a7 * b14 * -1 + a9 * b13 * -1 - a10 * b12 * -1 - a12 * -1 * b10 + a13 * -1 * b9 - a14 * -1 * b7 + a15 * b4))
        (1 * (a5 * b15 + a11 * -1 * b12 * -1 - a12 * -1 * b11 * -1 + a15 * b5))
        (1 * (a6 * b15 - a11 * -1 * b13 * -1 + a13 * -1 * b11 * -1 + a15 * b6))
        (1 * (a7 * b15 + a12 * -1 * b13 * -1 - a13 * -1 * b12 * -1 + a15 * b7))
        (1 * (a8 * b15 + a11 * -1 * b14 * -1 - a14 * -1 * b11 * -1 + a15 * b8))
        (1 * (a9 * b15 + a12 * -1 * b14 * -1 - a14 * -1 * b12 * -1 + a15 * b9))
        (1 * (a10 * b15 + a13 * -1 * b14 * -1 - a14 * -1 * b13 * -1 + a15 * b10))
        (-1 * (a11 * -1 * b15 + a15 * b11 * -1))
        (-1 * (a12 * -1 * b15 + a15 * b12 * -1))
        (-1 * (a13 * -1 * b15 + a15 * b13 * -1))
        (-1 * (a14 * -1 * b15 + a15 * b14 * -1))
        (1 * (a15 * b15))


{-| The inner product. -}
dot : Pga3d -> Pga3d -> Pga3d
dot (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (b0 * a0 + b2 * a2 + b3 * a3 + b4 * a4 - b8 * a8 - b9 * a9 - b10 * a10 - b14 * a14)
        (b1 * a0 + b0 * a1 - b5 * a2 - b6 * a3 - b7 * a4 + b2 * a5 + b3 * a6 + b4 * a7 + b11 * a8 + b12 * a9 + b13 * a10 + b8 * a11 + b9 * a12 + b10 * a13 + b15 * a14 - b14 * a15)
        (b2 * a0 + b0 * a2 - b8 * a3 + b9 * a4 + b3 * a8 - b4 * a9 - b14 * a10 - b10 * a14)
        (b3 * a0 + b8 * a2 + b0 * a3 - b10 * a4 - b2 * a8 - b14 * a9 + b4 * a10 - b9 * a14)
        (b4 * a0 - b9 * a2 + b10 * a3 + b0 * a4 - b14 * a8 + b2 * a9 - b3 * a10 - b8 * a14)
        (b5 * a0 - b11 * a3 + b12 * a4 + b0 * a5 - b15 * a10 - b3 * a11 + b4 * a12 - b10 * a15)
        (b6 * a0 + b11 * a2 - b13 * a4 + b0 * a6 - b15 * a9 + b2 * a11 - b4 * a13 - b9 * a15)
        (b7 * a0 - b12 * a2 + b13 * a3 + b0 * a7 - b15 * a8 - b2 * a12 + b3 * a13 - b8 * a15)
        (b8 * a0 + b14 * a4 + b0 * a8 + b4 * a14)
        (b9 * a0 + b14 * a3 + b0 * a9 + b3 * a14)
        (b10 * a0 + b14 * a2 + b0 * a10 + b2 * a14)
        (b11 * a0 + b15 * a4 + b0 * a11 - b4 * a15)
        (b12 * a0 + b15 * a3 + b0 * a12 - b3 * a15)
        (b13 * a0 + b15 * a2 + b0 * a13 - b2 * a15)
        (b14 * a0 + b0 * a14)
        (b15 * a0 + b0 * a15)


{-| Multivector addition -}
add : Pga3d -> Pga3d -> Pga3d
add (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (a0 + b0)
        (a1 + b1)
        (a2 + b2)
        (a3 + b3)
        (a4 + b4)
        (a5 + b5)
        (a6 + b6)
        (a7 + b7)
        (a8 + b8)
        (a9 + b9)
        (a10 + b10)
        (a11 + b11)
        (a12 + b12)
        (a13 + b13)
        (a14 + b14)
        (a15 + b15)


{-| Multivector subtraction -}
sub : Pga3d -> Pga3d -> Pga3d
sub (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (a0 - b0)
        (a1 - b1)
        (a2 - b2)
        (a3 - b3)
        (a4 - b4)
        (a5 - b5)
        (a6 - b6)
        (a7 - b7)
        (a8 - b8)
        (a9 - b9)
        (a10 - b10)
        (a11 - b11)
        (a12 - b12)
        (a13 - b13)
        (a14 - b14)
        (a15 - b15)


{-| scalar/multivector multiplication -}
smul : Float -> Pga3d -> Pga3d
smul a (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (a * b0)
        (a * b1)
        (a * b2)
        (a * b3)
        (a * b4)
        (a * b5)
        (a * b6)
        (a * b7)
        (a * b8)
        (a * b9)
        (a * b10)
        (a * b11)
        (a * b12)
        (a * b13)
        (a * b14)
        (a * b15)


{-| multivector/scalar multiplication -}
muls : Pga3d -> Float -> Pga3d
muls (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) b =
    Pga3d
        (a0 * b)
        (a1 * b)
        (a2 * b)
        (a3 * b)
        (a4 * b)
        (a5 * b)
        (a6 * b)
        (a7 * b)
        (a8 * b)
        (a9 * b)
        (a10 * b)
        (a11 * b)
        (a12 * b)
        (a13 * b)
        (a14 * b)
        (a15 * b)


{-| scalar/multivector addition -}
sadd : Float -> Pga3d -> Pga3d
sadd a (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (a + b0)
        (b1)
        (b2)
        (b3)
        (b4)
        (b5)
        (b6)
        (b7)
        (b8)
        (b9)
        (b10)
        (b11)
        (b12)
        (b13)
        (b14)
        (b15)


{-| multivector/scalar addition -}
adds : Pga3d -> Float -> Pga3d
adds (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) b =
    Pga3d
        (a0 + b)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (a6)
        (a7)
        (a8)
        (a9)
        (a10)
        (a11)
        (a12)
        (a13)
        (a14)
        (a15)


{-| scalar/multivector subtraction -}
ssub : Float -> Pga3d -> Pga3d
ssub a (Pga3d b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Pga3d
        (a - b0)
        (-b1)
        (-b2)
        (-b3)
        (-b4)
        (-b5)
        (-b6)
        (-b7)
        (-b8)
        (-b9)
        (-b10)
        (-b11)
        (-b12)
        (-b13)
        (-b14)
        (-b15)


{-| multivector/scalar subtraction -}
subs : Pga3d -> Float -> Pga3d
subs (Pga3d a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) b =
    Pga3d
        (a0 - b)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (a6)
        (a7)
        (a8)
        (a9)
        (a10)
        (a11)
        (a12)
        (a13)
        (a14)
        (a15)


{-| Norm -}
norm : Pga3d -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : Pga3d -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : Pga3d -> Pga3d
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : Pga3d
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e0 : Pga3d
e0 =
    set E0 1 zero


{-| Basis multivector -}
e1 : Pga3d
e1 =
    set E1 1 zero


{-| Basis multivector -}
e2 : Pga3d
e2 =
    set E2 1 zero


{-| Basis multivector -}
e3 : Pga3d
e3 =
    set E3 1 zero


{-| Basis multivector -}
e01 : Pga3d
e01 =
    set E01 1 zero


{-| Basis multivector -}
e02 : Pga3d
e02 =
    set E02 1 zero


{-| Basis multivector -}
e03 : Pga3d
e03 =
    set E03 1 zero


{-| Basis multivector -}
e12 : Pga3d
e12 =
    set E12 1 zero


{-| Basis multivector -}
e31 : Pga3d
e31 =
    set E31 1 zero


{-| Basis multivector -}
e23 : Pga3d
e23 =
    set E23 1 zero


{-| Basis multivector -}
e021 : Pga3d
e021 =
    set E021 1 zero


{-| Basis multivector -}
e013 : Pga3d
e013 =
    set E013 1 zero


{-| Basis multivector -}
e032 : Pga3d
e032 =
    set E032 1 zero


{-| Basis multivector -}
e123 : Pga3d
e123 =
    set E123 1 zero


{-| Basis multivector -}
e0123 : Pga3d
e0123 =
    set E0123 1 zero
