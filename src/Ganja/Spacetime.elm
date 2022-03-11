module Ganja.Spacetime exposing (SpacetimeBasis(..), basisList, basisCount, basisName, Spacetime(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized)
{-| Clifford Algebra: Spacetime
Generated with ganja.js written by enki.

# Basis
@docs SpacetimeBasis, basisList, basisCount, basisName

# Multivector
@docs Spacetime, zero, get, set, new

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
type SpacetimeBasis =
    Scalar
    | E1
    | E2
    | E3
    | E4
    | E12
    | E13
    | E14
    | E23
    | E24
    | E34
    | E123
    | E124
    | E134
    | E234
    | E1234


{-| Basis list -}
basisList : List SpacetimeBasis
basisList = 
    [ Scalar, E1, E2, E3, E4, E12, E13, E14, E23, E24, E34, E123, E124, E134, E234, E1234 ]


{-| Number of coefficients |-}
basisCount : Int
basisCount = 
    16


{-| Basis name |-}
basisName : SpacetimeBasis -> String
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

        E4 -> 
            "e4"

        E12 -> 
            "e12"

        E13 -> 
            "e13"

        E14 -> 
            "e14"

        E23 -> 
            "e23"

        E24 -> 
            "e24"

        E34 -> 
            "e34"

        E123 -> 
            "e123"

        E124 -> 
            "e124"

        E134 -> 
            "e134"

        E234 -> 
            "e234"

        E1234 -> 
            "e1234"


{-| Multivector |-}
type Spacetime =
    Spacetime Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float


{-| Zero value |-}
zero : Spacetime
zero =
    Spacetime 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


{-| Get coefficient |-}
get : SpacetimeBasis -> Spacetime -> Float
get basis (Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15) =
    case basis of
        Scalar -> 
            v0

        E1 -> 
            v1

        E2 -> 
            v2

        E3 -> 
            v3

        E4 -> 
            v4

        E12 -> 
            v5

        E13 -> 
            v6

        E14 -> 
            v7

        E23 -> 
            v8

        E24 -> 
            v9

        E34 -> 
            v10

        E123 -> 
            v11

        E124 -> 
            v12

        E134 -> 
            v13

        E234 -> 
            v14

        E1234 -> 
            v15


{-| Update coefficient |-}
set : SpacetimeBasis -> Float -> Spacetime -> Spacetime
set basis value (Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15) =
    case basis of
        Scalar -> 
            Spacetime value v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E1 -> 
            Spacetime v0 value v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E2 -> 
            Spacetime v0 v1 value v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E3 -> 
            Spacetime v0 v1 v2 value v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E4 -> 
            Spacetime v0 v1 v2 v3 value v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E12 -> 
            Spacetime v0 v1 v2 v3 v4 value v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

        E13 -> 
            Spacetime v0 v1 v2 v3 v4 v5 value v7 v8 v9 v10 v11 v12 v13 v14 v15

        E14 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 value v8 v9 v10 v11 v12 v13 v14 v15

        E23 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 value v9 v10 v11 v12 v13 v14 v15

        E24 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 value v10 v11 v12 v13 v14 v15

        E34 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 value v11 v12 v13 v14 v15

        E123 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 value v12 v13 v14 v15

        E124 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 value v13 v14 v15

        E134 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 value v14 v15

        E234 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 value v15

        E1234 -> 
            Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 value


{-| Multivector with one coefficient |-}
new : Float -> SpacetimeBasis -> Spacetime
new value basis =
    set basis value zero


{-| Convert multivector to string |-}
toString : Spacetime -> String
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
fromList : List Float -> Maybe Spacetime
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list , ( List.head <| List.drop 4 list , ( List.head <| List.drop 5 list , ( List.head <| List.drop 6 list , ( List.head <| List.drop 7 list , ( List.head <| List.drop 8 list , ( List.head <| List.drop 9 list , ( List.head <| List.drop 10 list , ( List.head <| List.drop 11 list , ( List.head <| List.drop 12 list , ( List.head <| List.drop 13 list , ( List.head <| List.drop 14 list , ( List.head <| List.drop 15 list )))))))))))))))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 , ( Just v4 , ( Just v5 , ( Just v6 , ( Just v7 , ( Just v8 , ( Just v9 , ( Just v10 , ( Just v11 , ( Just v12 , ( Just v13 , ( Just v14 , ( Just v15 )))))))))))))))) ->
            Just (Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients |-}
