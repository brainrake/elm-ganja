module Ganja.Cga exposing (CgaBasis(..), basisList, basisCount, basisName, Cga(..), zero, get, set, new, toString, fromList, toList, reverse, dual, conjugate, involute, mul, wedge, vee, dot, add, sub, smul, muls, sadd, adds, ssub, subs, norm, inorm, normalized, unitScalar, e1, e2, e3, e4, e5, e12, e13, e14, e15, e23, e24, e25, e34, e35, e45, e123, e124, e125, e134, e135, e145, e234, e235, e245, e345, e1234, e1235, e1245, e1345, e2345, e12345)
{-| Clifford Algebra: Cga

Generated with ganja.js written by enki.

# Basis
@docs CgaBasis, basisList, basisCount, basisName

# Multivector
@docs Cga, zero, get, set, new

# Basis multivectors
@docs  unitScalar, e1, e2, e3, e4, e5, e12, e13, e14, e15, e23, e24, e25, e34, e35, e45, e123, e124, e125, e134, e135, e145, e234, e235, e245, e345, e1234, e1235, e1245, e1345, e2345, e12345

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
type CgaBasis =
    Scalar
    | E1
    | E2
    | E3
    | E4
    | E5
    | E12
    | E13
    | E14
    | E15
    | E23
    | E24
    | E25
    | E34
    | E35
    | E45
    | E123
    | E124
    | E125
    | E134
    | E135
    | E145
    | E234
    | E235
    | E245
    | E345
    | E1234
    | E1235
    | E1245
    | E1345
    | E2345
    | E12345


{-| Basis list -}
basisList : List CgaBasis
basisList = 
    [ Scalar, E1, E2, E3, E4, E5, E12, E13, E14, E15, E23, E24, E25, E34, E35, E45, E123, E124, E125, E134, E135, E145, E234, E235, E245, E345, E1234, E1235, E1245, E1345, E2345, E12345 ]


{-| Number of coefficients -}
basisCount : Int
basisCount = 
    32


{-| Basis name -}
basisName : CgaBasis -> String
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

        E5 -> 
            "e5"

        E12 -> 
            "e12"

        E13 -> 
            "e13"

        E14 -> 
            "e14"

        E15 -> 
            "e15"

        E23 -> 
            "e23"

        E24 -> 
            "e24"

        E25 -> 
            "e25"

        E34 -> 
            "e34"

        E35 -> 
            "e35"

        E45 -> 
            "e45"

        E123 -> 
            "e123"

        E124 -> 
            "e124"

        E125 -> 
            "e125"

        E134 -> 
            "e134"

        E135 -> 
            "e135"

        E145 -> 
            "e145"

        E234 -> 
            "e234"

        E235 -> 
            "e235"

        E245 -> 
            "e245"

        E345 -> 
            "e345"

        E1234 -> 
            "e1234"

        E1235 -> 
            "e1235"

        E1245 -> 
            "e1245"

        E1345 -> 
            "e1345"

        E2345 -> 
            "e2345"

        E12345 -> 
            "e12345"


{-| Multivector -}
type Cga =
    Cga Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float Float


{-| Zero value -}
zero : Cga
zero =
    Cga 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


{-| Get coefficient -}
get : CgaBasis -> Cga -> Float
get basis (Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31) =
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

        E5 -> 
            v5

        E12 -> 
            v6

        E13 -> 
            v7

        E14 -> 
            v8

        E15 -> 
            v9

        E23 -> 
            v10

        E24 -> 
            v11

        E25 -> 
            v12

        E34 -> 
            v13

        E35 -> 
            v14

        E45 -> 
            v15

        E123 -> 
            v16

        E124 -> 
            v17

        E125 -> 
            v18

        E134 -> 
            v19

        E135 -> 
            v20

        E145 -> 
            v21

        E234 -> 
            v22

        E235 -> 
            v23

        E245 -> 
            v24

        E345 -> 
            v25

        E1234 -> 
            v26

        E1235 -> 
            v27

        E1245 -> 
            v28

        E1345 -> 
            v29

        E2345 -> 
            v30

        E12345 -> 
            v31


{-| Update coefficient -}
set : CgaBasis -> Float -> Cga -> Cga
set basis value (Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31) =
    case basis of
        Scalar -> 
            Cga value v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E1 -> 
            Cga v0 value v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E2 -> 
            Cga v0 v1 value v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E3 -> 
            Cga v0 v1 v2 value v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E4 -> 
            Cga v0 v1 v2 v3 value v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E5 -> 
            Cga v0 v1 v2 v3 v4 value v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E12 -> 
            Cga v0 v1 v2 v3 v4 v5 value v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E13 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 value v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E14 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 value v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E15 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 value v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E23 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 value v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E24 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 value v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E25 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 value v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E34 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 value v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E35 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 value v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E45 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 value v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E123 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 value v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E124 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 value v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E125 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 value v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E134 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 value v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E135 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 value v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E145 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 value v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

        E234 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 value v23 v24 v25 v26 v27 v28 v29 v30 v31

        E235 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 value v24 v25 v26 v27 v28 v29 v30 v31

        E245 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 value v25 v26 v27 v28 v29 v30 v31

        E345 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 value v26 v27 v28 v29 v30 v31

        E1234 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 value v27 v28 v29 v30 v31

        E1235 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 value v28 v29 v30 v31

        E1245 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 value v29 v30 v31

        E1345 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 value v30 v31

        E2345 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 value v31

        E12345 -> 
            Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 value


{-| Multivector with one coefficient -}
new : Float -> CgaBasis -> Cga
new value basis =
    set basis value zero


{-| Convert multivector to string -}
toString : Cga -> String
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
fromList : List Float -> Maybe Cga
fromList list =
    case ( List.head <| List.drop 0 list , ( List.head <| List.drop 1 list , ( List.head <| List.drop 2 list , ( List.head <| List.drop 3 list , ( List.head <| List.drop 4 list , ( List.head <| List.drop 5 list , ( List.head <| List.drop 6 list , ( List.head <| List.drop 7 list , ( List.head <| List.drop 8 list , ( List.head <| List.drop 9 list , ( List.head <| List.drop 10 list , ( List.head <| List.drop 11 list , ( List.head <| List.drop 12 list , ( List.head <| List.drop 13 list , ( List.head <| List.drop 14 list , ( List.head <| List.drop 15 list , ( List.head <| List.drop 16 list , ( List.head <| List.drop 17 list , ( List.head <| List.drop 18 list , ( List.head <| List.drop 19 list , ( List.head <| List.drop 20 list , ( List.head <| List.drop 21 list , ( List.head <| List.drop 22 list , ( List.head <| List.drop 23 list , ( List.head <| List.drop 24 list , ( List.head <| List.drop 25 list , ( List.head <| List.drop 26 list , ( List.head <| List.drop 27 list , ( List.head <| List.drop 28 list , ( List.head <| List.drop 29 list , ( List.head <| List.drop 30 list , ( List.head <| List.drop 31 list )))))))))))))))))))))))))))))))) of
        ( Just v0 , ( Just v1 , ( Just v2 , ( Just v3 , ( Just v4 , ( Just v5 , ( Just v6 , ( Just v7 , ( Just v8 , ( Just v9 , ( Just v10 , ( Just v11 , ( Just v12 , ( Just v13 , ( Just v14 , ( Just v15 , ( Just v16 , ( Just v17 , ( Just v18 , ( Just v19 , ( Just v20 , ( Just v21 , ( Just v22 , ( Just v23 , ( Just v24 , ( Just v25 , ( Just v26 , ( Just v27 , ( Just v28 , ( Just v29 , ( Just v30 , ( Just v31 )))))))))))))))))))))))))))))))) ->
            Just (Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31)

        _ ->
            Nothing


{-| Convert multivector to list of coefficients -}
toList : Cga -> List Float
toList (Cga v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31) =
    [ v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31 ]



{-| Reverse the order of the basis blades. -}
reverse : Cga -> Cga
reverse (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) =
    Cga
        (a0)
        (a1)
        (a2)
        (a3)
        (a4)
        (a5)
        (-a6)
        (-a7)
        (-a8)
        (-a9)
        (-a10)
        (-a11)
        (-a12)
        (-a13)
        (-a14)
        (-a15)
        (-a16)
        (-a17)
        (-a18)
        (-a19)
        (-a20)
        (-a21)
        (-a22)
        (-a23)
        (-a24)
        (-a25)
        (a26)
        (a27)
        (a28)
        (a29)
        (a30)
        (a31)


{-| Poincare duality operator. -}
dual : Cga -> Cga
dual (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) =
    Cga
        (-a31)
        (-a30)
        (a29)
        (-a28)
        (a27)
        (a26)
        (a25)
        (-a24)
        (a23)
        (a22)
        (a21)
        (-a20)
        (-a19)
        (a18)
        (a17)
        (-a16)
        (a15)
        (-a14)
        (-a13)
        (a12)
        (a11)
        (-a10)
        (-a9)
        (-a8)
        (a7)
        (-a6)
        (-a5)
        (-a4)
        (a3)
        (-a2)
        (a1)
        (a0)


{-| Clifford Conjugation -}
conjugate : Cga -> Cga
conjugate (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) =
    Cga
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
        (-a11)
        (-a12)
        (-a13)
        (-a14)
        (-a15)
        (a16)
        (a17)
        (a18)
        (a19)
        (a20)
        (a21)
        (a22)
        (a23)
        (a24)
        (a25)
        (a26)
        (a27)
        (a28)
        (a29)
        (a30)
        (-a31)


{-| Main involution -}
involute : Cga -> Cga
involute (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) =
    Cga
        (a0)
        (-a1)
        (-a2)
        (-a3)
        (-a4)
        (-a5)
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
        (-a16)
        (-a17)
        (-a18)
        (-a19)
        (-a20)
        (-a21)
        (-a22)
        (-a23)
        (-a24)
        (-a25)
        (a26)
        (a27)
        (a28)
        (a29)
        (a30)
        (-a31)


{-| The geometric product. -}
mul : Cga -> Cga -> Cga
mul (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
        (b0 * a0 + b1 * a1 + b2 * a2 + b3 * a3 + b4 * a4 - b5 * a5 - b6 * a6 - b7 * a7 - b8 * a8 + b9 * a9 - b10 * a10 - b11 * a11 + b12 * a12 - b13 * a13 + b14 * a14 + b15 * a15 - b16 * a16 - b17 * a17 + b18 * a18 - b19 * a19 + b20 * a20 + b21 * a21 - b22 * a22 + b23 * a23 + b24 * a24 + b25 * a25 + b26 * a26 - b27 * a27 - b28 * a28 - b29 * a29 - b30 * a30 - b31 * a31)
        (b1 * a0 + b0 * a1 - b6 * a2 - b7 * a3 - b8 * a4 + b9 * a5 + b2 * a6 + b3 * a7 + b4 * a8 - b5 * a9 - b16 * a10 - b17 * a11 + b18 * a12 - b19 * a13 + b20 * a14 + b21 * a15 - b10 * a16 - b11 * a17 + b12 * a18 - b13 * a19 + b14 * a20 + b15 * a21 + b26 * a22 - b27 * a23 - b28 * a24 - b29 * a25 - b22 * a26 + b23 * a27 + b24 * a28 + b25 * a29 - b31 * a30 - b30 * a31)
        (b2 * a0 + b6 * a1 + b0 * a2 - b10 * a3 - b11 * a4 + b12 * a5 - b1 * a6 + b16 * a7 + b17 * a8 - b18 * a9 + b3 * a10 + b4 * a11 - b5 * a12 - b22 * a13 + b23 * a14 + b24 * a15 + b7 * a16 + b8 * a17 - b9 * a18 - b26 * a19 + b27 * a20 + b28 * a21 - b13 * a22 + b14 * a23 + b15 * a24 - b30 * a25 + b19 * a26 - b20 * a27 - b21 * a28 + b31 * a29 + b25 * a30 + b29 * a31)
        (b3 * a0 + b7 * a1 + b10 * a2 + b0 * a3 - b13 * a4 + b14 * a5 - b16 * a6 - b1 * a7 + b19 * a8 - b20 * a9 - b2 * a10 + b22 * a11 - b23 * a12 + b4 * a13 - b5 * a14 + b25 * a15 - b6 * a16 + b26 * a17 - b27 * a18 + b8 * a19 - b9 * a20 + b29 * a21 + b11 * a22 - b12 * a23 + b30 * a24 + b15 * a25 - b17 * a26 + b18 * a27 - b31 * a28 - b21 * a29 - b24 * a30 - b28 * a31)
        (b4 * a0 + b8 * a1 + b11 * a2 + b13 * a3 + b0 * a4 + b15 * a5 - b17 * a6 - b19 * a7 - b1 * a8 - b21 * a9 - b22 * a10 - b2 * a11 - b24 * a12 - b3 * a13 - b25 * a14 - b5 * a15 - b26 * a16 - b6 * a17 - b28 * a18 - b7 * a19 - b29 * a20 - b9 * a21 - b10 * a22 - b30 * a23 - b12 * a24 - b14 * a25 + b16 * a26 + b31 * a27 + b18 * a28 + b20 * a29 + b23 * a30 + b27 * a31)
        (b5 * a0 + b9 * a1 + b12 * a2 + b14 * a3 + b15 * a4 + b0 * a5 - b18 * a6 - b20 * a7 - b21 * a8 - b1 * a9 - b23 * a10 - b24 * a11 - b2 * a12 - b25 * a13 - b3 * a14 - b4 * a15 - b27 * a16 - b28 * a17 - b6 * a18 - b29 * a19 - b7 * a20 - b8 * a21 - b30 * a22 - b10 * a23 - b11 * a24 - b13 * a25 + b31 * a26 + b16 * a27 + b17 * a28 + b19 * a29 + b22 * a30 + b26 * a31)
        (b6 * a0 + b2 * a1 - b1 * a2 + b16 * a3 + b17 * a4 - b18 * a5 + b0 * a6 - b10 * a7 - b11 * a8 + b12 * a9 + b7 * a10 + b8 * a11 - b9 * a12 - b26 * a13 + b27 * a14 + b28 * a15 + b3 * a16 + b4 * a17 - b5 * a18 - b22 * a19 + b23 * a20 + b24 * a21 + b19 * a22 - b20 * a23 - b21 * a24 + b31 * a25 - b13 * a26 + b14 * a27 + b15 * a28 - b30 * a29 + b29 * a30 + b25 * a31)
        (b7 * a0 + b3 * a1 - b16 * a2 - b1 * a3 + b19 * a4 - b20 * a5 + b10 * a6 + b0 * a7 - b13 * a8 + b14 * a9 - b6 * a10 + b26 * a11 - b27 * a12 + b8 * a13 - b9 * a14 + b29 * a15 - b2 * a16 + b22 * a17 - b23 * a18 + b4 * a19 - b5 * a20 + b25 * a21 - b17 * a22 + b18 * a23 - b31 * a24 - b21 * a25 + b11 * a26 - b12 * a27 + b30 * a28 + b15 * a29 - b28 * a30 - b24 * a31)
        (b8 * a0 + b4 * a1 - b17 * a2 - b19 * a3 - b1 * a4 - b21 * a5 + b11 * a6 + b13 * a7 + b0 * a8 + b15 * a9 - b26 * a10 - b6 * a11 - b28 * a12 - b7 * a13 - b29 * a14 - b9 * a15 - b22 * a16 - b2 * a17 - b24 * a18 - b3 * a19 - b25 * a20 - b5 * a21 + b16 * a22 + b31 * a23 + b18 * a24 + b20 * a25 - b10 * a26 - b30 * a27 - b12 * a28 - b14 * a29 + b27 * a30 + b23 * a31)
        (b9 * a0 + b5 * a1 - b18 * a2 - b20 * a3 - b21 * a4 - b1 * a5 + b12 * a6 + b14 * a7 + b15 * a8 + b0 * a9 - b27 * a10 - b28 * a11 - b6 * a12 - b29 * a13 - b7 * a14 - b8 * a15 - b23 * a16 - b24 * a17 - b2 * a18 - b25 * a19 - b3 * a20 - b4 * a21 + b31 * a22 + b16 * a23 + b17 * a24 + b19 * a25 - b30 * a26 - b10 * a27 - b11 * a28 - b13 * a29 + b26 * a30 + b22 * a31)
        (b10 * a0 + b16 * a1 + b3 * a2 - b2 * a3 + b22 * a4 - b23 * a5 - b7 * a6 + b6 * a7 - b26 * a8 + b27 * a9 + b0 * a10 - b13 * a11 + b14 * a12 + b11 * a13 - b12 * a14 + b30 * a15 + b1 * a16 - b19 * a17 + b20 * a18 + b17 * a19 - b18 * a20 + b31 * a21 + b4 * a22 - b5 * a23 + b25 * a24 - b24 * a25 - b8 * a26 + b9 * a27 - b29 * a28 + b28 * a29 + b15 * a30 + b21 * a31)
        (b11 * a0 + b17 * a1 + b4 * a2 - b22 * a3 - b2 * a4 - b24 * a5 - b8 * a6 + b26 * a7 + b6 * a8 + b28 * a9 + b13 * a10 + b0 * a11 + b15 * a12 - b10 * a13 - b30 * a14 - b12 * a15 + b19 * a16 + b1 * a17 + b21 * a18 - b16 * a19 - b31 * a20 - b18 * a21 - b3 * a22 - b25 * a23 - b5 * a24 + b23 * a25 + b7 * a26 + b29 * a27 + b9 * a28 - b27 * a29 - b14 * a30 - b20 * a31)
        (b12 * a0 + b18 * a1 + b5 * a2 - b23 * a3 - b24 * a4 - b2 * a5 - b9 * a6 + b27 * a7 + b28 * a8 + b6 * a9 + b14 * a10 + b15 * a11 + b0 * a12 - b30 * a13 - b10 * a14 - b11 * a15 + b20 * a16 + b21 * a17 + b1 * a18 - b31 * a19 - b16 * a20 - b17 * a21 - b25 * a22 - b3 * a23 - b4 * a24 + b22 * a25 + b29 * a26 + b7 * a27 + b8 * a28 - b26 * a29 - b13 * a30 - b19 * a31)
        (b13 * a0 + b19 * a1 + b22 * a2 + b4 * a3 - b3 * a4 - b25 * a5 - b26 * a6 - b8 * a7 + b7 * a8 + b29 * a9 - b11 * a10 + b10 * a11 + b30 * a12 + b0 * a13 + b15 * a14 - b14 * a15 - b17 * a16 + b16 * a17 + b31 * a18 + b1 * a19 + b21 * a20 - b20 * a21 + b2 * a22 + b24 * a23 - b23 * a24 - b5 * a25 - b6 * a26 - b28 * a27 + b27 * a28 + b9 * a29 + b12 * a30 + b18 * a31)
        (b14 * a0 + b20 * a1 + b23 * a2 + b5 * a3 - b25 * a4 - b3 * a5 - b27 * a6 - b9 * a7 + b29 * a8 + b7 * a9 - b12 * a10 + b30 * a11 + b10 * a12 + b15 * a13 + b0 * a14 - b13 * a15 - b18 * a16 + b31 * a17 + b16 * a18 + b21 * a19 + b1 * a20 - b19 * a21 + b24 * a22 + b2 * a23 - b22 * a24 - b4 * a25 - b28 * a26 - b6 * a27 + b26 * a28 + b8 * a29 + b11 * a30 + b17 * a31)
        (b15 * a0 + b21 * a1 + b24 * a2 + b25 * a3 + b5 * a4 - b4 * a5 - b28 * a6 - b29 * a7 - b9 * a8 + b8 * a9 - b30 * a10 - b12 * a11 + b11 * a12 - b14 * a13 + b13 * a14 + b0 * a15 - b31 * a16 - b18 * a17 + b17 * a18 - b20 * a19 + b19 * a20 + b1 * a21 - b23 * a22 + b22 * a23 + b2 * a24 + b3 * a25 + b27 * a26 - b26 * a27 - b6 * a28 - b7 * a29 - b10 * a30 - b16 * a31)
        (b16 * a0 + b10 * a1 - b7 * a2 + b6 * a3 - b26 * a4 + b27 * a5 + b3 * a6 - b2 * a7 + b22 * a8 - b23 * a9 + b1 * a10 - b19 * a11 + b20 * a12 + b17 * a13 - b18 * a14 + b31 * a15 + b0 * a16 - b13 * a17 + b14 * a18 + b11 * a19 - b12 * a20 + b30 * a21 - b8 * a22 + b9 * a23 - b29 * a24 + b28 * a25 + b4 * a26 - b5 * a27 + b25 * a28 - b24 * a29 + b21 * a30 + b15 * a31)
        (b17 * a0 + b11 * a1 - b8 * a2 + b26 * a3 + b6 * a4 + b28 * a5 + b4 * a6 - b22 * a7 - b2 * a8 - b24 * a9 + b19 * a10 + b1 * a11 + b21 * a12 - b16 * a13 - b31 * a14 - b18 * a15 + b13 * a16 + b0 * a17 + b15 * a18 - b10 * a19 - b30 * a20 - b12 * a21 + b7 * a22 + b29 * a23 + b9 * a24 - b27 * a25 - b3 * a26 - b25 * a27 - b5 * a28 + b23 * a29 - b20 * a30 - b14 * a31)
        (b18 * a0 + b12 * a1 - b9 * a2 + b27 * a3 + b28 * a4 + b6 * a5 + b5 * a6 - b23 * a7 - b24 * a8 - b2 * a9 + b20 * a10 + b21 * a11 + b1 * a12 - b31 * a13 - b16 * a14 - b17 * a15 + b14 * a16 + b15 * a17 + b0 * a18 - b30 * a19 - b10 * a20 - b11 * a21 + b29 * a22 + b7 * a23 + b8 * a24 - b26 * a25 - b25 * a26 - b3 * a27 - b4 * a28 + b22 * a29 - b19 * a30 - b13 * a31)
        (b19 * a0 + b13 * a1 - b26 * a2 - b8 * a3 + b7 * a4 + b29 * a5 + b22 * a6 + b4 * a7 - b3 * a8 - b25 * a9 - b17 * a10 + b16 * a11 + b31 * a12 + b1 * a13 + b21 * a14 - b20 * a15 - b11 * a16 + b10 * a17 + b30 * a18 + b0 * a19 + b15 * a20 - b14 * a21 - b6 * a22 - b28 * a23 + b27 * a24 + b9 * a25 + b2 * a26 + b24 * a27 - b23 * a28 - b5 * a29 + b18 * a30 + b12 * a31)
        (b20 * a0 + b14 * a1 - b27 * a2 - b9 * a3 + b29 * a4 + b7 * a5 + b23 * a6 + b5 * a7 - b25 * a8 - b3 * a9 - b18 * a10 + b31 * a11 + b16 * a12 + b21 * a13 + b1 * a14 - b19 * a15 - b12 * a16 + b30 * a17 + b10 * a18 + b15 * a19 + b0 * a20 - b13 * a21 - b28 * a22 - b6 * a23 + b26 * a24 + b8 * a25 + b24 * a26 + b2 * a27 - b22 * a28 - b4 * a29 + b17 * a30 + b11 * a31)
        (b21 * a0 + b15 * a1 - b28 * a2 - b29 * a3 - b9 * a4 + b8 * a5 + b24 * a6 + b25 * a7 + b5 * a8 - b4 * a9 - b31 * a10 - b18 * a11 + b17 * a12 - b20 * a13 + b19 * a14 + b1 * a15 - b30 * a16 - b12 * a17 + b11 * a18 - b14 * a19 + b13 * a20 + b0 * a21 + b27 * a22 - b26 * a23 - b6 * a24 - b7 * a25 - b23 * a26 + b22 * a27 + b2 * a28 + b3 * a29 - b16 * a30 - b10 * a31)
        (b22 * a0 + b26 * a1 + b13 * a2 - b11 * a3 + b10 * a4 + b30 * a5 - b19 * a6 + b17 * a7 - b16 * a8 - b31 * a9 + b4 * a10 - b3 * a11 - b25 * a12 + b2 * a13 + b24 * a14 - b23 * a15 + b8 * a16 - b7 * a17 - b29 * a18 + b6 * a19 + b28 * a20 - b27 * a21 + b0 * a22 + b15 * a23 - b14 * a24 + b12 * a25 - b1 * a26 - b21 * a27 + b20 * a28 - b18 * a29 - b5 * a30 - b9 * a31)
        (b23 * a0 + b27 * a1 + b14 * a2 - b12 * a3 + b30 * a4 + b10 * a5 - b20 * a6 + b18 * a7 - b31 * a8 - b16 * a9 + b5 * a10 - b25 * a11 - b3 * a12 + b24 * a13 + b2 * a14 - b22 * a15 + b9 * a16 - b29 * a17 - b7 * a18 + b28 * a19 + b6 * a20 - b26 * a21 + b15 * a22 + b0 * a23 - b13 * a24 + b11 * a25 - b21 * a26 - b1 * a27 + b19 * a28 - b17 * a29 - b4 * a30 - b8 * a31)
        (b24 * a0 + b28 * a1 + b15 * a2 - b30 * a3 - b12 * a4 + b11 * a5 - b21 * a6 + b31 * a7 + b18 * a8 - b17 * a9 + b25 * a10 + b5 * a11 - b4 * a12 - b23 * a13 + b22 * a14 + b2 * a15 + b29 * a16 + b9 * a17 - b8 * a18 - b27 * a19 + b26 * a20 + b6 * a21 - b14 * a22 + b13 * a23 + b0 * a24 - b10 * a25 + b20 * a26 - b19 * a27 - b1 * a28 + b16 * a29 + b3 * a30 + b7 * a31)
        (b25 * a0 + b29 * a1 + b30 * a2 + b15 * a3 - b14 * a4 + b13 * a5 - b31 * a6 - b21 * a7 + b20 * a8 - b19 * a9 - b24 * a10 + b23 * a11 - b22 * a12 + b5 * a13 - b4 * a14 + b3 * a15 - b28 * a16 + b27 * a17 - b26 * a18 + b9 * a19 - b8 * a20 + b7 * a21 + b12 * a22 - b11 * a23 + b10 * a24 + b0 * a25 - b18 * a26 + b17 * a27 - b16 * a28 - b1 * a29 - b2 * a30 - b6 * a31)
        (b26 * a0 + b22 * a1 - b19 * a2 + b17 * a3 - b16 * a4 - b31 * a5 + b13 * a6 - b11 * a7 + b10 * a8 + b30 * a9 + b8 * a10 - b7 * a11 - b29 * a12 + b6 * a13 + b28 * a14 - b27 * a15 + b4 * a16 - b3 * a17 - b25 * a18 + b2 * a19 + b24 * a20 - b23 * a21 - b1 * a22 - b21 * a23 + b20 * a24 - b18 * a25 + b0 * a26 + b15 * a27 - b14 * a28 + b12 * a29 - b9 * a30 - b5 * a31)
        (b27 * a0 + b23 * a1 - b20 * a2 + b18 * a3 - b31 * a4 - b16 * a5 + b14 * a6 - b12 * a7 + b30 * a8 + b10 * a9 + b9 * a10 - b29 * a11 - b7 * a12 + b28 * a13 + b6 * a14 - b26 * a15 + b5 * a16 - b25 * a17 - b3 * a18 + b24 * a19 + b2 * a20 - b22 * a21 - b21 * a22 - b1 * a23 + b19 * a24 - b17 * a25 + b15 * a26 + b0 * a27 - b13 * a28 + b11 * a29 - b8 * a30 - b4 * a31)
        (b28 * a0 + b24 * a1 - b21 * a2 + b31 * a3 + b18 * a4 - b17 * a5 + b15 * a6 - b30 * a7 - b12 * a8 + b11 * a9 + b29 * a10 + b9 * a11 - b8 * a12 - b27 * a13 + b26 * a14 + b6 * a15 + b25 * a16 + b5 * a17 - b4 * a18 - b23 * a19 + b22 * a20 + b2 * a21 + b20 * a22 - b19 * a23 - b1 * a24 + b16 * a25 - b14 * a26 + b13 * a27 + b0 * a28 - b10 * a29 + b7 * a30 + b3 * a31)
        (b29 * a0 + b25 * a1 - b31 * a2 - b21 * a3 + b20 * a4 - b19 * a5 + b30 * a6 + b15 * a7 - b14 * a8 + b13 * a9 - b28 * a10 + b27 * a11 - b26 * a12 + b9 * a13 - b8 * a14 + b7 * a15 - b24 * a16 + b23 * a17 - b22 * a18 + b5 * a19 - b4 * a20 + b3 * a21 - b18 * a22 + b17 * a23 - b16 * a24 - b1 * a25 + b12 * a26 - b11 * a27 + b10 * a28 + b0 * a29 - b6 * a30 - b2 * a31)
        (b30 * a0 + b31 * a1 + b25 * a2 - b24 * a3 + b23 * a4 - b22 * a5 - b29 * a6 + b28 * a7 - b27 * a8 + b26 * a9 + b15 * a10 - b14 * a11 + b13 * a12 + b12 * a13 - b11 * a14 + b10 * a15 + b21 * a16 - b20 * a17 + b19 * a18 + b18 * a19 - b17 * a20 + b16 * a21 + b5 * a22 - b4 * a23 + b3 * a24 - b2 * a25 - b9 * a26 + b8 * a27 - b7 * a28 + b6 * a29 + b0 * a30 + b1 * a31)
        (b31 * a0 + b30 * a1 - b29 * a2 + b28 * a3 - b27 * a4 + b26 * a5 + b25 * a6 - b24 * a7 + b23 * a8 - b22 * a9 + b21 * a10 - b20 * a11 + b19 * a12 + b18 * a13 - b17 * a14 + b16 * a15 + b15 * a16 - b14 * a17 + b13 * a18 + b12 * a19 - b11 * a20 + b10 * a21 - b9 * a22 + b8 * a23 - b7 * a24 + b6 * a25 + b5 * a26 - b4 * a27 + b3 * a28 - b2 * a29 + b1 * a30 + b0 * a31)


{-| The outer product. (MEET) -}
wedge : Cga -> Cga -> Cga
wedge (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
        (b0 * a0)
        (b1 * a0 + b0 * a1)
        (b2 * a0 + b0 * a2)
        (b3 * a0 + b0 * a3)
        (b4 * a0 + b0 * a4)
        (b5 * a0 + b0 * a5)
        (b6 * a0 + b2 * a1 - b1 * a2 + b0 * a6)
        (b7 * a0 + b3 * a1 - b1 * a3 + b0 * a7)
        (b8 * a0 + b4 * a1 - b1 * a4 + b0 * a8)
        (b9 * a0 + b5 * a1 - b1 * a5 + b0 * a9)
        (b10 * a0 + b3 * a2 - b2 * a3 + b0 * a10)
        (b11 * a0 + b4 * a2 - b2 * a4 + b0 * a11)
        (b12 * a0 + b5 * a2 - b2 * a5 + b0 * a12)
        (b13 * a0 + b4 * a3 - b3 * a4 + b0 * a13)
        (b14 * a0 + b5 * a3 - b3 * a5 + b0 * a14)
        (b15 * a0 + b5 * a4 - b4 * a5 + b0 * a15)
        (b16 * a0 + b10 * a1 - b7 * a2 + b6 * a3 + b3 * a6 - b2 * a7 + b1 * a10 + b0 * a16)
        (b17 * a0 + b11 * a1 - b8 * a2 + b6 * a4 + b4 * a6 - b2 * a8 + b1 * a11 + b0 * a17)
        (b18 * a0 + b12 * a1 - b9 * a2 + b6 * a5 + b5 * a6 - b2 * a9 + b1 * a12 + b0 * a18)
        (b19 * a0 + b13 * a1 - b8 * a3 + b7 * a4 + b4 * a7 - b3 * a8 + b1 * a13 + b0 * a19)
        (b20 * a0 + b14 * a1 - b9 * a3 + b7 * a5 + b5 * a7 - b3 * a9 + b1 * a14 + b0 * a20)
        (b21 * a0 + b15 * a1 - b9 * a4 + b8 * a5 + b5 * a8 - b4 * a9 + b1 * a15 + b0 * a21)
        (b22 * a0 + b13 * a2 - b11 * a3 + b10 * a4 + b4 * a10 - b3 * a11 + b2 * a13 + b0 * a22)
        (b23 * a0 + b14 * a2 - b12 * a3 + b10 * a5 + b5 * a10 - b3 * a12 + b2 * a14 + b0 * a23)
        (b24 * a0 + b15 * a2 - b12 * a4 + b11 * a5 + b5 * a11 - b4 * a12 + b2 * a15 + b0 * a24)
        (b25 * a0 + b15 * a3 - b14 * a4 + b13 * a5 + b5 * a13 - b4 * a14 + b3 * a15 + b0 * a25)
        (b26 * a0 + b22 * a1 - b19 * a2 + b17 * a3 - b16 * a4 + b13 * a6 - b11 * a7 + b10 * a8 + b8 * a10 - b7 * a11 + b6 * a13 + b4 * a16 - b3 * a17 + b2 * a19 - b1 * a22 + b0 * a26)
        (b27 * a0 + b23 * a1 - b20 * a2 + b18 * a3 - b16 * a5 + b14 * a6 - b12 * a7 + b10 * a9 + b9 * a10 - b7 * a12 + b6 * a14 + b5 * a16 - b3 * a18 + b2 * a20 - b1 * a23 + b0 * a27)
        (b28 * a0 + b24 * a1 - b21 * a2 + b18 * a4 - b17 * a5 + b15 * a6 - b12 * a8 + b11 * a9 + b9 * a11 - b8 * a12 + b6 * a15 + b5 * a17 - b4 * a18 + b2 * a21 - b1 * a24 + b0 * a28)
        (b29 * a0 + b25 * a1 - b21 * a3 + b20 * a4 - b19 * a5 + b15 * a7 - b14 * a8 + b13 * a9 + b9 * a13 - b8 * a14 + b7 * a15 + b5 * a19 - b4 * a20 + b3 * a21 - b1 * a25 + b0 * a29)
        (b30 * a0 + b25 * a2 - b24 * a3 + b23 * a4 - b22 * a5 + b15 * a10 - b14 * a11 + b13 * a12 + b12 * a13 - b11 * a14 + b10 * a15 + b5 * a22 - b4 * a23 + b3 * a24 - b2 * a25 + b0 * a30)
        (b31 * a0 + b30 * a1 - b29 * a2 + b28 * a3 - b27 * a4 + b26 * a5 + b25 * a6 - b24 * a7 + b23 * a8 - b22 * a9 + b21 * a10 - b20 * a11 + b19 * a12 + b18 * a13 - b17 * a14 + b16 * a15 + b15 * a16 - b14 * a17 + b13 * a18 + b12 * a19 - b11 * a20 + b10 * a21 - b9 * a22 + b8 * a23 - b7 * a24 + b6 * a25 + b5 * a26 - b4 * a27 + b3 * a28 - b2 * a29 + b1 * a30 + b0 * a31)


{-| The regressive product. (JOIN) -}
vee : Cga -> Cga -> Cga
vee (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
        (1 * (a0 * b31 + a1 * b30 - a2 * -1 * b29 * -1 + a3 * b28 - a4 * -1 * b27 * -1 + a5 * b26 + a6 * b25 - a7 * -1 * b24 * -1 + a8 * b23 - a9 * -1 * b22 * -1 + a10 * b21 - a11 * -1 * b20 * -1 + a12 * b19 + a13 * b18 - a14 * -1 * b17 * -1 + a15 * b16 + a16 * b15 - a17 * -1 * b14 * -1 + a18 * b13 + a19 * b12 - a20 * -1 * b11 * -1 + a21 * b10 - a22 * -1 * b9 * -1 + a23 * b8 - a24 * -1 * b7 * -1 + a25 * b6 + a26 * b5 - a27 * -1 * b4 * -1 + a28 * b3 - a29 * -1 * b2 * -1 + a30 * b1 + a31 * b0))
        (1 * (a1 * b31 + a6 * b29 * -1 - a7 * -1 * b28 + a8 * b27 * -1 - a9 * -1 * b26 + a16 * b21 - a17 * -1 * b20 * -1 + a18 * b19 + a19 * b18 - a20 * -1 * b17 * -1 + a21 * b16 + a26 * b9 * -1 - a27 * -1 * b8 + a28 * b7 * -1 - a29 * -1 * b6 + a31 * b1))
        (-1 * (a2 * -1 * b31 + a6 * b30 - a10 * b28 + a11 * -1 * b27 * -1 - a12 * b26 + a16 * b24 * -1 - a17 * -1 * b23 + a18 * b22 * -1 + a22 * -1 * b18 - a23 * b17 * -1 + a24 * -1 * b16 + a26 * b12 - a27 * -1 * b11 * -1 + a28 * b10 - a30 * b6 + a31 * b2 * -1))
        (1 * (a3 * b31 + a7 * -1 * b30 - a10 * b29 * -1 + a13 * b27 * -1 - a14 * -1 * b26 + a16 * b25 - a19 * b23 + a20 * -1 * b22 * -1 + a22 * -1 * b20 * -1 - a23 * b19 + a25 * b16 + a26 * b14 * -1 - a27 * -1 * b13 + a29 * -1 * b10 - a30 * b7 * -1 + a31 * b3))
        (-1 * (a4 * -1 * b31 + a8 * b30 - a11 * -1 * b29 * -1 + a13 * b28 - a15 * b26 + a17 * -1 * b25 - a19 * b24 * -1 + a21 * b22 * -1 + a22 * -1 * b21 - a24 * -1 * b19 + a25 * b17 * -1 + a26 * b15 - a28 * b13 + a29 * -1 * b11 * -1 - a30 * b8 + a31 * b4 * -1))
        (1 * (a5 * b31 + a9 * -1 * b30 - a12 * b29 * -1 + a14 * -1 * b28 - a15 * b27 * -1 + a18 * b25 - a20 * -1 * b24 * -1 + a21 * b23 + a23 * b21 - a24 * -1 * b20 * -1 + a25 * b18 + a27 * -1 * b15 - a28 * b14 * -1 + a29 * -1 * b12 - a30 * b9 * -1 + a31 * b5))
        (1 * (a6 * b31 + a16 * b28 - a17 * -1 * b27 * -1 + a18 * b26 + a26 * b18 - a27 * -1 * b17 * -1 + a28 * b16 + a31 * b6))
        (-1 * (a7 * -1 * b31 + a16 * b29 * -1 - a19 * b27 * -1 + a20 * -1 * b26 + a26 * b20 * -1 - a27 * -1 * b19 + a29 * -1 * b16 + a31 * b7 * -1))
        (1 * (a8 * b31 + a17 * -1 * b29 * -1 - a19 * b28 + a21 * b26 + a26 * b21 - a28 * b19 + a29 * -1 * b17 * -1 + a31 * b8))
        (-1 * (a9 * -1 * b31 + a18 * b29 * -1 - a20 * -1 * b28 + a21 * b27 * -1 + a27 * -1 * b21 - a28 * b20 * -1 + a29 * -1 * b18 + a31 * b9 * -1))
        (1 * (a10 * b31 + a16 * b30 - a22 * -1 * b27 * -1 + a23 * b26 + a26 * b23 - a27 * -1 * b22 * -1 + a30 * b16 + a31 * b10))
        (-1 * (a11 * -1 * b31 + a17 * -1 * b30 - a22 * -1 * b28 + a24 * -1 * b26 + a26 * b24 * -1 - a28 * b22 * -1 + a30 * b17 * -1 + a31 * b11 * -1))
        (1 * (a12 * b31 + a18 * b30 - a23 * b28 + a24 * -1 * b27 * -1 + a27 * -1 * b24 * -1 - a28 * b23 + a30 * b18 + a31 * b12))
        (1 * (a13 * b31 + a19 * b30 - a22 * -1 * b29 * -1 + a25 * b26 + a26 * b25 - a29 * -1 * b22 * -1 + a30 * b19 + a31 * b13))
        (-1 * (a14 * -1 * b31 + a20 * -1 * b30 - a23 * b29 * -1 + a25 * b27 * -1 + a27 * -1 * b25 - a29 * -1 * b23 + a30 * b20 * -1 + a31 * b14 * -1))
        (1 * (a15 * b31 + a21 * b30 - a24 * -1 * b29 * -1 + a25 * b28 + a28 * b25 - a29 * -1 * b24 * -1 + a30 * b21 + a31 * b15))
        (1 * (a16 * b31 + a26 * b27 * -1 - a27 * -1 * b26 + a31 * b16))
        (-1 * (a17 * -1 * b31 + a26 * b28 - a28 * b26 + a31 * b17 * -1))
        (1 * (a18 * b31 + a27 * -1 * b28 - a28 * b27 * -1 + a31 * b18))
        (1 * (a19 * b31 + a26 * b29 * -1 - a29 * -1 * b26 + a31 * b19))
        (-1 * (a20 * -1 * b31 + a27 * -1 * b29 * -1 - a29 * -1 * b27 * -1 + a31 * b20 * -1))
        (1 * (a21 * b31 + a28 * b29 * -1 - a29 * -1 * b28 + a31 * b21))
        (-1 * (a22 * -1 * b31 + a26 * b30 - a30 * b26 + a31 * b22 * -1))
        (1 * (a23 * b31 + a27 * -1 * b30 - a30 * b27 * -1 + a31 * b23))
        (-1 * (a24 * -1 * b31 + a28 * b30 - a30 * b28 + a31 * b24 * -1))
        (1 * (a25 * b31 + a29 * -1 * b30 - a30 * b29 * -1 + a31 * b25))
        (1 * (a26 * b31 + a31 * b26))
        (-1 * (a27 * -1 * b31 + a31 * b27 * -1))
        (1 * (a28 * b31 + a31 * b28))
        (-1 * (a29 * -1 * b31 + a31 * b29 * -1))
        (1 * (a30 * b31 + a31 * b30))
        (1 * (a31 * b31))


{-| The inner product. -}
dot : Cga -> Cga -> Cga
dot (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
        (b0 * a0 + b1 * a1 + b2 * a2 + b3 * a3 + b4 * a4 - b5 * a5 - b6 * a6 - b7 * a7 - b8 * a8 + b9 * a9 - b10 * a10 - b11 * a11 + b12 * a12 - b13 * a13 + b14 * a14 + b15 * a15 - b16 * a16 - b17 * a17 + b18 * a18 - b19 * a19 + b20 * a20 + b21 * a21 - b22 * a22 + b23 * a23 + b24 * a24 + b25 * a25 + b26 * a26 - b27 * a27 - b28 * a28 - b29 * a29 - b30 * a30 - b31 * a31)
        (b1 * a0 + b0 * a1 - b6 * a2 - b7 * a3 - b8 * a4 + b9 * a5 + b2 * a6 + b3 * a7 + b4 * a8 - b5 * a9 - b16 * a10 - b17 * a11 + b18 * a12 - b19 * a13 + b20 * a14 + b21 * a15 - b10 * a16 - b11 * a17 + b12 * a18 - b13 * a19 + b14 * a20 + b15 * a21 + b26 * a22 - b27 * a23 - b28 * a24 - b29 * a25 - b22 * a26 + b23 * a27 + b24 * a28 + b25 * a29 - b31 * a30 - b30 * a31)
        (b2 * a0 + b6 * a1 + b0 * a2 - b10 * a3 - b11 * a4 + b12 * a5 - b1 * a6 + b16 * a7 + b17 * a8 - b18 * a9 + b3 * a10 + b4 * a11 - b5 * a12 - b22 * a13 + b23 * a14 + b24 * a15 + b7 * a16 + b8 * a17 - b9 * a18 - b26 * a19 + b27 * a20 + b28 * a21 - b13 * a22 + b14 * a23 + b15 * a24 - b30 * a25 + b19 * a26 - b20 * a27 - b21 * a28 + b31 * a29 + b25 * a30 + b29 * a31)
        (b3 * a0 + b7 * a1 + b10 * a2 + b0 * a3 - b13 * a4 + b14 * a5 - b16 * a6 - b1 * a7 + b19 * a8 - b20 * a9 - b2 * a10 + b22 * a11 - b23 * a12 + b4 * a13 - b5 * a14 + b25 * a15 - b6 * a16 + b26 * a17 - b27 * a18 + b8 * a19 - b9 * a20 + b29 * a21 + b11 * a22 - b12 * a23 + b30 * a24 + b15 * a25 - b17 * a26 + b18 * a27 - b31 * a28 - b21 * a29 - b24 * a30 - b28 * a31)
        (b4 * a0 + b8 * a1 + b11 * a2 + b13 * a3 + b0 * a4 + b15 * a5 - b17 * a6 - b19 * a7 - b1 * a8 - b21 * a9 - b22 * a10 - b2 * a11 - b24 * a12 - b3 * a13 - b25 * a14 - b5 * a15 - b26 * a16 - b6 * a17 - b28 * a18 - b7 * a19 - b29 * a20 - b9 * a21 - b10 * a22 - b30 * a23 - b12 * a24 - b14 * a25 + b16 * a26 + b31 * a27 + b18 * a28 + b20 * a29 + b23 * a30 + b27 * a31)
        (b5 * a0 + b9 * a1 + b12 * a2 + b14 * a3 + b15 * a4 + b0 * a5 - b18 * a6 - b20 * a7 - b21 * a8 - b1 * a9 - b23 * a10 - b24 * a11 - b2 * a12 - b25 * a13 - b3 * a14 - b4 * a15 - b27 * a16 - b28 * a17 - b6 * a18 - b29 * a19 - b7 * a20 - b8 * a21 - b30 * a22 - b10 * a23 - b11 * a24 - b13 * a25 + b31 * a26 + b16 * a27 + b17 * a28 + b19 * a29 + b22 * a30 + b26 * a31)
        (b6 * a0 + b16 * a3 + b17 * a4 - b18 * a5 + b0 * a6 - b26 * a13 + b27 * a14 + b28 * a15 + b3 * a16 + b4 * a17 - b5 * a18 + b31 * a25 - b13 * a26 + b14 * a27 + b15 * a28 + b25 * a31)
        (b7 * a0 - b16 * a2 + b19 * a4 - b20 * a5 + b0 * a7 + b26 * a11 - b27 * a12 + b29 * a15 - b2 * a16 + b4 * a19 - b5 * a20 - b31 * a24 + b11 * a26 - b12 * a27 + b15 * a29 - b24 * a31)
        (b8 * a0 - b17 * a2 - b19 * a3 - b21 * a5 + b0 * a8 - b26 * a10 - b28 * a12 - b29 * a14 - b2 * a17 - b3 * a19 - b5 * a21 + b31 * a23 - b10 * a26 - b12 * a28 - b14 * a29 + b23 * a31)
        (b9 * a0 - b18 * a2 - b20 * a3 - b21 * a4 + b0 * a9 - b27 * a10 - b28 * a11 - b29 * a13 - b2 * a18 - b3 * a20 - b4 * a21 + b31 * a22 - b10 * a27 - b11 * a28 - b13 * a29 + b22 * a31)
        (b10 * a0 + b16 * a1 + b22 * a4 - b23 * a5 - b26 * a8 + b27 * a9 + b0 * a10 + b30 * a15 + b1 * a16 + b31 * a21 + b4 * a22 - b5 * a23 - b8 * a26 + b9 * a27 + b15 * a30 + b21 * a31)
        (b11 * a0 + b17 * a1 - b22 * a3 - b24 * a5 + b26 * a7 + b28 * a9 + b0 * a11 - b30 * a14 + b1 * a17 - b31 * a20 - b3 * a22 - b5 * a24 + b7 * a26 + b9 * a28 - b14 * a30 - b20 * a31)
        (b12 * a0 + b18 * a1 - b23 * a3 - b24 * a4 + b27 * a7 + b28 * a8 + b0 * a12 - b30 * a13 + b1 * a18 - b31 * a19 - b3 * a23 - b4 * a24 + b7 * a27 + b8 * a28 - b13 * a30 - b19 * a31)
        (b13 * a0 + b19 * a1 + b22 * a2 - b25 * a5 - b26 * a6 + b29 * a9 + b30 * a12 + b0 * a13 + b31 * a18 + b1 * a19 + b2 * a22 - b5 * a25 - b6 * a26 + b9 * a29 + b12 * a30 + b18 * a31)
        (b14 * a0 + b20 * a1 + b23 * a2 - b25 * a4 - b27 * a6 + b29 * a8 + b30 * a11 + b0 * a14 + b31 * a17 + b1 * a20 + b2 * a23 - b4 * a25 - b6 * a27 + b8 * a29 + b11 * a30 + b17 * a31)
        (b15 * a0 + b21 * a1 + b24 * a2 + b25 * a3 - b28 * a6 - b29 * a7 - b30 * a10 + b0 * a15 - b31 * a16 + b1 * a21 + b2 * a24 + b3 * a25 - b6 * a28 - b7 * a29 - b10 * a30 - b16 * a31)
        (b16 * a0 - b26 * a4 + b27 * a5 + b31 * a15 + b0 * a16 + b4 * a26 - b5 * a27 + b15 * a31)
        (b17 * a0 + b26 * a3 + b28 * a5 - b31 * a14 + b0 * a17 - b3 * a26 - b5 * a28 - b14 * a31)
        (b18 * a0 + b27 * a3 + b28 * a4 - b31 * a13 + b0 * a18 - b3 * a27 - b4 * a28 - b13 * a31)
        (b19 * a0 - b26 * a2 + b29 * a5 + b31 * a12 + b0 * a19 + b2 * a26 - b5 * a29 + b12 * a31)
        (b20 * a0 - b27 * a2 + b29 * a4 + b31 * a11 + b0 * a20 + b2 * a27 - b4 * a29 + b11 * a31)
        (b21 * a0 - b28 * a2 - b29 * a3 - b31 * a10 + b0 * a21 + b2 * a28 + b3 * a29 - b10 * a31)
        (b22 * a0 + b26 * a1 + b30 * a5 - b31 * a9 + b0 * a22 - b1 * a26 - b5 * a30 - b9 * a31)
        (b23 * a0 + b27 * a1 + b30 * a4 - b31 * a8 + b0 * a23 - b1 * a27 - b4 * a30 - b8 * a31)
        (b24 * a0 + b28 * a1 - b30 * a3 + b31 * a7 + b0 * a24 - b1 * a28 + b3 * a30 + b7 * a31)
        (b25 * a0 + b29 * a1 + b30 * a2 - b31 * a6 + b0 * a25 - b1 * a29 - b2 * a30 - b6 * a31)
        (b26 * a0 - b31 * a5 + b0 * a26 - b5 * a31)
        (b27 * a0 - b31 * a4 + b0 * a27 - b4 * a31)
        (b28 * a0 + b31 * a3 + b0 * a28 + b3 * a31)
        (b29 * a0 - b31 * a2 + b0 * a29 - b2 * a31)
        (b30 * a0 + b31 * a1 + b0 * a30 + b1 * a31)
        (b31 * a0 + b0 * a31)


{-| Multivector addition -}
add : Cga -> Cga -> Cga
add (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
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
        (a16 + b16)
        (a17 + b17)
        (a18 + b18)
        (a19 + b19)
        (a20 + b20)
        (a21 + b21)
        (a22 + b22)
        (a23 + b23)
        (a24 + b24)
        (a25 + b25)
        (a26 + b26)
        (a27 + b27)
        (a28 + b28)
        (a29 + b29)
        (a30 + b30)
        (a31 + b31)


{-| Multivector subtraction -}
sub : Cga -> Cga -> Cga
sub (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
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
        (a16 - b16)
        (a17 - b17)
        (a18 - b18)
        (a19 - b19)
        (a20 - b20)
        (a21 - b21)
        (a22 - b22)
        (a23 - b23)
        (a24 - b24)
        (a25 - b25)
        (a26 - b26)
        (a27 - b27)
        (a28 - b28)
        (a29 - b29)
        (a30 - b30)
        (a31 - b31)


{-| scalar/multivector multiplication -}
smul : Float -> Cga -> Cga
smul a (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
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
        (a * b16)
        (a * b17)
        (a * b18)
        (a * b19)
        (a * b20)
        (a * b21)
        (a * b22)
        (a * b23)
        (a * b24)
        (a * b25)
        (a * b26)
        (a * b27)
        (a * b28)
        (a * b29)
        (a * b30)
        (a * b31)


{-| multivector/scalar multiplication -}
muls : Cga -> Float -> Cga
muls (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) b =
    Cga
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
        (a16 * b)
        (a17 * b)
        (a18 * b)
        (a19 * b)
        (a20 * b)
        (a21 * b)
        (a22 * b)
        (a23 * b)
        (a24 * b)
        (a25 * b)
        (a26 * b)
        (a27 * b)
        (a28 * b)
        (a29 * b)
        (a30 * b)
        (a31 * b)


{-| scalar/multivector addition -}
sadd : Float -> Cga -> Cga
sadd a (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
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
        (b16)
        (b17)
        (b18)
        (b19)
        (b20)
        (b21)
        (b22)
        (b23)
        (b24)
        (b25)
        (b26)
        (b27)
        (b28)
        (b29)
        (b30)
        (b31)


{-| multivector/scalar addition -}
adds : Cga -> Float -> Cga
adds (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) b =
    Cga
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
        (a16)
        (a17)
        (a18)
        (a19)
        (a20)
        (a21)
        (a22)
        (a23)
        (a24)
        (a25)
        (a26)
        (a27)
        (a28)
        (a29)
        (a30)
        (a31)


{-| scalar/multivector subtraction -}
ssub : Float -> Cga -> Cga
ssub a (Cga b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31) =
    Cga
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
        (-b16)
        (-b17)
        (-b18)
        (-b19)
        (-b20)
        (-b21)
        (-b22)
        (-b23)
        (-b24)
        (-b25)
        (-b26)
        (-b27)
        (-b28)
        (-b29)
        (-b30)
        (-b31)


{-| multivector/scalar subtraction -}
subs : Cga -> Float -> Cga
subs (Cga a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31) b =
    Cga
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
        (a16)
        (a17)
        (a18)
        (a19)
        (a20)
        (a21)
        (a22)
        (a23)
        (a24)
        (a25)
        (a26)
        (a27)
        (a28)
        (a29)
        (a30)
        (a31)


{-| Norm -}
norm : Cga -> Float
norm a =
    sqrt <| abs <| get Scalar <| mul a <| conjugate a


{-| Norm of dual -}
inorm : Cga -> Float
inorm a =
    norm (dual a)


{-| Normalized multivector -}
normalized : Cga -> Cga
normalized a =
    muls a (1 / norm a)


{-| Basis multivector -}
unitScalar : Cga
unitScalar =
    set Scalar 1 zero


{-| Basis multivector -}
e1 : Cga
e1 =
    set E1 1 zero


{-| Basis multivector -}
e2 : Cga
e2 =
    set E2 1 zero


{-| Basis multivector -}
e3 : Cga
e3 =
    set E3 1 zero


{-| Basis multivector -}
e4 : Cga
e4 =
    set E4 1 zero


{-| Basis multivector -}
e5 : Cga
e5 =
    set E5 1 zero


{-| Basis multivector -}
e12 : Cga
e12 =
    set E12 1 zero


{-| Basis multivector -}
e13 : Cga
e13 =
    set E13 1 zero


{-| Basis multivector -}
e14 : Cga
e14 =
    set E14 1 zero


{-| Basis multivector -}
e15 : Cga
e15 =
    set E15 1 zero


{-| Basis multivector -}
e23 : Cga
e23 =
    set E23 1 zero


{-| Basis multivector -}
e24 : Cga
e24 =
    set E24 1 zero


{-| Basis multivector -}
e25 : Cga
e25 =
    set E25 1 zero


{-| Basis multivector -}
e34 : Cga
e34 =
    set E34 1 zero


{-| Basis multivector -}
e35 : Cga
e35 =
    set E35 1 zero


{-| Basis multivector -}
e45 : Cga
e45 =
    set E45 1 zero


{-| Basis multivector -}
e123 : Cga
e123 =
    set E123 1 zero


{-| Basis multivector -}
e124 : Cga
e124 =
    set E124 1 zero


{-| Basis multivector -}
e125 : Cga
e125 =
    set E125 1 zero


{-| Basis multivector -}
e134 : Cga
e134 =
    set E134 1 zero


{-| Basis multivector -}
e135 : Cga
e135 =
    set E135 1 zero


{-| Basis multivector -}
e145 : Cga
e145 =
    set E145 1 zero


{-| Basis multivector -}
e234 : Cga
e234 =
    set E234 1 zero


{-| Basis multivector -}
e235 : Cga
e235 =
    set E235 1 zero


{-| Basis multivector -}
e245 : Cga
e245 =
    set E245 1 zero


{-| Basis multivector -}
e345 : Cga
e345 =
    set E345 1 zero


{-| Basis multivector -}
e1234 : Cga
e1234 =
    set E1234 1 zero


{-| Basis multivector -}
e1235 : Cga
e1235 =
    set E1235 1 zero


{-| Basis multivector -}
e1245 : Cga
e1245 =
    set E1245 1 zero


{-| Basis multivector -}
e1345 : Cga
e1345 =
    set E1345 1 zero


{-| Basis multivector -}
e2345 : Cga
e2345 =
    set E2345 1 zero


{-| Basis multivector -}
e12345 : Cga
e12345 =
    set E12345 1 zero