toList : Spacetime -> List Float
toList (Spacetime v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15) =
    [ v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15 ]



{-| Reverse the order of the basis blades. |-}
reverse : Spacetime -> Spacetime
reverse (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Spacetime
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


{-| Poincare duality operator. |-}
dual : Spacetime -> Spacetime
dual (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Spacetime
        (-a15)
        (a14)
        (-a13)
        (a12)
        (a11)
        (a10)
        (-a9)
        (-a8)
        (a7)
        (a6)
        (-a5)
        (-a4)
        (-a3)
        (a2)
        (-a1)
        (a0)


{-| Clifford Conjugation |-}
conjugate : Spacetime -> Spacetime
conjugate (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Spacetime
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


{-| Main involution |-}
involute : Spacetime -> Spacetime
involute (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) =
    Spacetime
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


{-| The geometric product. |-}
mul : Spacetime -> Spacetime -> Spacetime
mul (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
        (b0 * a0 + b1 * a1 + b2 * a2 + b3 * a3 - b4 * a4 - b5 * a5 - b6 * a6 + b7 * a7 - b8 * a8 + b9 * a9 + b10 * a10 - b11 * a11 + b12 * a12 + b13 * a13 + b14 * a14 - b15 * a15)
        (b1 * a0 + b0 * a1 - b5 * a2 - b6 * a3 + b7 * a4 + b2 * a5 + b3 * a6 - b4 * a7 - b11 * a8 + b12 * a9 + b13 * a10 - b8 * a11 + b9 * a12 + b10 * a13 - b15 * a14 + b14 * a15)
        (b2 * a0 + b5 * a1 + b0 * a2 - b8 * a3 + b9 * a4 - b1 * a5 + b11 * a6 - b12 * a7 + b3 * a8 - b4 * a9 + b14 * a10 + b6 * a11 - b7 * a12 + b15 * a13 + b10 * a14 - b13 * a15)
        (b3 * a0 + b6 * a1 + b8 * a2 + b0 * a3 + b10 * a4 - b11 * a5 - b1 * a6 - b13 * a7 - b2 * a8 - b14 * a9 - b4 * a10 - b5 * a11 - b15 * a12 - b7 * a13 - b9 * a14 + b12 * a15)
        (b4 * a0 + b7 * a1 + b9 * a2 + b10 * a3 + b0 * a4 - b12 * a5 - b13 * a6 - b1 * a7 - b14 * a8 - b2 * a9 - b3 * a10 - b15 * a11 - b5 * a12 - b6 * a13 - b8 * a14 + b11 * a15)
        (b5 * a0 + b2 * a1 - b1 * a2 + b11 * a3 - b12 * a4 + b0 * a5 - b8 * a6 + b9 * a7 + b6 * a8 - b7 * a9 + b15 * a10 + b3 * a11 - b4 * a12 + b14 * a13 - b13 * a14 + b10 * a15)
        (b6 * a0 + b3 * a1 - b11 * a2 - b1 * a3 - b13 * a4 + b8 * a5 + b0 * a6 + b10 * a7 - b5 * a8 - b15 * a9 - b7 * a10 - b2 * a11 - b14 * a12 - b4 * a13 + b12 * a14 - b9 * a15)
        (b7 * a0 + b4 * a1 - b12 * a2 - b13 * a3 - b1 * a4 + b9 * a5 + b10 * a6 + b0 * a7 - b15 * a8 - b5 * a9 - b6 * a10 - b14 * a11 - b2 * a12 - b3 * a13 + b11 * a14 - b8 * a15)
        (b8 * a0 + b11 * a1 + b3 * a2 - b2 * a3 - b14 * a4 - b6 * a5 + b5 * a6 + b15 * a7 + b0 * a8 + b10 * a9 - b9 * a10 + b1 * a11 + b13 * a12 - b12 * a13 - b4 * a14 + b7 * a15)
        (b9 * a0 + b12 * a1 + b4 * a2 - b14 * a3 - b2 * a4 - b7 * a5 + b15 * a6 + b5 * a7 + b10 * a8 + b0 * a9 - b8 * a10 + b13 * a11 + b1 * a12 - b11 * a13 - b3 * a14 + b6 * a15)
        (b10 * a0 + b13 * a1 + b14 * a2 + b4 * a3 - b3 * a4 - b15 * a5 - b7 * a6 + b6 * a7 - b9 * a8 + b8 * a9 + b0 * a10 - b12 * a11 + b11 * a12 + b1 * a13 + b2 * a14 - b5 * a15)
        (b11 * a0 + b8 * a1 - b6 * a2 + b5 * a3 + b15 * a4 + b3 * a5 - b2 * a6 - b14 * a7 + b1 * a8 + b13 * a9 - b12 * a10 + b0 * a11 + b10 * a12 - b9 * a13 + b7 * a14 - b4 * a15)
        (b12 * a0 + b9 * a1 - b7 * a2 + b15 * a3 + b5 * a4 + b4 * a5 - b14 * a6 - b2 * a7 + b13 * a8 + b1 * a9 - b11 * a10 + b10 * a11 + b0 * a12 - b8 * a13 + b6 * a14 - b3 * a15)
        (b13 * a0 + b10 * a1 - b15 * a2 - b7 * a3 + b6 * a4 + b14 * a5 + b4 * a6 - b3 * a7 - b12 * a8 + b11 * a9 + b1 * a10 - b9 * a11 + b8 * a12 + b0 * a13 - b5 * a14 + b2 * a15)
        (b14 * a0 + b15 * a1 + b10 * a2 - b9 * a3 + b8 * a4 - b13 * a5 + b12 * a6 - b11 * a7 + b4 * a8 - b3 * a9 + b2 * a10 + b7 * a11 - b6 * a12 + b5 * a13 + b0 * a14 - b1 * a15)
        (b15 * a0 + b14 * a1 - b13 * a2 + b12 * a3 - b11 * a4 + b10 * a5 - b9 * a6 + b8 * a7 + b7 * a8 - b6 * a9 + b5 * a10 + b4 * a11 - b3 * a12 + b2 * a13 - b1 * a14 + b0 * a15)


{-| The outer product. (MEET) |-}
wedge : Spacetime -> Spacetime -> Spacetime
wedge (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b0 * a3)
        (b4 * a0 + b0 * a4)
        (b5 * a0 + b2 * a1 - b1 * a2 + b0 * a5)
        (b6 * a0 + b3 * a1 - b1 * a3 + b0 * a6)
        (b7 * a0 + b4 * a1 - b1 * a4 + b0 * a7)
        (b8 * a0 + b3 * a2 - b2 * a3 + b0 * a8)
        (b9 * a0 + b4 * a2 - b2 * a4 + b0 * a9)
        (b10 * a0 + b4 * a3 - b3 * a4 + b0 * a10)
        (b11 * a0 + b8 * a1 - b6 * a2 + b5 * a3 + b3 * a5 - b2 * a6 + b1 * a8 + b0 * a11)
        (b12 * a0 + b9 * a1 - b7 * a2 + b5 * a4 + b4 * a5 - b2 * a7 + b1 * a9 + b0 * a12)
        (b13 * a0 + b10 * a1 - b7 * a3 + b6 * a4 + b4 * a6 - b3 * a7 + b1 * a10 + b0 * a13)
        (b14 * a0 + b10 * a2 - b9 * a3 + b8 * a4 + b4 * a8 - b3 * a9 + b2 * a10 + b0 * a14)
        (b15 * a0 + b14 * a1 - b13 * a2 + b12 * a3 - b11 * a4 + b10 * a5 - b9 * a6 + b8 * a7 + b7 * a8 - b6 * a9 + b5 * a10 + b4 * a11 - b3 * a12 + b2 * a13 - b1 * a14 + b0 * a15)


{-| The regressive product. (JOIN) |-}
vee : Spacetime -> Spacetime -> Spacetime
vee (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
        (1 * (a15 * b15))
        (-1 * (a14 * -1 * b15 + a15 * b14 * -1))
        (1 * (a13 * b15 + a15 * b13))
        (-1 * (a12 * -1 * b15 + a15 * b12 * -1))
        (1 * (a11 * b15 + a15 * b11))
        (1 * (a10 * b15 + a13 * b14 * -1 - a14 * -1 * b13 + a15 * b10))
        (-1 * (a9 * -1 * b15 + a12 * -1 * b14 * -1 - a14 * -1 * b12 * -1 + a15 * b9 * -1))
        (1 * (a8 * b15 + a11 * b14 * -1 - a14 * -1 * b11 + a15 * b8))
        (1 * (a7 * b15 + a12 * -1 * b13 - a13 * b12 * -1 + a15 * b7))
        (-1 * (a6 * -1 * b15 + a11 * b13 - a13 * b11 + a15 * b6 * -1))
        (1 * (a5 * b15 + a11 * b12 * -1 - a12 * -1 * b11 + a15 * b5))
        (-1 * (a4 * -1 * b15 + a7 * b14 * -1 - a9 * -1 * b13 + a10 * b12 * -1 + a12 * -1 * b10 - a13 * b9 * -1 + a14 * -1 * b7 + a15 * b4 * -1))
        (1 * (a3 * b15 + a6 * -1 * b14 * -1 - a8 * b13 + a10 * b11 + a11 * b10 - a13 * b8 + a14 * -1 * b6 * -1 + a15 * b3))
        (-1 * (a2 * -1 * b15 + a5 * b14 * -1 - a8 * b12 * -1 + a9 * -1 * b11 + a11 * b9 * -1 - a12 * -1 * b8 + a14 * -1 * b5 + a15 * b2 * -1))
        (1 * (a1 * b15 + a5 * b13 - a6 * -1 * b12 * -1 + a7 * b11 + a11 * b7 - a12 * -1 * b6 * -1 + a13 * b5 + a15 * b1))
        (1 * (a0 * b15 + a1 * b14 * -1 - a2 * -1 * b13 + a3 * b12 * -1 - a4 * -1 * b11 + a5 * b10 - a6 * -1 * b9 * -1 + a7 * b8 + a8 * b7 - a9 * -1 * b6 * -1 + a10 * b5 + a11 * b4 * -1 - a12 * -1 * b3 + a13 * b2 * -1 - a14 * -1 * b1 + a15 * b0))


{-| The inner product. |-}
dot : Spacetime -> Spacetime -> Spacetime
dot (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
        (b0 * a0 + b1 * a1 + b2 * a2 + b3 * a3 - b4 * a4 - b5 * a5 - b6 * a6 + b7 * a7 - b8 * a8 + b9 * a9 + b10 * a10 - b11 * a11 + b12 * a12 + b13 * a13 + b14 * a14 - b15 * a15)
        (b1 * a0 + b0 * a1 - b5 * a2 - b6 * a3 + b7 * a4 + b2 * a5 + b3 * a6 - b4 * a7 - b11 * a8 + b12 * a9 + b13 * a10 - b8 * a11 + b9 * a12 + b10 * a13 - b15 * a14 + b14 * a15)
        (b2 * a0 + b5 * a1 + b0 * a2 - b8 * a3 + b9 * a4 - b1 * a5 + b11 * a6 - b12 * a7 + b3 * a8 - b4 * a9 + b14 * a10 + b6 * a11 - b7 * a12 + b15 * a13 + b10 * a14 - b13 * a15)
        (b3 * a0 + b6 * a1 + b8 * a2 + b0 * a3 + b10 * a4 - b11 * a5 - b1 * a6 - b13 * a7 - b2 * a8 - b14 * a9 - b4 * a10 - b5 * a11 - b15 * a12 - b7 * a13 - b9 * a14 + b12 * a15)
        (b4 * a0 + b7 * a1 + b9 * a2 + b10 * a3 + b0 * a4 - b12 * a5 - b13 * a6 - b1 * a7 - b14 * a8 - b2 * a9 - b3 * a10 - b15 * a11 - b5 * a12 - b6 * a13 - b8 * a14 + b11 * a15)
        (b5 * a0 + b11 * a3 - b12 * a4 + b0 * a5 + b15 * a10 + b3 * a11 - b4 * a12 + b10 * a15)
        (b6 * a0 - b11 * a2 - b13 * a4 + b0 * a6 - b15 * a9 - b2 * a11 - b4 * a13 - b9 * a15)
        (b7 * a0 - b12 * a2 - b13 * a3 + b0 * a7 - b15 * a8 - b2 * a12 - b3 * a13 - b8 * a15)
        (b8 * a0 + b11 * a1 - b14 * a4 + b15 * a7 + b0 * a8 + b1 * a11 - b4 * a14 + b7 * a15)
        (b9 * a0 + b12 * a1 - b14 * a3 + b15 * a6 + b0 * a9 + b1 * a12 - b3 * a14 + b6 * a15)
        (b10 * a0 + b13 * a1 + b14 * a2 - b15 * a5 + b0 * a10 + b1 * a13 + b2 * a14 - b5 * a15)
        (b11 * a0 + b15 * a4 + b0 * a11 - b4 * a15)
        (b12 * a0 + b15 * a3 + b0 * a12 - b3 * a15)
        (b13 * a0 - b15 * a2 + b0 * a13 + b2 * a15)
        (b14 * a0 + b15 * a1 + b0 * a14 - b1 * a15)
        (b15 * a0 + b0 * a15)


{-| Multivector addition |-}
add : Spacetime -> Spacetime -> Spacetime
add (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
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


{-| Multivector subtraction |-}
sub : Spacetime -> Spacetime -> Spacetime
sub (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
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


{-| scalar/multivector multiplication |-}
smul : Float -> Spacetime -> Spacetime
smul a (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
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


{-| multivector/scalar multiplication |-}
muls : Spacetime -> Float -> Spacetime
muls (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) b =
    Spacetime
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


{-| scalar/multivector addition |-}
sadd : Float -> Spacetime -> Spacetime
sadd a (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
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


{-| multivector/scalar addition |-}
adds : Spacetime -> Float -> Spacetime
adds (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) b =
    Spacetime
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


{-| scalar/multivector subtraction |-}
ssub : Float -> Spacetime -> Spacetime
ssub a (Spacetime b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15) =
    Spacetime
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


{-| multivector/scalar subtraction |-}
subs : Spacetime -> Float -> Spacetime
subs (Spacetime a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15) b =
    Spacetime
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


{-| Norm |-}
norm : Spacetime -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual |-}
inorm : Spacetime -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector |-}
normalized : Spacetime -> Spacetime
normalized a =
    muls a (1 / norm a)


{-| Basis multivector |-}
scalar : Spacetime
scalar =
    set Scalar 1 zero


{-| Basis multivector |-}
e1 : Spacetime
e1 =
    set E1 1 zero


{-| Basis multivector |-}
e2 : Spacetime
e2 =
    set E2 1 zero


{-| Basis multivector |-}
e3 : Spacetime
e3 =
    set E3 1 zero


{-| Basis multivector |-}
e4 : Spacetime
e4 =
    set E4 1 zero


{-| Basis multivector |-}
e12 : Spacetime
e12 =
    set E12 1 zero


{-| Basis multivector |-}
e13 : Spacetime
e13 =
    set E13 1 zero


{-| Basis multivector |-}
e14 : Spacetime
e14 =
    set E14 1 zero


{-| Basis multivector |-}
e23 : Spacetime
e23 =
    set E23 1 zero


{-| Basis multivector |-}
e24 : Spacetime
e24 =
    set E24 1 zero


{-| Basis multivector |-}
e34 : Spacetime
e34 =
    set E34 1 zero


{-| Basis multivector |-}
e123 : Spacetime
e123 =
    set E123 1 zero


{-| Basis multivector |-}
e124 : Spacetime
e124 =
    set E124 1 zero


{-| Basis multivector |-}
e134 : Spacetime
e134 =
    set E134 1 zero


{-| Basis multivector |-}
e234 : Spacetime
e234 =
    set E234 1 zero


{-| Basis multivector |-}
e1234 : Spacetime
e1234 =
    set E1234 1 zero
